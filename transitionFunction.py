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
        self.nStates = (self.game.state.data.layout.width*self.game.state.data.layout.height)**self.numAgents
        self.transitionMatrix = np.zeros((self.nStates, self.nStates, 5**self.numAgents))

    def computeProbabilities(self):

        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex, "prob": None, "lastpacmanstate": self.getHashState(self.game.state), "actions" : None})

        while self.queue:
            current_element = self.queue.pop()
            legal_acitons = current_element["state"].getLegalActions(current_element["id"])
            for action in legal_acitons:
                successor = current_element["state"].generateSuccessor(current_element["id"], action)
                print(str(successor))
                flag = False
                if str(successor) not in self.visited:
                    flag = True
                    self.visited[str(successor)] = True      
                
                if current_element["id"] == 0:
                    
                    current_element["prob"] = (1/float(len(legal_acitons)))
                    current_element["actions"] = [action]
                    current_element["lastpacmanstate"] = self.getHashState(current_element["state"])

                    if flag: self.queue.append({"state": successor, "id": (current_element["id"] + 1) % self.numAgents, "prob": current_element["prob"], "lastpacmanstate": current_element["lastpacmanstate"] , "actions" : [action]})
                else:
                    dist = self.currentAgents[current_element["id"]].getDistribution(current_element["state"])
                    
                    current_element["prob"] *= dist[action]
                    current_element["actions"].append(action)

                    if flag: self.queue.append({"state": successor, "id": (current_element["id"] + 1) % self.numAgents, "prob": current_element["prob"], "lastpacmanstate": current_element["lastpacmanstate"],  "actions" : current_element["actions"]})

                if (current_element["id"] + 1) % self.numAgents == 0:
                    self.transitionMatrix[current_element["lastpacmanstate"]][self.getHashState(successor)][self.getHashKeys(current_element["actions"])] = current_element["prob"]
        
    
    def printSlicesOfTransitionMatrix(self):
        for fromstate in range(len(self.transitionMatrix)):   
            stateId = (fromstate)
            name = "TransitionMatrixStaetingAtState"+str(stateId)+".csv"
            np.savetxt(name, self.transitionMatrix[fromstate], delimiter=",")
        
    
    def getHashState(self,state):
        pacman = state.data.agentStates[0]
        ghosts = state.data.agentStates[1:]

        pacmanpos = self.game.state.data.layout.width*pacman.configuration.pos[1] + pacman.configuration.pos[0]

        ghostspos = []
        for ghost in ghosts:
            ghostspos.append(self.game.state.data.layout.width*ghost.configuration.pos[1] + ghost.configuration.pos[0])
        
        digits = [pacmanpos] + ghostspos

        return self.toBaseTen(digits, self.game.state.data.layout.width*self.game.state.data.layout.height)

    def getHashKeys(self, keys):
        actions = {"North": 0, "South": 1, "East": 2, "West":3, "Stop": 4}

        digits = []
        for key in keys:
            digits.append(actions[key])
        
        return self.toBaseTen(digits,5)

    def toBaseTen(self, digits, b):
        
        num = 0
        for idx in range(len(digits)):
            num += digits[idx]*(b**idx)

        return int(num)

        
        