from mimetypes import init
from os import stat
import numpy as np
from game import Grid

class TransitionFunctionTree():
    def __init__(self, game):
        self.game = game
        self.queue = []
        self.currentAgents = self.game.agents
        self.visited = {}
        self.graph = {}
        self.queue_states = []
        self.numAgents = len(game.agents)
        self.nStates = (self.game.state.data.layout.width*self.game.state.data.layout.height)**self.numAgents
        self.nActions = 5**self.numAgents
        # self.transitionMatrix = np.zeros((self.nStates, self.nStates, 5**self.numAgents))
        self.transitionMatrixDic = {}

    def computeProbabilities(self):

        self.queue.append(
            {"state": self.game.state, "id": self.game.startingIndex, "prob": None, "lastpacmanstate": self.getHashfromState(self.game.state), "actions" : None})

        while self.queue:
            current_element = self.queue.pop()
            legal_acitons = current_element["state"].getLegalActions(current_element["id"])
            self.transitionMatrixDic[self.getHashfromState(current_element["state"])] = {}

            for action in legal_acitons:
                successor = current_element["state"].generateSuccessor(current_element["id"], action)
                successor_element = {}
                successor_element["state"] = successor   
                
                if current_element["id"] == 0:
                    successor_element["prob"] = (1/float(len(legal_acitons)))
                    successor_element["actions"] = [action]
                    successor_element["lastpacmanstate"] = self.getHashfromState(current_element["state"])

                else:
                    dist = self.currentAgents[current_element["id"]].getDistribution(current_element["state"])                    
                    successor_element["prob"] = current_element["prob"]*dist[action]
                    successor_element["actions"] = current_element["actions"] + [action]
                    successor_element["lastpacmanstate"] = current_element["lastpacmanstate"]
                
                successor_element["id"] = (current_element["id"] + 1) % self.numAgents
                
                if str(successor) not in self.visited:   
                    self.queue.append(successor_element)
                    self.visited[str(successor)] = True

                if (current_element["id"] + 1) % self.numAgents == 0:
                    # toobig!!!
                    # self.transitionMatrix[current_element["lastpacmanstate"]][self.getHashfromState(successor)][self.getHashKeys(current_element["actions"])] = current_element["prob"]
                    self.transitionMatrixDic[successor_element["lastpacmanstate"]][self.getHashfromState(successor_element["state"])] = {}
                    self.transitionMatrixDic[successor_element["lastpacmanstate"]][self.getHashfromState(successor_element["state"])][self.getHashKeys(successor_element["actions"])] = successor_element["prob"]

    
    def printSlicesOfTransitionMatrix(self, fromstate):
        matrix = np.zeros((self.nStates, self.nActions))   
        hashfromstate = self.getStatefromHash(fromstate)               
        for tostate in range(self.nStates):
            hashtostate = self.getStatefromHash(tostate)
            if hashfromstate in self.transitionMatrixDic:
                if hashtostate in self.transitionMatrixDic[hashfromstate]:
                    matrix[hashfromstate] = self.transitionMatrixDic[hashfromstate][hashtostate]
            name = "TransitionMatrixStaetingAtState"+str(fromstate)+"-"+str(tostate)+".csv"
            np.savetxt(name, matrix, delimiter=",")

    def getHashfromState(self,state):
        pacman = state.data.agentStates[0]
        ghosts = state.data.agentStates[1:]

        # TODO: somehow introduce food int the state representation

        pacmanpos = self.game.state.data.layout.width*pacman.configuration.pos[1] + pacman.configuration.pos[0]
        ghostspos = []
        for ghost in ghosts:
            ghostspos.append(self.game.state.data.layout.width*ghost.configuration.pos[1] + ghost.configuration.pos[0])
        digits = [pacmanpos] + ghostspos

        return self.toBaseTen(digits, self.game.state.data.layout.width*self.game.state.data.layout.height)
    
    def getStatefromHash(self, hash):

        list = self.fromBaseTen(hash, self.game.state.data.layout.width*self.game.state.data.layout.height)
        #   PACMAN position
        pacmanpos = ((((list[0]-(list[0] % self.game.state.data.layout.width)) // self.game.state.data.layout.height), list[0] % self.game.state.data.layout.width))
        ghostspos = []

        for ghost in list[1:]:
            ghostspos.append((((ghost-(ghost % self.game.state.data.layout.width))// self.game.state.data.layout.height), ghost % self.game.state.data.layout.width))
        
        return self.generateLayout(pacmanpos, ghostspos)

    def generateLayout(self, pacmanpos, ghostspos):
        map = Grid(self.game.state.data.layout.width, self.game.state.data.layout.height)
        for w in range(self.game.state.data.layout.width):
            for h in range(self.game.state.data.layout.height):
                map[w][h] = self.game.state.data._foodWallStr(False, self.game.state.data.layout.walls[w][h])
        
        row, col = pacmanpos
        map[col][row] = 'P'
        for ghostpos in ghostspos:
            grow, gcol = ghostpos
            map[gcol][grow] = 'G'

        return map

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
    
    def fromBaseTen(self, n, b):
        if n == 0:
            return [0]
        digits = []
        while n:
            digits.append(int(n % b))
            n //= b
        
        return digits[::-1]
        
        