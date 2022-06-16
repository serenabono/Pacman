from mimetypes import init
import numpy as np
import math

class TransitionFunctionCTree():
    def __init__(self, game):
        self.game = game
        self.queue = []
        self.currentAgents = game.agents
        self.visited = []
        self.graph = {}
        self.queue_states = []
        self.numAgents = len(game.agents)
        self.probabilities = {}
        self.transitionMatrix = None
        self.numActions = None
        self.actions = None
        self.numStates = None
        self.statetoid = None
        self.computeProbabilities()

    def printGraph(self):
        pass

    def computeProbabilities(self):
        '''
        Performs BFS and simultaneously computes nonzero entries in the
        (s, a, s') matrix. Stores these in the probabilities dictionary.
        '''
        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex, "pAction": None, "prob": 1.0}) # id dictates which sprite will act next
        # add the first state to visited list
        self.visited.append(str(self.game.state))

        def hashc(obj): # to be replaced with a better hash function for saving storage
            return math.floor(hash(obj)/1000)

        #timestep = 0
        while self.queue:
            current_element = self.queue.pop()
            current, agentIdx, pact, pcoeff = current_element["state"], current_element["id"], current_element["pAction"], current_element["prob"]

            if str(current) not in self.probabilities:
                self.probabilities[str(current)] = {} 

            actions = current.getLegalActions(agentIdx)
            if agentIdx == 0:
                if self.numActions < len(actions):
                    self.numActions = len(actions)
                    self.actions = actions
                #self.numActions = max(self.numActions, len(actions))

            # for each action in the legal actions for this agent
                # compute next state after taking this action
                # we only append the state to the probabilies dict if the last sprite has acted because the 
                    # sprites all move "simultaneously"
                # somehow we need to propagate the probabilities down the tree

            # CLASSIC BFS:
            for action in actions:
                successor = current.generateSuccessor(agentIdx, action)
                # print("the current state is \n" + str(current))
                # print("the next state is: \n" + str(successor))
                if str(successor) not in self.visited:
                    self.queue.append({
                        "state": successor, "id": (agentIdx + 1) % self.numAgents, "pAction": pact, "prob": pcoeff
                    })
                    self.visited.append(str(successor))
                # KEY CHANGE: do this regardless of whether state has been visited before
                if str(successor) not in self.probabilities[str(current)]:
                    self.probabilities[str(current)][str(successor)] = {}
                    if action not in self.probabilities[str(current)][str(successor)]:
                        if agentIdx == 0: # pacman agent
                            pcoeff *= 1 #1/float(len(actions)) # FIXME: starting with no slip
                            # print "the actions to take in the previous state: "
                            # print(actions)
                            # print("the action taken previously: " + action)
                            # print("probability: %f" % pcoeff)
                            pact = action
                        else: # ghost agent
                            dist = self.currentAgents[agentIdx].getDistribution(current)
                            pcoeff *= dist[action]
                        if agentIdx == self.numAgents - 1:
                            #timestep += 1
                            #print("timestep: %d" % timestep)
                            self.probabilities[str(current)][str(successor)][pact] = pcoeff
                            # reset the transition probability
                            pcoeff = 1.0
        self.numStates = len(self.probabilities)

    def getTransitionMatrix(self):
        '''
        Converts the probabilities dictionary into a proper transition matrix.
        '''
        self.transitionMatrix = np.zeros((self.numStates, self.numStates, self.numActions))
        self.statetoid = list(self.probabilities.keys())
        for fromstate in self.probabilities.keys():
            for tostate in self.probabilities[fromstate].keys():
                for taction in self.probabilities[fromstate][tostate].keys():
                    fromstateid, tostateid, tactionid = self.statetoid.index(fromstate), self.statetoid.index(tostate), \
                        self.actions.index(taction)
                    self.transitionMatrix[fromstateid][tostateid][tactionid] = \
                        self.probabilities[fromstate][tostate][taction]
        return self.transitionMatrix