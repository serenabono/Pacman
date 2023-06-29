# keyboardAgents.py
# -----------------
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
from game import Directions
import random
import time

class KeyboardAgent(Agent):
    """
    An agent controlled by the keyboard.
    """
    # NOTE: Arrow keys also work.
    WEST_KEY  = 'a'
    EAST_KEY  = 'd'
    NORTH_KEY = 'w'
    SOUTH_KEY = 's'
    STOP_KEY = 'q'

    def __init__( self, args, index = 0 ):

        self.lastMove = Directions.STOP
        self.index = index
        self.keys = []
        self.actions = {Directions.NORTH: 0, Directions.SOUTH: 1,
                        Directions.EAST: 2, Directions.WEST: 3, Directions.STOP: 4}
        self.source = None  # Tracks the source of the action
        self.keyboard_inputs_saved = None
        self.keyboard_input_times_saved = None


    def getAction(self, state, legalactions, game_number, total_games, isInitial,  ensemble_agent=None):
        from graphicsUtils import keys_waiting
        from graphicsUtils import keys_pressed
        keys = keys_waiting() + keys_pressed()
        
        keyboard_inputs = []  # Added list to store keyboard inputs and times

        if keys != []:
            self.keys = keys

            self.move = 0
            keyboard_inputs.append((keys, time.time()))

        else:
            self.keys = 'Stop'
        
        legal = list(legalactions)
        move = self.getMove(legal)

        if move == self.actions[Directions.STOP]:
            # Try to move in the same direction as before
            if self.lastMove in legal:
                move = self.lastMove
                self.source = 'Habit'
                
        
        
        if (self.STOP_KEY in self.keys) and self.actions[Directions.STOP] in legal: 
            move = self.actions[Directions.STOP]
            self.source = 'Habit'
            

        if move not in legal and legal != []:
            move = random.choice(legal)
            self.source = 'Random'
        elif keyboard_inputs:
            self.source = 'Keyboard'
            
            #print("Keyboard")

        self.keyboard_inputs_saved = keyboard_inputs  # Save the keyboard inputs
        self.keyboard_input_times_saved = [t for _, t in keyboard_inputs]  # Save the keyboard input times
        self.lastMove = move
        return move, keyboard_inputs, [t for _, t in keyboard_inputs]

    def getMove(self, legal):
        move = self.actions[Directions.STOP] 
        if   (self.WEST_KEY in self.keys or 'Left' in self.keys) and self.actions[Directions.WEST] in legal:  move = self.actions[Directions.WEST]
        if   (self.EAST_KEY in self.keys or 'Right' in self.keys) and self.actions[Directions.EAST] in legal: move = self.actions[Directions.EAST]
        if   (self.NORTH_KEY in self.keys or 'Up' in self.keys) and self.actions[Directions.NORTH] in legal:   move =self.actions[Directions.NORTH]
        if   (self.SOUTH_KEY in self.keys or 'Down' in self.keys) and self.actions[Directions.SOUTH] in legal: move =self.actions[Directions.SOUTH]
        return move


class KeyboardAgent2(KeyboardAgent):
    """
    A second agent controlled by the keyboard.
    """
    # NOTE: Arrow keys also work.
    WEST_KEY  = 'j'
    EAST_KEY  = "l"
    NORTH_KEY = 'i'
    SOUTH_KEY = 'k'
    STOP_KEY = 'u'

    def getMove(self, legal):
        move = Directions.STOP
        if   (self.WEST_KEY in self.keys) and self.actions[Directions.WEST] in legal:  move = self.actions[Directions.WEST]
        if   (self.EAST_KEY in self.keys) and self.actions[Directions.EAST] in legal: move = self.actions[Directions.EAST]
        if   (self.NORTH_KEY in self.keys) and self.actions[Directions.NORTH] in legal:   move = self.actions[Directions.NORTH]
        if   (self.SOUTH_KEY in self.keys) and self.actions[Directions.SOUTH] in legal: move = self.actions[Directions.SOUTH]
        return move