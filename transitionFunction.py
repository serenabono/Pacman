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

from audioop import tostereo
from mimetypes import init
from os import stat
import numpy as np
from game import Directions, Grid, Actions


##############################
#  TRANSITION FUNCTION CODE  #
##############################

class TransitionFunctionTree():
    """
    Class containing all the information to generate the state transition matrix
    """

    def __init__(self, game):

        self.game = game
        self.queue = []
        self.currentAgents = self.game.agents
        self.visited = {}
        self.graph = {}
        self.queue_states = []
        self.numAgents = len(game.agents)  # adding food and capsules
        self.nStates = (self.game.state.data.layout.width *
                        self.game.state.data.layout.height)**self.numAgents
        self.nActions = 5**self.numAgents
        # self.transitionMatrix = np.zeros((self.nStates, self.nStates, 5**self.numAgents))
        self.transitionMatrixDic = {}
        self.actions = {Directions.NORTH: 0, Directions.SOUTH: 1,
                        Directions.EAST: 2, Directions.WEST: 3, Directions.STOP: 4}
        self.toactions = {0: Directions.NORTH, 1: Directions.SOUTH,
                          2: Directions.EAST, 3: Directions.WEST, 4: Directions.STOP}

    def computeProbabilities(self):
        """
        Function to compute probabilities P(s'|s,a). Most transitions are illegal and the matrix is extremely big,
        therefore it is compressed in a dictionary containing as key the tostate value of the states and the actions
        for all non zero probability transitions.
        """

        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex, "prob": None, "lastpacmanstate": self.getHashfromState(self.game.state), "actions": None, "ls": None})

        while self.queue:
            current_element = self.queue.pop()
            legal_acitons = current_element["state"].getLegalActions(
                current_element["id"])

            if self.getHashfromState(
                    current_element["state"]) not in self.transitionMatrixDic:
                self.transitionMatrixDic[self.getHashfromState(
                    current_element["state"])] = {}

            for action in legal_acitons:
                successor = current_element["state"].generateSuccessor(
                    current_element["id"], action)
                successor_element = {}
                successor_element["state"] = successor

                if current_element["id"] == 0:
                    successor_element["prob"] = (1/float(len(legal_acitons)))
                    successor_element["actions"] = [action]
                    successor_element["lastpacmanstate"] = self.getHashfromState(
                        current_element["state"])
                    successor_element["ls"] = current_element["state"]

                else:
                    dist = self.currentAgents[current_element["id"]].getDistribution(
                        current_element["state"])
                    successor_element["prob"] = current_element["prob"] * \
                        dist[action]
                    successor_element["actions"] = current_element["actions"] + [action]
                    successor_element["lastpacmanstate"] = current_element["lastpacmanstate"]
                    successor_element["ls"] = current_element["state"]

                successor_element["id"] = (
                    current_element["id"] + 1) % self.numAgents

                if str(successor) not in self.visited:
                    self.queue.append(successor_element)
                    self.visited[str(successor)] = True

                if (successor_element["id"] % self.numAgents) == 0:
                    # toobig!!!
                    # self.transitionMatrix[current_element["lastpacmanstate"]][self.getHashfromState(successor)][self.getHashfromKeys(current_element["actions"])] = current_element["prob"]
                    if self.getHashfromState(
                            successor_element["state"]) not in self.transitionMatrixDic[successor_element["lastpacmanstate"]]:
                        self.transitionMatrixDic[successor_element["lastpacmanstate"]][self.getHashfromState(
                            successor_element["state"])] = {}
                    self.transitionMatrixDic[successor_element["lastpacmanstate"]][self.getHashfromState(
                        successor_element["state"])][self.getHashfromKeys(successor_element["actions"])] = successor_element["prob"]


    def printSlicesOfTransitionMatrix(self, fromstate):
        """
        Saves to disk csv files containing slices of the transition matrix, given an initial state tostate.
        Each output is a matrix with dimensions nStates x nActions.
        """
        fromstatehash = self.getHashfromState(fromstate)

        for tostatehash in range(self.nStates):
            matrix = np.zeros((self.nStates, self.nActions))
            for throughaction in range(self.nActions):
                if fromstatehash in self.transitionMatrixDic:
                    if tostatehash in self.transitionMatrixDic[fromstatehash]:
                        if throughaction in self.transitionMatrixDic[fromstatehash][tostatehash]:
                            matrix[fromstatehash,
                                   throughaction] = self.transitionMatrixDic[fromstatehash][tostatehash][throughaction]

            name = "TransitionMatrixStaetingAtState" + \
                str(fromstatehash)+"-"+str(tostatehash)+".csv"
            np.savetxt(name, matrix, delimiter=",")

    def getHashfromState(self, state):
        """
        Returns the tostate encoding of each state. It aims at returning a 1-to-1 mapping between states and naturals.
        It defines an ordering among states and enables a meaningful matrix representation.
        It works by leveraging the position of the agents and encoding it in a base [grid height x grid width] number

        Example:

        %%%%%%%%%%%
        %o%  P.. G%     [10 x 3]
        %%%%%%%%%%%

        pacman  ghost
        16      20

        [16 20] base 30 = 180 base 10
        """

        pacman = state.data.agentStates[0]
        ghosts = state.data.agentStates[1:]

        pacmanpos = self.game.state.data.layout.width * \
            pacman.configuration.pos[1] + pacman.configuration.pos[0]
        ghostspos = []
        for ghost in ghosts:
            ghostspos.append(self.game.state.data.layout.width *
                             ghost.configuration.pos[1] + ghost.configuration.pos[0])
        digits = [pacmanpos] + ghostspos

        return self.toBaseTen(digits, self.game.state.data.layout.width*self.game.state.data.layout.height)

    def getStatefromHash(self, fromstate, tostate):
        """
        Reverts tostate and generates the string of the corresponding state
        """

        list = self.fromBaseTen(
            tostate, self.game.state.data.layout.width*self.game.state.data.layout.height, digits=np.zeros((self.numAgents), dtype=int))

        pacmanpos = ((list[0] /
                     self.game.state.data.layout.width, list[0] % self.game.state.data.layout.width))
        ghostspos = []

        for ghost in list[1:]:
            ghostspos.append((ghost /
                             self.game.state.data.layout.width, ghost % self.game.state.data.layout.width))

        return self.generateLayout(pacmanpos, ghostspos, fromstate)

    def generateLayout(self, pacmanpos, ghostspos, fromstate):
        map = Grid(self.game.state.data.layout.width,
                   self.game.state.data.layout.height)
        for w in range(self.game.state.data.layout.width):
            for h in range(self.game.state.data.layout.height):
                map[w][h] = fromstate.data._foodWallStr(
                    fromstate.data.layout.food[w][h], fromstate.data.layout.walls[w][h])

        row, col = pacmanpos
        map[col][row] = 'P'
        for ghostpos in ghostspos:
            grow, gcol = ghostpos
            map[gcol][grow] = 'G'

        return map

    def getKeysfromHash(self, action):

        list = self.fromBaseTen(
            action, 5, digits=np.zeros((self.numAgents), dtype=int))

        return list

    def getHashfromKeys(self, keys):
        """
        Encodes the actions similarly to the getHashfromState function
        """
        digits = []
        for key in keys:
            digits.append(self.actions[key])

        return self.toBaseTen(digits, 5)

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
