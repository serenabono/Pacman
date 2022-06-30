# projectParams.py
# ----------------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
#
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).

import numpy as np
from game import Directions, Grid
from layout import Layout
from pacman import GameState, PacmanRules, GhostRules
from noise import GaussianNoise

##############################
#  TRANSITION FUNCTION CODE  #
##############################

class TransitionFunctionTree():
    """
    Class containing all the information to generate the state transition matrix
    """

    def __init__(self, pacmanAgent, ghostAgents, layout):

        initState = GameState()
        initState.initialize(layout, layout.getNumGhosts())
        self.state = initState
        self.queue = []
        self.startingIndex = 0
        self.currentAgents = [pacmanAgent] + \
            ghostAgents[:layout.getNumGhosts()]
        self.visited = {}
        self.graph = {}
        self.numAgents = len(self.currentAgents)
        self.layout = layout
        self.nStates = (self.layout.width *
                        self.layout.height)**self.numAgents
        self.transitionMatrixDic = {}
        self.actions = {Directions.NORTH: 0, Directions.SOUTH: 1,
                        Directions.EAST: 2, Directions.WEST: 3, Directions.STOP: 4}
        self.toactions = {0: Directions.NORTH , 1:Directions.SOUTH,
                        2:Directions.EAST, 3:Directions.WEST, 4:Directions.STOP}
        self.nPossibleAcitons = len(self.actions)
        self.nActions = self.nPossibleAcitons**self.numAgents
        self.helperDic = {}

    def copy(self):
        tree = self
        tree.state = self.state
        tree.queue = self.queue
        tree.startingIndex = self.startingIndex
        tree.currentAgents = self.currentAgents
        tree.visited = self.visited
        tree.graph = self.graph
        tree.numAgents = self.numAgents
        tree.layout = self.layout
        tree.nStates = self.nStates
        tree.transitionMatrixDic = self.transitionMatrixDic
        tree.actions = self.actions
        tree.nPossibleAcitons = self.nPossibleAcitons
        tree.nActions = self.nActions
        tree.helperDic = self.helperDic

        return tree
    
    def applyNoiseToTransitionMatrix(self, **params):
        """
        Add noise to transition matrix
        """
        noiseDistribution = GaussianNoise(params)

        for fromstate in self.transitionFunction:
            for throughaction in self.transitionFunction[fromstate]:
                denom = 0
                for tostate in range(self.transitionFunction.nStates):
                    if tostate not in self.transitionFunction[fromstate][throughaction]:
                        self.transitionFunction[fromstate][throughaction][tostate] = 0
                    self.transitionFunction[fromstate][throughaction][tostate] += noiseDistribution.sample()
                    denom += self.transitionFunction[fromstate][throughaction][tostate]
                
                for tostate in self.transitionFunction[fromstate][throughaction]:
                    self.transitionFunction[fromstate][throughaction] /= denom
            
    def computeProbabilities(self):
        """
        Function to compute probabilities P(s'|s,a). Most transitions are illegal and the matrix is extremely big,
        therefore it is compressed in a dictionary containing as key the tostate value of the states and the actions
        for all non zero probability transitions.
        """
        for el in range(self.numAgents):
            self.visited[el] = {}
            self.helperDic[el] = {}

        self.queue.append(
            {"state": self.state, "id": self.startingIndex})

        while self.queue:
            current_element = self.queue.pop()

            currentelementhash = self.getHashfromState(
                current_element["state"])

            if currentelementhash not in self.helperDic[current_element["id"]]:
                self.helperDic[current_element["id"]][currentelementhash] = {}

            if current_element["id"] == 0:
                legal_actions = PacmanRules.getLegalActions(
                    current_element["state"])
            else:
                legal_actions = GhostRules.getLegalActions(
                    current_element["state"], current_element["id"])

            for action in legal_actions:
                successor_element = {}

                successor_element["id"] = (
                    current_element["id"] + 1) % self.numAgents

                if current_element["id"] == 0:
                    successor_element["state"] = GameState(
                        current_element["state"])
                    PacmanRules.applyAction(successor_element["state"], action)
                else:
                    successor_element["state"] = GameState(
                        current_element["state"])
                    GhostRules.applyAction(
                        successor_element["state"], action, current_element["id"])

                successorelelmenthash = self.getHashfromState(
                    successor_element["state"])

                if current_element["id"] == 0:
                    successor_element["prob"] = 1
                else:
                    dist = self.currentAgents[current_element["id"]].getDistribution(
                        current_element["state"])
                    successor_element["prob"] = dist[action]

                if successorelelmenthash not in self.visited[successor_element["id"]]:
                    self.visited[successor_element["id"]
                                 ][successorelelmenthash] = True
                    self.queue.append(successor_element)

                if self.actions[action] not in self.helperDic[current_element["id"]][currentelementhash]:
                    self.helperDic[current_element["id"]
                                   ][currentelementhash][self.actions[action]] = {}
                self.helperDic[current_element["id"]][currentelementhash][self.actions[action]
                                                                          ][successorelelmenthash] = successor_element["prob"]

        for currentelementhash in self.helperDic[0]:
            self.createMatrixrecursively(
                self.startingIndex, currentelementhash, [], currentelementhash, prob=1)

    def createMatrixrecursively(self, agentid, lastpacmanstate, throughactions, currentelementhash, prob):
        if currentelementhash not in self.helperDic[agentid]:
            return

        for action in self.helperDic[agentid][currentelementhash]:
            throughactions.append(action)

            for successorelementhash in self.helperDic[agentid][currentelementhash][action]:
                probel = prob * \
                    self.helperDic[agentid][currentelementhash][action][successorelementhash]
                if agentid == self.numAgents - 1:
                    throughactionhash = self.getHashfromKeys(throughactions)
                    if lastpacmanstate not in self.transitionMatrixDic:
                        self.transitionMatrixDic[lastpacmanstate] = {}
                    if throughactionhash not in self.transitionMatrixDic[lastpacmanstate]:
                        self.transitionMatrixDic[lastpacmanstate][throughactionhash] = {
                        }
                    self.transitionMatrixDic[lastpacmanstate][throughactionhash][successorelementhash] = probel
                else:
                    self.createMatrixrecursively(
                        agentid + 1, lastpacmanstate, throughactions, successorelementhash, probel)

            throughactions.pop()

    def getProbsStatesgivenAction(self, fromstate, throughactions):
        """
        Returns the prob of reaching a certain state s' given an initial state s and action a'. P(s'|s,a) is the transition probability.
        """

        fromstatehash = self.getHashfromState(fromstate)
        throughactionhash = self.getHashfromKeys(throughactions)

        probstate = {}

        try:
            for tostatehash in self.transitionMatrixDic[fromstatehash][throughactionhash]:
                probstate[tostatehash] = self.transitionMatrixDic[fromstatehash][throughactionhash][tostatehash]
        except:
            return {}
        return probstate

    def getLegalActions(self, fromstatehash, agentId):
        actlst = {}

        for throughaction in self.helperDic[agentId][fromstatehash]:
            actagent = self.getKeysfromHash(
                    throughaction, 1)[0]
            for tostatehash in self.helperDic[agentId][fromstatehash][actagent]:
                if actagent not in actlst:
                    actlst[actagent] = {}    
                actlst[actagent][tostatehash] = self.helperDic[agentId][fromstatehash][actagent][tostatehash]
              
        return actlst
    
    def getLegalStates(self, fromstatehash, actionPacman):
        """ HelpDics are not affected, only the TransitionMatrixDic"""

        actionstostateshashdict = {}
        for throughaction in self.transitionMatrixDic[fromstatehash]:
            actions = self.getKeysfromHash(throughaction, self.numAgents)
            if actions[0] == actionPacman:
                for tostatehash in self.transitionMatrixDic[fromstatehash][throughaction]:
                    for n in range(self.numAgents):
                        if n not in actionstostateshashdict:
                            actionstostateshashdict[n] = {}    
                        actionstostateshashdict[n][tostatehash] = self.transitionMatrixDic[fromstatehash][throughaction][tostatehash]  
        return actionstostateshashdict
        

    def generateSuccessor(self, state, actionstostateshashdict, agentId):
        newstate = GameState(state)
        # random weighted choice
        actiontostatehash = np.random.choice(actionstostateshashdict.keys(),1, actionstostateshashdict.values())
        listpos = self.fromBaseTen(
            actiontostatehash, self.state.data.layout.width*self.state.data.layout.height, digits=np.zeros((self.numAgents), dtype=int))
        posingrid = self.getPositionInGridCoord(listpos[agentId])
        newstate = state.movetoAnyState(agentId, posingrid)
        return newstate

    def printSlicesOfTransitionMatrix(self, fromstate):
        """
        Used for debugging Purposes
        Saves to disk csv files containing slices of the transition matrix, given an initial state fromstate.
        Each output is a matrix with dimensions nStates x nActions.
        """
        fromstatehash = self.getHashfromState(fromstate)

        for tostatehash in range(self.nStates):
            matrix = np.zeros((self.nActions))
            for throughaction in range(self.nActions):
                if fromstatehash in self.transitionMatrixDic:
                    if throughaction in self.transitionMatrixDic[throughaction]:
                        if tostatehash in self.transitionMatrixDic[fromstatehash][throughaction]:
                            matrix[throughaction] = self.transitionMatrixDic[fromstatehash][throughaction][tostatehash]

            name = "TransitionMatrixStartingAtState" + \
                str(fromstatehash)+"-"+str(tostatehash)+".csv"
            np.savetxt(name, matrix, delimiter=",")

    def printStateSlicesOfTransitionMatrix(self):
        """
        Used for debugging Purposes
        Same as above, but each slice saved has size nStates x nStates.
        """
        for throughaction in range(self.nActions):
            matrix = np.zeros((self.nStates, self.nStates))
            for fromstatehash in range(self.nStates):
                for tostatehash in range(self.nStates):
                    if fromstatehash in self.transitionMatrixDic:
                        if throughaction in self.transitionMatrixDic[throughaction]:
                            if tostatehash in self.transitionMatrixDic[fromstatehash][throughaction]:
                                matrix[fromstatehash][tostatehash] = self.transitionMatrixDic[fromstatehash][throughaction][tostatehash]
            name = "TransitionMatrixForAction" + \
                str(throughaction)+".csv"
            np.savetxt(name, matrix, delimiter=",")

    def getPositionInWorldCoord(self, agent):
        """
        Coordinates used by the hash function. Converts the grid coordinates into positive numbers from o to n, where n is layout.width * layout.height. 
        The initial position is the bottom left corner.
        """
        return self.state.data.layout.width * agent[1] + agent[0]

    def getPositionInGridCoord(self, agent):
        """
        Converts world coordinates into tuples (x,y) representing the grid position of each agent. The coordinate system originates in the bottom left corner
        """
        return (agent / self.state.data.layout.width, agent % self.state.data.layout.width)

    def getHashfromState(self, state):
        """
        Returns the tostate encoding of each state. It aims at returning a 1-to-1 mapping between states and naturals.
        It defines an ordering among states and enables a meaningful matrix representation.
        It works by leveraging the position of the agents and encoding it in a base [grid height x grid width] number

        The origin of the grid is the lower left corner with coordinates (0,0)

        Example:

        %%%%%%%%%%
        %o%  P..G%     [10 x 3]
        %%%%%%%%%%

        pacman  ghost
        16      18

        [16 18] base 30 = 178 base 10
        """
        pacman = state.data.agentStates[0]
        ghosts = state.data.agentStates[1:]

        pacmanpos = self.getPositionInWorldCoord(
            [pacman.configuration.pos[0], pacman.configuration.pos[1]])
        ghostspos = []
        for ghost in ghosts:
            ghostspos.append(self.getPositionInWorldCoord(
                [ghost.configuration.pos[0], ghost.configuration.pos[1]]))

        return self.toBaseTen([pacmanpos] + ghostspos, self.state.data.layout.width*self.state.data.layout.height)

    def getStatefromHash(self, fromstate, tostate):
        """
        Reverts tostate and generates the string of the corresponding state
        """

        list = self.fromBaseTen(
            tostate, self.state.data.layout.width*self.state.data.layout.height, digits=np.zeros((self.numAgents), dtype=int))

        pacman = self.getPositionInGridCoord(list[0])
        ghosts = []

        for ghost in list[1:]:
            ghosts.append(self.getPositionInGridCoord(ghost))

        return self.generateLayout(pacman, ghosts, fromstate)

    def generateLayout(self, pacmanpos, ghostspos, fromstate):
        map = Grid(self.state.data.layout.width,
                   self.state.data.layout.height)
        for w in range(self.state.data.layout.width):
            for h in range(self.state.data.layout.height):
                map[w][h] = fromstate.data._foodWallStr(
                    fromstate.data.layout.food[w][h], fromstate.data.layout.walls[w][h])

        row, col = pacmanpos
        map[col][row] = 'P'
        for ghostpos in ghostspos:
            grow, gcol = ghostpos
            map[gcol][grow] = 'G'

        lay = Layout([l.strip() for l in str(map).split('\n')])

        state = GameState()
        state.initialize(lay, len(ghostspos))
        return state

    def getKeysfromHash(self, action, numAgents):

        list = self.fromBaseTen(
            action, self.nPossibleAcitons, digits=np.zeros((numAgents), dtype=int))

        return list

    def getHashfromKeys(self, keys):
        """
        Encodes the actions similarly to the getHashfromState function
        """
        digits = []
        for key in keys:
            digits.append(key)

        return self.toBaseTen(digits, self.nPossibleAcitons)

    def toBaseTen(self, digits, b):

        num = 0
        for idx in range(len(digits)):
            num += digits[idx]*(b**idx)

        return int(num)

    def fromBaseTen(self, n, b, digits):

        idx = 0
        while n:
            digits[idx] = int(n % b)
            n //= b
            idx += 1

        return digits
