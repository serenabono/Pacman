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
        self.nStates = (self.game.state.data.layout.width* self.game.state.data.layout.height) ^ self.numAgents
        self.transitionMatrix = np.zeros((self.nStates,self.nStates, 5^self.numAgents))

    def computeProbabilities(self):
        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex})

        temp = {}
        temp["root"] = []
        temp["root"].append(str(self.game.state))
        probabilities = {}

        nextIsPacmanLevel = False
        rootInitialized = False

        while self.queue:
            current_element = self.queue.pop()
            current, agentIdx = current_element["state"], current_element["id"]

            if current not in temp:
                temp[str(current)] = [] # CHLOE thought: save space by making state id the index here?
                probabilities[str(current)] = {}


            actions = current.getLegalActions(agentIdx)

            for action in actions:
                successor = current.generateSuccessor(agentIdx, action) # CHLOE Question: we may want to force ghosts to be deterministic here, right?
                if str(successor) not in self.visited:
                    probabilities[str(current)][str(successor)] = {}
                    if action not in probabilities[str(current)][str(successor)]:
                        #if PACMAN the prob is 1/len(actions)
                        if agentIdx == 0:
                            probabilities[str(current)][str(successor)][action] = 1 / len(actions)
                            print(1/len(actions))
                        #if GHOST it depends on ghost distribution
                        else:
                            dist = self.currentAgents[agentIdx].getDistribution(current)
                            probabilities[str(current)][str(successor)][action] = dist[action]
                            print(dist[action])
                    self.visited[str(successor)] = True
                    self.queue.append(
                        {"state": successor, "id": (agentIdx + 1) % self.numAgents})
                                       
                    temp[str(current)].append(str(successor))
            
            #   if next state is pacman
            if (agentIdx + 1) % self.numAgents == 0: 
                nextIsPacmanLevel = True
            else:
                nextIsPacmanLevel = False
                rootInitialized = False
            
            if not rootInitialized and nextIsPacmanLevel:
                #   compute all possible path and update root
                prob = 1

                allPaths = []
                allPaths = self.get_paths(temp)

                for path in allPaths:
                    prev = path[1]
                    for state in path[2:]:
                        prob = 1
                        key = []
                        for action in probabilities[prev][state]:
                            prob*= probabilities[prev][state][action]
                            key.append(action)
                        
                        # assign value to matrix
                        initialstatevalue = self.getHashState(path[0])
                        finalstatevalue = self.getHashState(current)
                        aciton = self.getHashKeys(key)
                        self.transitionMatrix[initialstatevalue][finalstatevalue][aciton] = prob
                
                temp["root"] = []
                rootInitialized = True
            
            if rootInitialized and nextIsPacmanLevel:
                temp["root"].append(str(current))

            
    def get_paths(self, temp, s = "root", c = []):
        if s not in temp:
            yield c+[s]
        elif not temp[s]:
            yield c+[s]
        else:
            for i in temp[s]:
                for j in self.get_paths(temp, s=i, c=c+[s]):
                    yield j 


    def getHashState(self,state):
        #pacman = state.data.getPacmanPosition()
        pass

    def getHashKeys(self, keys):
        pass


            