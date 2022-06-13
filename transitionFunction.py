from mimetypes import init
import numpy as np

class TransitionFunctionTree():
    def __init__(self, game):
        self.game = game
        self.queue = []
        self.currentAgents = game.agents
        self.visited = {}
        self.graph = {}
        self.queue_states = []
        self.numAgents = len(game.agents)
        self.probabilities = {}
        #self.nStates = (self.game.state.layout.width* self.game.state.layout.haight) ^ self.numAgents
        #self.probabilities = np.zeros((self.nStates,self.nStates, 5))

    def computeProbabilities(self):
        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex})

        while self.queue:
            current_element = self.queue.pop()
            current, agentIdx = current_element["state"], current_element["id"]

            if current not in self.probabilities:
                self.probabilities[str(current)] = {} # CHLOE thought: save space by making state id the index here?

            if agentIdx not in self.visited:
                self.visited[agentIdx] = {}

            actions = current.getLegalActions(agentIdx)

            for action in actions:
                successor = current.generateSuccessor(agentIdx, action) # CHLOE Question: we may want to force ghosts to be deterministic here, right?
                if str(successor) not in self.visited[agentIdx]:
                    if str(successor) not in self.probabilities[str(current)]:
                        self.probabilities[str(current)][str(successor)] = {}
                        if action not in self.probabilities[str(current)][str(successor)]:
                            #if PACMAN the prob is 1/len(actions)
                            if agentIdx == 0:
                                self.probabilities[str(current)][str(successor)][action] = 1 / len(actions)
                            #if GHOST it depends on ghost distribution
                            else:
                                dist = self.currentAgents[agentIdx].getDistribution(current)
                                self.probabilities[str(current)][str(successor)][action] = dist[action]
                    self.visited[agentIdx][str(successor)] = True
                    self.queue.append(
                        {"state": successor, "id": (agentIdx + 1) % self.numAgents})
                    if str(current) not in self.graph:
                        self.graph[str(current)] = []
                    self.graph[str(current)].append({str(successor), action})
            