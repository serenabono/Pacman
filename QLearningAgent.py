from __future__ import division
import numpy as np
import math
import random
import pickle


class QLearningAgent:

    def __init__(self, exploration_strategy="BOLTZMANN", T=None, epsilon=None, on_policy=False, initialization_value=0, gamma=0.9, alpha=0.05, is_train=False, load_existing_agent=False):
        ##################q learning hyperparameters#############################
        if is_train:
            self.EXPLORATION_STRATEGY = "BOLTZMANN"  # {E_GREEDY, BOLTZMANN}
            self.ON_POLICY = on_policy
            self.INITIALIZE_VALUE = initialization_value
            self.GAMMA = gamma
            self.ALPHA = alpha
            self.train = is_train

            # q learning book keeping
            self.q_values = {}
            self.current_state = None
            self.current_legal_actions = None
            self.current_state_type = "initial"

            self.current_recommended_action = None

            self.previous_state = None
            self.previous_action = None

            ################## exploration strategy hyperparameters ##################

            # E-GREEDY hyperparameters
            if exploration_strategy == "BOLTZMANN":
                if T == None:
                    raise("Please specify Hyperparameter T for boltzmann exploration")
                else:
                    self.T = T

            # Boltzmann exploration hyperparameters
            elif exploration_strategy == "E_GREEDY":
                if epsilon == None:
                    raise(
                        "Please specify Hyperparameter epsilon for e_greedy exploration")
                else:
                    self.EPSILON = epsilon

        if (not is_train) or (load_existing_agent):
            try:
                loaded_agent = pickle.load(open("agent.pkl", "rb"))
            except:
                raise(
                    "Object pickle file not present. Please train and write the agent to disk first.")
            self.__class__ = loaded_agent.__class__
            self.__dict__ = loaded_agent.__dict__

            if not is_train:
                self.train = False

    def save_agent_to_disk(self, filename):
        pickle.dump(self, open(filename, "wb"))

    def set_current_state(self, state_rep):
        self.current_state = state_rep

    def set_current_legal_actions(self, actions):
        self.current_legal_actions = actions

    def set_current_state_type(self, state_type):
        self.current_state_type = state_type

    def initialize_q_values_if_absent(self):
        try:
            self.q_values[self.current_state]
        except KeyError:
            self.q_values[self.current_state] = {}
            actions_q = {}
            for action in self.current_legal_actions:
                actions_q[action] = self.INITIALIZE_VALUE
            self.q_values[self.current_state] = actions_q

    def sample_from_current_actions_epsilon_greedy(self):
        exploration_action = None
        max_action = None

        # find max val
        max_action_temp = None
        max_val = float("-inf")
        for action in self.current_legal_actions:
            if self.q_values[self.current_state][action] >= max_val:
                max_val = self.q_values[self.current_state][action]
                max_action_temp = action

        # find max actions and other actions
        max_actions_arr = []
        other_actions_arr = []

        for action in self.current_legal_actions:
            if self.q_values[self.current_state][action] == max_val:
                max_actions_arr.append(action)
            else:
                other_actions_arr.append(action)

        ############################################

        max_action = np.random.choice(max_actions_arr)
        exploration_action = np.random.choice(self.current_legal_actions)

        return exploration_action, max_action

    def epsilon_greedy_actions(self):
        exploration_action, max_action = self.sample_from_current_actions_epsilon_greedy()
        if self.train:
            if np.random.uniform(0, 1) < self.EPSILON:
                return exploration_action
            else:
                return max_action
        else:
            return max_action

    def sample_weighted_from_actions(self, actions_dict):
        rand_val = random.random()
        total = 0
        for k, v in actions_dict.items():
            total += v
            if rand_val <= total:
                return k

    def sample_from_current_actions_boltzmann(self):

        q_value_to_prob_map = {}
        for action in self.current_legal_actions:
            q_val = self.q_values[self.current_state][action]
            q_value_to_prob_map[action] = math.e**(q_val/self.T)

        summation = sum(q_value_to_prob_map.values())

        for action in self.current_legal_actions:
            q_value_to_prob_map[action] /= summation

        # find max action

        max_action_temp = None
        max_val = float("-inf")
        for action in self.current_legal_actions:
            if q_value_to_prob_map[action] >= max_val:
                max_val = q_value_to_prob_map[action]
                max_action_temp = action

        # find max actions and other actions
        max_actions_arr = []
        other_actions_arr = []

        for action in self.current_legal_actions:
            if q_value_to_prob_map[action] == max_val:
                max_actions_arr.append(action)
            else:
                other_actions_arr.append(action)

        exploration_action = self.sample_weighted_from_actions(
            q_value_to_prob_map)
        max_action = np.random.choice(max_actions_arr)

        return exploration_action, max_action

    def boltzmann_exploration_actions(self):
        exploration_action, max_action = self.sample_from_current_actions_boltzmann()
        if self.train:
            return exploration_action
        else:
            return max_action

    def get_action(self):
        if self.current_state_type == "terminal":
            return None, None

        if self.EXPLORATION_STRATEGY == "E_GREEDY":
            action = self.epsilon_greedy_actions()

        if self.EXPLORATION_STRATEGY == "BOLTZMANN":
            action = self.boltzmann_exploration_actions()

        self.current_recommended_action = action

        return action

    def on_policy_update(self, reward):
        if self.current_state_type == "initial":
            pass
        elif self.current_state_type == "mid_episode":
            action = self.get_action()
            self.q_values[self.previous_state][self.previous_action] += self.ALPHA*(reward + (
                self.GAMMA*self.q_values[self.current_state][action]) - self.q_values[self.previous_state][self.previous_action])
        elif self.current_state_type == "terminal":
            self.q_values[self.previous_state][self.previous_action] += self.ALPHA*(
                reward + (self.GAMMA*0) - self.q_values[self.previous_state][self.previous_action])

    def off_policy_update(self, reward):
        if self.current_state_type == "initial":
            pass
        elif self.current_state_type == "mid_episode":
            # find argmax
            max_action_temp = None
            max_val = float("-inf")
            for action in self.current_legal_actions:
                if self.q_values[self.current_state][action] >= max_val:
                    max_val = self.q_values[self.current_state][action]
                    max_action_temp = action

            # find max actions and other actions
            max_actions_arr = []
            other_actions_arr = []

            for action in self.current_legal_actions:
                if self.q_values[self.current_state][action] == max_val:
                    max_actions_arr.append(action)
                else:
                    other_actions_arr.append(action)

            ############################################

            max_action = np.random.choice(max_actions_arr)
            self.q_values[self.previous_state][self.previous_action] += self.ALPHA*(reward + (
                self.GAMMA*self.q_values[self.current_state][max_action]) - self.q_values[self.previous_state][self.previous_action])

        elif self.current_state_type == "terminal":
            self.q_values[self.previous_state][self.previous_action] += self.ALPHA*(
                reward + (self.GAMMA*0) - self.q_values[self.previous_state][self.previous_action])

    def update(self, reward):
        if self.train:
            if self.ON_POLICY:
                self.on_policy_update(reward)
            else:
                self.off_policy_update(reward)

        self.previous_state = self.current_state
        self.previous_action = self.current_recommended_action
