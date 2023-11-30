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


from game import Agent
from game import Actions
from game import Directions
from pacman import GhostRules
from util import manhattanDistance
import util

class GhostAgent( Agent ):
    def __init__( self, index ):
        self.prob = prob
        self.index = index

    def getAction( self, state, actlist, ensemble_agent = None):
        dist = {}
        for a in actlist.keys():
            dist[a] = sum(actlist[a].values())
        dist = util.Counter(dist)
        if len(dist) == 0:
            return Directions.STOP
        else:
            return actlist[util.chooseFromDistribution( dist )]

    def getDistribution(self, state):
        "Returns a Counter encoding a distribution over actions from the provided state."
        util.raiseNotDefined()

class RandomGhost( GhostAgent ):
    def __init__( self, index, prob=0.5):
        self.prob = prob
        self.index = index
    "A ghost that chooses a legal action uniformly at random."
    def getDistribution( self, state ):
        dist = util.Counter()
        for a in GhostRules.getLegalActions(state, self.index ): dist[a] = 1.0
        dist.normalize()
        return dist

class MoveMostlyWestGhost( GhostAgent ):
    "A ghost that chooses a legal action uniformly at random."
    def __init__( self, index, prob=0.5):
        self.prob = prob
        self.index = index

    def getDistribution( self, state ):
        dist = util.Counter()
        legal_actions = GhostRules.getLegalActions(state, self.index) 
        if Directions.WEST not in legal_actions:
            for a in GhostRules.getLegalActions(state, self.index ): dist[a] = 1.0
            dist.normalize()
        elif len(legal_actions) == 1:
            dist[Directions.WEST] = 1
        else:
            dist[Directions.WEST] = self.prob
            other_prob = (1 -self.prob)/ (len(legal_actions)-1)
            for a in GhostRules.getLegalActions(state, self.index ): 
                if a!= Directions.WEST:
                    dist[a] = other_prob
        return dist

class DirectionalGhost( GhostAgent ):
    "A ghost that prefers to rush Pacman, or flee when scared."
    def __init__( self, index, prob=0.8, prob_scaredFlee=0.8 ):
        self.index = index
        self.prob = prob
        self.prob_scaredFlee = prob_scaredFlee

    def getDistribution( self, state ):
        # Read variables from state
        ghostState = state.getGhostState( self.index )
        legalActions = GhostRules.getLegalActions(state, self.index )
        pos = state.getGhostPosition( self.index )
        isScared = ghostState.scaredTimer > 0

        speed = 1
        if isScared: speed = 0.5

        actionVectors = [Actions.directionToVector( a, speed ) for a in legalActions]
        newPositions = [( pos[0]+a[0], pos[1]+a[1] ) for a in actionVectors]
        pacmanPosition = state.getPacmanPosition()

        # Select best actions given the state
        distancesToPacman = [manhattanDistance( pos, pacmanPosition ) for pos in newPositions]
        if isScared:
            bestScore = max( distancesToPacman )
            bestProb = self.prob_scaredFlee
        else:
            bestScore = min( distancesToPacman )
            bestProb = self.prob
        bestActions = [action for action, distance in zip( legalActions, distancesToPacman ) if distance == bestScore]

        # Construct distribution
        dist = util.Counter()
        for a in bestActions: dist[a] = bestProb / len(bestActions)
        for a in legalActions: dist[a] += ( 1-bestProb ) / len(legalActions)
        dist.normalize()
        return dist

class RandomGhostTeleportingNearWalls( GhostAgent ):
    def __init__( self, index, prob=0.5):
        self.prob = prob
        self.index = index
    "A ghost that chooses a legal action uniformly at random."
    def getDistribution( self, state ):
        dist = util.Counter()
        for a in [Directions.NORTH, Directions.SOUTH, Directions.EAST, Directions.WEST]: dist[a] = 1.0
        dist.normalize()
        return dist


class EastWestGhost( GhostAgent ):
    "A ghost that chooses a legal action uniformly at random."
    def __init__( self, index, prob=0.5):
        self.prob = prob
        self.index = index

    def getDistribution( self, state ):
        dist = util.Counter()
        legal_actions = state.getLegalActions(self.index) 
        if Directions.WEST not in legal_actions and Directions.EAST not in legal_actions:
            for a in state.getLegalActions(self.index ): dist[a] = 1.0
            dist.normalize()
        elif Directions.WEST in legal_actions and Directions.EAST not in legal_actions:
            dist[Directions.WEST] = 1
        elif Directions.WEST not in legal_actions and Directions.EAST in legal_actions:
            dist[Directions.EAST] = 1
        else:
            dist[Directions.WEST] = self.prob
            dist[Directions.EAST] = 1 - self.prob
            
        return dist