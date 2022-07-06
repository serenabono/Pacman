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

import util

class SemanticNoise():
    """
    Class responsible of adding semantic noise to the transition function
    """

    def __init__(self, transitionMatrixTree):
        self.transitionMatrixTree = transitionMatrixTree
    """
    P(s'|s,a) is implemented as a dictionary of the type TransitionFunction[fromstate][throughaction][tostate], the rules of probability have to be respected:
    sum(TransitionFunction[fromstate][throughaction]) = 1. 
    """
    def generateToBePerturbedStatesMap(self):
        util.raiseNotDefined()

class DistributedNoise(SemanticNoise):

    def generateToBePerturbedStatesMap(self):
        stateMap = {}
        for fromstatehash in range(self.transitionMatrixTree.nStates):
            if fromstatehash not in stateMap:
                stateMap[fromstatehash] = {}
            for throughaction in range(self.transitionMatrixTree.nPossibleAcitons):
                if throughaction not in stateMap[fromstatehash]:
                    stateMap[fromstatehash][throughaction] = {}
                for tostatehash in range(self.transitionMatrixTree.nStates):
                    stateMap[fromstatehash][throughaction][tostatehash] = True

        return stateMap 

class NoiseToNextWallStates(SemanticNoise):

    def generateToBePerturbedStatesMap(self, layout):
        stateMap = {}

        for fromstatehash in self.transitionMatrixTree.transitionMatrixDic:
            for throughaction in self.transitionMatrixTree.transitionMatrixDic[fromstatehash]:
                pacman, _ = self.transitionMatrixTree.getPositionAgentsInGridCoordfromHash(fromstatehash)
                positions = []
                positions.append((pacman[0] + 1,pacman[1]))
                positions.append((pacman[0] - 1,pacman[1]))
                positions.append((pacman[0], pacman[1] + 1))
                positions.append((pacman[0], pacman[1] - 1))
                
                for pos in positions:
                    try:
                        if layout.walls[pos[1]][pos[0]]:
                            for tostatehash in self.transitionMatrixTree.transitionMatrixDic[fromstatehash][throughaction]:
                                _, ghosts = self.transitionMatrixTree.getPositionAgentsInGridCoordfromHash(tostatehash)
                                trapstatehash = self.transitionMatrixTree.getHashfromAgentPositionsInGridCoord(pos, ghosts)
                                if fromstatehash not in stateMap:
                                    stateMap[fromstatehash] = {}
                                if throughaction not in stateMap[fromstatehash]:
                                    stateMap[fromstatehash][throughaction] = {}
                                stateMap[fromstatehash][throughaction][trapstatehash] = True
                    except:
                        continue
                        
        return stateMap