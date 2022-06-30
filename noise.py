
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
        return np.abs(np.random.normal(self.params["mean"], self.params["std"], size=None))
    
        

