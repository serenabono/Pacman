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
        #self.nStates = (self.game.state.layout.width* self.game.state.layout.haight) ^ self.numAgents
        #self.probabilities = np.zeros((self.nStates,self.nStates, 5))

        # the graph should be a tree?? do I want to store a tree here?
        # for clarity purposes???

    def printGraph(self):
        pass


    def computeProbabilities(self):
        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex, "pAction": None, "prob": 1.0}) # id dictates which sprite will act next

        def hashc(obj):
            return math.floor(hash(obj)/1000)

        timestep = 0
        while self.queue:
            current_element = self.queue.pop()
            current, agentIdx, pact, pcoeff = current_element["state"], current_element["id"], current_element["pAction"], current_element["prob"]

            if str(current) not in self.probabilities:
                self.probabilities[str(current)] = {} 

            actions = current.getLegalActions(agentIdx)

            # for each action in the legal actions for this agent
                # compute next state after taking this action
                # we only append the state to the probabilies dict if the last sprite has acted because the 
                    # sprites all move "simultaneously"
                # somehow we need to propagate the probabilities down the tree
        
            for action in actions:
                successor = current.generateSuccessor(agentIdx, action)
                if str(successor) not in self.visited:
                    print("the current state is \n" + str(current))
                    print("the next state is: \n" + str(successor))
                    # print("visited list: ")
                    # print(self.visited[agentIdx])
                    # print "length of visted list: %d" % len(self.visited[agentIdx])
                    if str(successor) not in self.probabilities[str(current)]:
                    #if True: # I don't think we need this check
                        self.probabilities[str(current)][str(successor)] = {}
                        if action not in self.probabilities[str(current)][str(successor)]:
                        #if True:
                            if agentIdx == 0: # pacman agent
                                pcoeff *= 1/float(len(actions))
                                print "the actions to take in the previous state: "
                                print(actions)
                                print("the action taken previously: " + action)
                                print("probability: %f" % pcoeff)
                                pact = action
                            else: # ghost agent
                                dist = self.currentAgents[agentIdx].getDistribution(current)
                                pcoeff *= dist[action]
                            if agentIdx == self.numAgents - 1:
                                timestep += 1
                                print("timestep: %d" % timestep)
                                self.probabilities[str(current)][str(successor)][pact] = pcoeff
                                # reset the transition probability
                                pcoeff = 1.0
                    # append to the queue
                    self.queue.append({
                        "state": successor, "id": (agentIdx + 1) % self.numAgents, "pAction": pact, "prob": pcoeff
                    })
                    self.visited.append(str(successor))
                
            # for action in actions:
            #     successor = current.generateSuccessor(agentIdx, action)
            #     if hash(successor) not in self.visited[agentIdx]:
            #         if hash(successor) not in self.probabilities[hash(current)]:
            #             self.probabilities[str(current)][str(successor)] = {}
            #             if action not in self.probabilities[str(current)][str(successor)]:
            #                 #if PACMAN the prob is 1/len(actions)
            #                 if agentIdx == 0:
            #                     self.probabilities[str(current)][str(successor)][action] = 1 / len(actions)
            #                 #if GHOST it depends on ghost distribution
            #                 else:
            #                     dist = self.currentAgents[agentIdx].getDistribution(current)
            #                     self.probabilities[str(current)][str(successor)][action] = dist[action]
            #         self.visited[agentIdx][str(successor)] = True
            #         self.queue.append(
            #             {"state": successor, "id": (agentIdx + 1) % self.numAgents})
            #         if str(current) not in self.graph:
            #             self.graph[str(current)] = []
            #         self.graph[str(current)].append({str(successor), action})
            