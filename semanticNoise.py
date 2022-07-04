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
from noise import GaussianNoise

class SemanticNoise():
    """
    Class responsible of adding semantic noise to the transition function
    """

    def __init__(self, transitionMatrix, distribution = GaussianNoise({"mean":0, "std":1, "scale":0.1})):
        self.distribution = distribution
        self.transitionMatrix = transitionMatrix
        self.statemap = None
    """
    P(s'|s,a) is implemented as a dictionary of the type TransitionFunction[fromstate][throughaction][tostate], the rules of probability have to be respected:
    sum(TransitionFunction[fromstate][throughaction]) = 1. 
    """
    def generateStateMap(self):
        util.raiseNotDefined()

class NoiseToNextWallStates(SemanticNoise):

    def generateStateMap(self):
        pass