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
        self.transitionMatrix = np.zeros((self.nStates, self.nStates, 5^self.numAgents))

    def computeProbabilities(self):

        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex, "prob": 1, "lastpacmanstate": self.getHashState(self.game.state), "actions" : list()})

        while self.queue:
            current_element = self.queue.pop()
            print(current_element)
            legal_acitons = current_element["state"].getLegalActions(current_element["id"])
            for action in legal_acitons:
                successor = current_element["state"].generateSuccessor(current_element["id"], action)
                if str(successor) not in self.visited:
                    self.visited[str(successor)] = True
                    if current_element["id"] == 0:
                        prob = 1/float(len(legal_acitons))
                    else:
                        dist = self.currentAgents[current_element["id"]].getDistribution(current_element["state"])
                        prob = dist[action]
                    
                    if (current_element["id"] + 1) % self.numAgents:
                        if not current_element["actions"]:
                            current_element["actions"] = [] 
                        self.queue.append({"state": successor, "id": (current_element["id"] + 1) % self.numAgents, "prob": current_element["prob"]*prob, "lastpacmanstate": current_element["lastpacmanstate"], "actions" : current_element["actions"].append(action)})
                    else:
                        self.transitionMatrix[current_element["lastpacmanstate"]][self.getHashState(current_element["state"])] = current_element["prob"]*prob
                        self.queue.append({"state": successor, "id": (current_element["id"] + 1) % self.numAgents, "prob": prob, "lastpacmanstate": self.getHashState(successor), "actions" : list()})

    def getHashState(self,state):
        pacman = state.data.agentStates[0]
        ghosts = state.data.agentStates[1:]

        pacmanpos = str(self.game.state.data.layout.width*pacman.configuration.pos[1] + pacman.configuration.pos[0])

        ghostspos = []
        for ghost in ghosts:
            ghostspos.append(str(self.game.state.data.layout.width*ghost.configuration.pos[1] + ghost.configuration.pos[0]))
        
        print(pacmanpos, " ", ghostspos)
        rawnum = int("".join([pacmanpos] + ghostspos))

        return self.numberToBase(rawnum, self.game.state.data.layout.width*self.game.state.data.layout.height)

    def getHashKeys(self, keys):
        actions = {"NORTH": 0, "SOUTH": 1, "EAST": 2, "WEST":3, "STOP": 4}

        digit = ""
        for key in keys:
            digit += actions[key]
        
        return self.numberToBase(int(digit), 5)

    def numberToBase(self, n, b):
        if n == 0:
            return [0]
        digits = []
        while n:
            digits.append(str(int(n % b)))
            n //= b
        
        print(digits[::-1])
        return int("".join(digits[::-1]))