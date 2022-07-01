# ghostAgents.py
# --------------
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


from dis import dis
from game import Agent
from game import Actions
from game import Directions
from pacman import GhostRules, GameState
import random
from util import manhattanDistance
import util


class GhostAgent(Agent):
    def __init__(self, index):
        self.index = index

    def getAction(self, state, transitionMatrix):
        dist, actlst = self.getPerturbedDistribution(state, transitionMatrix)
        if len(dist) == 0:
            return Directions.STOP
        else:
            action = util.chooseFromDistribution(dist)
            return actlst[transitionMatrix.actions[action]]

    def getPerturbedDistribution(self, state, transitionMatrix):
        "Returns a Counter encoding a distribution over actions from the provided state."
        util.raiseNotDefined()

    def getDistribution(self, state):
        "Returns a Counter encoding a distribution over actions from the provided state."
        util.raiseNotDefined()


class RandomGhost(GhostAgent):
    "A ghost that chooses a legal action uniformly at random."

    def getDistribution(self, state):
        dist = util.Counter()
        for a in GhostRules.getLegalActions(state, self.index):
            dist[a] = 1.0
        dist.normalize()
        return dist

    def getPerturbedDistribution(self, state, transitionMatrix):
        dist = util.Counter()
        actlst = transitionMatrix.getLegalActionsAgent(
            transitionMatrix.getHashfromState(state), self.index)
        
        probs = {}
        for a in actlst.keys():
            probs[a] = sum(actlst[a])
        
        for a in probs:
            dist[transitionMatrix.toactions[a]] = probs[a]

        return dist, actlst


class DirectionalGhost(GhostAgent):
    "A ghost that prefers to rush Pacman, or flee when scared."

    def __init__(self, index, prob_attack=0.8, prob_scaredFlee=0.8):
        self.index = index
        self.prob_attack = prob_attack
        self.prob_scaredFlee = prob_scaredFlee

    def getDistribution(self, state):
        # Read variables from state
        ghostState = state.getGhostState(self.index)
        legalActions = state.getLegalActions(self.index)
        pos = state.getGhostPosition(self.index)
        isScared = ghostState.scaredTimer > 0

        speed = 1
        if isScared:
            speed = 0.5

        actionVectors = [Actions.directionToVector(
            a, speed) for a in legalActions]
        newPositions = [(pos[0]+a[0], pos[1]+a[1]) for a in actionVectors]
        pacmanPosition = state.getPacmanPosition()

        # Select best actions given the state
        distancesToPacman = [manhattanDistance(
            pos, pacmanPosition) for pos in newPositions]
        if isScared:
            bestScore = max(distancesToPacman)
            bestProb = self.prob_scaredFlee
        else:
            bestScore = min(distancesToPacman)
            bestProb = self.prob_attack
        bestActions = [action for action, distance in zip(
            legalActions, distancesToPacman) if distance == bestScore]

        # Construct distribution
        dist = util.Counter()
        for a in bestActions:
            dist[a] = bestProb / len(bestActions)
        for a in legalActions:
            dist[a] += (1-bestProb) / len(legalActions)
        dist.normalize()
        return dist
