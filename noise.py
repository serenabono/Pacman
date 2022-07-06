
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

import numpy as np

class GaussianNoise():
    """
    Class responsible of adding noise to the transition function
    """

    def __init__(self, params):
        self.params = params
    """
    P(s'|s,a) is implemented as a dictionary of the type TransitionFunction[fromstate][throughaction][tostate], the rules of probability have to be respected:
    sum(TransitionFunction[fromstate][throughaction]) = 1. 
    """
    def sample(self):
        return self.params["scale"]*np.abs(np.random.normal(self.params["mean"], self.params["std"]))