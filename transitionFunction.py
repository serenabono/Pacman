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
from game import Directions, Grid
from layout import Layout
from pacman import GameState, PacmanRules, GhostRules, ClassicGameRules
# import pycuda.autoinit
# from pycuda.compiler import SourceModule
# from pycuda import gpuarray
# import pycuda.curandom
# from pycuda.autoinit import context
# from pycuda.elementwise import ElementwiseKernel
import random
import time
from scipy.stats import wasserstein_distance

##############################
#  TRANSITION FUNCTION CODE  #
##############################


class TransitionMatrixDicTree():
    """
    Class containing all the information to generate the state transition matrix
    """

    def __init__(self, pacmanAgent, ghostAgents, layout, noise=None, swaps=None, scale=1, shift=0):
        self.stateDic = {}
        self.keyDict = {}
        self.currentStateNum = 0
        initState = GameState()
        initState.initialize(layout, layout.getNumGhosts())
        self.state = initState
        self.queue = []
        self.startingIndex = 0
        self.currentAgents = [pacmanAgent] + \
            ghostAgents[:layout.getNumGhosts()]
        self.agentType = pacmanAgent.__class__.__name__
        self.visited = {}
        self.graph = {}
        self.numAgents = len(self.currentAgents)
        self.layout = layout
        self.nStates = (self.layout.width *
                        self.layout.height)**self.numAgents
        self.transitionMatrixDic = {}
        self.actions = {Directions.NORTH: 0, Directions.SOUTH: 1,
                        Directions.EAST: 2, Directions.WEST: 3}
        self.toactions = {v: k for k, v in self.actions.items()}
        self.nPossibleAcitons = len(self.actions)
        self.helperDic = {}
        self.seedMesher = time.time()
        self.init_func = None
        self.fill_finc = None
        self.change_elem = None
        self.N = 1024
        self.scale = scale
        self.shift = shift
        self.factorLegal = None

        self.swaps = swaps
        print("swaps level: ", self.swaps)

        self.STD = None
        self.MEAN = None
        self.noise = noise
        print("noise level: ", self.noise)
        if self.noise:
            self.STD = noise["std"]
            self.MEAN = noise["mean"]
            self.initializeGeneratorFromCode()

    def copy(self):
        tree = self
        tree.state = self.state
        tree.queue = self.queue
        tree.startingIndex = self.startingIndex
        tree.currentAgents = self.currentAgents
        tree.visited = self.visited
        tree.graph = self.graph
        tree.numAgents = self.numAgents
        tree.layout = self.layout
        tree.nStates = self.nStates
        tree.transitionMatrixDic = self.transitionMatrixDic
        tree.actions = self.actions
        tree.nPossibleAcitons = self.nPossibleAcitons
        tree.helperDic = self.helperDic
        tree.init_func = self.init_func
        tree.fill_finc = self.fill_finc
        tree.change_elem = self.change_elem
        tree.N = self.N
        tree.seedMesher = self.seedMesher
        tree.noise = self.noise
        tree.STD = self.STD
        tree.MEAN = self.MEAN

        return tree

    def computeHash(self, state):
        hashstate = str(state) + str(state.getNumFood())
        return hashstate

    def getHashfromState(self, state):
        statehash = self.computeHash(state)
        if statehash not in self.stateDic:
            self.stateDic[statehash] = self.currentStateNum
            self.keyDict[self.currentStateNum] = state
            self.currentStateNum += 1

        return self.stateDic[statehash]

    def computeProbabilities(self):
        """
        Function to compute probabilities P(s'|s,a). Most transitions are illegal and the matrix is extremely big,
        therefore it is compressed in a dictionary containing as key the tostate value of the states and the actions
        for all non zero probability transitions.
        """
        for el in range(self.numAgents):
            self.visited[el] = {}
            self.helperDic[el] = {}

        self.queue.append(
            {"state": self.state, "id": self.startingIndex})

        while self.queue:
            current_element = self.queue.pop()

            currentelementhash = self.getHashfromState(
                current_element["state"])

            if currentelementhash not in self.helperDic[current_element["id"]]:
                self.helperDic[current_element["id"]][currentelementhash] = {}

            if current_element["id"] == 0:
                legal_actions = PacmanRules.getLegalActions(
                    current_element["state"])
            else:
                legal_actions = GhostRules.getLegalActions(
                    current_element["state"], current_element["id"])
            
            if current_element["state"].isWin() or current_element["state"].isLose():
                self.transitionMatrixDic[currentelementhash] = {}
                continue

            for action in legal_actions:
                successor_element = {}

                successor_element["id"] = (
                    current_element["id"] + 1) % self.numAgents

                successor_element["state"] = GameState(
                    current_element["state"])

                successor_element["state"] = current_element["state"].generateSuccessor(
                        current_element["id"], action)

                successorelelmenthash = self.getHashfromState(
                    successor_element["state"])
                
                if current_element["id"] == 0:
                    successor_element["prob"] = 1
                    pacmanaction = self.actions[action]
                else:
                    dist = self.currentAgents[current_element["id"]].getDistribution(
                        current_element["state"])
                    successor_element["prob"] = dist[action]

                if successorelelmenthash not in self.visited[successor_element["id"]]:
                    self.visited[successor_element["id"]
                                 ][successorelelmenthash] = True
                    self.queue.append(successor_element)

                if pacmanaction not in self.helperDic[current_element["id"]][currentelementhash]:
                    self.helperDic[current_element["id"]
                                   ][currentelementhash][pacmanaction] = {}
                self.helperDic[current_element["id"]
                               ][currentelementhash][pacmanaction][successorelelmenthash] = successor_element["prob"]

        for currentelementhash in self.helperDic[0]:
            self.createMatrixrecursively(
                self.startingIndex, currentelementhash, [], currentelementhash, prob=1)

        self.factorLegal = len(self.transitionMatrixDic.keys())
        print(f"#states: {self.factorLegal}")

        if self.swaps:
            self.computeCompleteMatrixSwaps()

        if self.noise:
            self.computeCompleteMatrix()
        
        # check correctness
        for fromstate in self.transitionMatrixDic:
            for throughaction in self.transitionMatrixDic[fromstate]:
                np.testing.assert_almost_equal(
                    sum(self.transitionMatrixDic[fromstate][throughaction].values()), 1)
        
        print("numstates: ", len(self.transitionMatrixDic))

    def createMatrixrecursively(self, agentid, lastpacmanstate, throughactions, currentelementhash, prob):
        if currentelementhash not in self.helperDic[agentid]:
            return

        for action in self.helperDic[agentid][currentelementhash]:
            throughactions.append(action)

            for successorelementhash in self.helperDic[agentid][currentelementhash][action]:
                probel = prob * \
                    self.helperDic[agentid][currentelementhash][action][successorelementhash]
                if agentid == self.numAgents - 1 or len(self.helperDic[agentid + 1][successorelementhash].keys()) == 0:
                    throughactionhash = throughactions[0]
                    if lastpacmanstate not in self.transitionMatrixDic:
                        self.transitionMatrixDic[lastpacmanstate] = {}
                    if throughactionhash not in self.transitionMatrixDic[lastpacmanstate]:
                        self.transitionMatrixDic[lastpacmanstate][throughactionhash] = {
                        }
                    if successorelementhash not in self.transitionMatrixDic[lastpacmanstate][throughactionhash]:
                        self.transitionMatrixDic[lastpacmanstate][throughactionhash][successorelementhash] = probel
                    else:
                        self.transitionMatrixDic[lastpacmanstate][throughactionhash][successorelementhash] += probel
                else:
                    self.createMatrixrecursively(
                        agentid + 1, lastpacmanstate, throughactions, successorelementhash, probel)

            throughactions.pop()

    def getLegalActionsAgent(self, fromstatehash, agentId):
        actlst = {}
        for throughaction in self.helperDic[agentId][fromstatehash]:
            for tostatehash in self.helperDic[agentId][fromstatehash][throughaction]:
                if throughaction not in actlst:
                    actlst[throughaction] = {}
                if tostatehash not in actlst[throughaction]:
                    actlst[throughaction][tostatehash] = self.helperDic[agentId][fromstatehash][throughaction][tostatehash]
                else:
                    actlst[throughaction][tostatehash] += self.helperDic[agentId][fromstatehash][throughaction][tostatehash]
        return actlst

    def replayGame(self, layout, actions, display):
        import pacmanAgents
        import ghostAgents
        rules = ClassicGameRules()
        agents = [pacmanAgents.GreedyAgent()] + [ghostAgents.RandomGhost(i+1)
                                                 for i in range(layout.getNumGhosts())]
        game = rules.newGame(layout, agents[0], agents[1:], display)
        state = game.state
        display.initialize(state.data)
        for pacaction, actiontostate, agentId in actions:
            state = self.moveToPosition(state, pacaction, actiontostate, agentId)
            # Change the display
            display.update(state.data)

            import graphicsDisplay
            graphicsDisplay.saveFrame()

        display.finish()

    def generateHeatMapAgent(self, layout, actions, agentId=0):
        heatmap = np.zeros([layout.height, layout.width])
        for agentIndex, actiontostatehash, action in actions:
            if agentIndex == agentId:
                listpos = self.fromBaseTen(
                    actiontostatehash, layout.width*layout.height, digits=np.zeros((self.numAgents), dtype=int))
                posingrid = self.getPositionInGridCoord(listpos[agentIndex])
                pospac = posingrid
                heatmap[pospac] += 1

        return heatmap

    def computeCompleteMatrix(self):

        list_pos = []
        seed = np.random.seed()
        for fromstatehash in self.transitionMatrixDic:
            for throughaction in self.transitionMatrixDic[fromstatehash].keys():
                n_states = len(self.transitionMatrixDic.keys())
                noise_generated = np.absolute(
                    np.random.normal(self.MEAN, self.STD, n_states))
                for key, value in zip(self.transitionMatrixDic[fromstatehash][throughaction].keys(), self.transitionMatrixDic[fromstatehash][throughaction].values()):
                    #list_pos.append({"key": key, "value":value, "fromstatehash": fromstatehash, "throughaction": throughaction})
                    noise_generated[list(self.transitionMatrixDic).index(
                        key)] += value * self.factorLegal
                probabilities = noise_generated / sum(noise_generated)
                self.transitionMatrixDic[fromstatehash][throughaction] = dict(
                    zip(self.transitionMatrixDic.keys(), probabilities))

        # for el in list_pos:
        #     print(self.transitionMatrixDic[el["fromstatehash"]][el["throughaction"]][el["key"]])

    def computeCompleteMatrixSwaps(self):
        acceptable = [key for key, value in self.transitionMatrixDic.items() if value != {}]
        randomindices = random.sample(
            range(0, len(acceptable)), int(self.swaps * len(acceptable)))
        shuffledvaluelist = [self.transitionMatrixDic[acceptable[idx]] for idx in randomindices]
        random.shuffle(shuffledvaluelist)
        keylist = [ acceptable[idx] for idx in randomindices]

        for key, value in zip(keylist, shuffledvaluelist):
            self.transitionMatrixDic[key] = value

    def computeCompleteMatrixGPU(self):
        nvalues = (len(self.transitionMatrixDic.keys())**2) * \
            self.nPossibleAcitons
        seed = np.int32(123456789*self.seedMesher)
        self.init_func(seed, block=(self.N, 1, 1), grid=(1, 1, 1))
        gdata = gpuarray.zeros(nvalues, dtype=np.float32)
        self.fill_func(gdata, np.float32(self.STD), np.float32(self.MEAN), np.int32(nvalues),
                       block=(self.N, 1, 1), grid=(1, 1, 1))
        gdata_device = np.asarray(gdata.get())
        i = 0
        for fromstatehash in self.transitionMatrixDic:
            for action in range(self.nPossibleAcitons):
                currentIdxsstart = (i + action) * \
                    len(self.transitionMatrixDic.keys())
                currentIdxsend = (i + action + 1) * \
                    len(self.transitionMatrixDic.keys())

                listkeys = []
                if action in self.transitionMatrixDic[fromstatehash]:
                    for key, value in zip(self.transitionMatrixDic[fromstatehash][action].keys(), self.transitionMatrixDic[fromstatehash][action].values()):
                        gdata_device[currentIdxsstart + list(
                            self.transitionMatrixDic).index(key)] += value * self.factorLegal
                        listkeys.append(key)

                gdata_sumrows = sum(
                    gdata_device[currentIdxsstart:currentIdxsend])
                c_cpu = 1/gdata_sumrows * \
                    gdata_device[currentIdxsstart:currentIdxsend]
                if action not in self.transitionMatrixDic[fromstatehash]:
                    self.transitionMatrixDic[fromstatehash][action] = {}
                self.transitionMatrixDic[fromstatehash][action] = dict(
                    zip(self.transitionMatrixDic.keys(), c_cpu))

            i += self.nPossibleAcitons

        del gdata

    def getLegalActions(self, fromstatehash, action):
        return self.transitionMatrixDic[fromstatehash][action]

    def initializeGeneratorFromCode(self):
        code = """
            #include <curand_kernel.h>
            const int nstates = %(NGENERATORS)s;
            __device__ curandState_t* states[nstates];
            extern "C" {
                __global__ void initkernel(int seed)
                {
                    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
                    if (tidx < nstates) {
                        curandState_t* s = new curandState_t;
                        if (s != 0) {
                            curand_init(seed, tidx, 0, s);
                        }
                        states[tidx] = s;
                        free(s);
                    }
                }
                __global__ void randfillkernel(float *values, float SCALE, float SHIFT, int N)
                {
                    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
                    if (tidx < nstates) {
                        curandState_t s = *states[tidx];
                        for(int i=tidx; i < N; i += blockDim.x * gridDim.x) {
                            values[i] = abs((curand_normal(&s) * SCALE)+SHIFT);
                        }
                        *states[tidx] = s;
                    }
                }
                __global__ void changeelem(float *arr, int idx, float val) {
                    arr[idx] = val;
                }
            }
        """
        # mod = SourceModule(code % {"NGENERATORS": self.N}, no_extern_c=True)
        # self.init_func = mod.get_function("initkernel")
        # self.fill_func = mod.get_function("randfillkernel")
        # self.change_elem = mod.get_function("changeelem")

    def generateSuccessor(self, actionstostateshashdict):
        if actionstostateshashdict == {}:
            raise Exception('Can\'t generate a successor of a terminal state.')
        # random weighted choice
        actiontostatehash = random.choices(population=list(
            actionstostateshashdict.keys()), weights=list(actionstostateshashdict.values()), k=1)
        del actionstostateshashdict
        return actiontostatehash[0]

    def moveToPosition(self, state, pacaction, actiontostate, agentId):

        posingrid = self.keyDict[actiontostate].data.agentStates[agentId].getPosition(
        )
        newstate = state.movetoAnyState(
            self.keyDict[actiontostate], pacaction, agentId, posingrid)
        return newstate


    def compute_wasserstein_distance(self, pacman_perturbedenv):
        sig_one = []
        sig_two = []
        for fromstatehash in self.transitionMatrixDic:
            for throughaction in self.actions.values():
                for tostatehash in self.transitionMatrixDic:
                    if fromstatehash in self.transitionMatrixDic:
                        if throughaction in self.transitionMatrixDic[fromstatehash]:
                            if tostatehash in self.transitionMatrixDic[fromstatehash][throughaction]:
                                sig_one.append(self.transitionMatrixDic[fromstatehash][throughaction][tostatehash])
                            else:
                                sig_one.append(0)
                        else:
                            sig_one.append(0)
                    if fromstatehash in pacman_perturbedenv.transitionMatrixDic:
                        if throughaction in pacman_perturbedenv.transitionMatrixDic[fromstatehash]:
                            if tostatehash in pacman_perturbedenv.transitionMatrixDic[fromstatehash][throughaction]:
                                sig_two.append(pacman_perturbedenv.transitionMatrixDic[fromstatehash][throughaction][tostatehash])
                            else:
                                sig_two.append(0)
                        else:
                            sig_two.append(0)
                    
        return wasserstein_distance(sig_one, sig_two)

    
    def compute_wasserstein_distance_qtables(self, pacman_perturbedenv):
        sig_one = []
        sig_two = []
        pacmanenv = self.currentAgents[0]
        for fromstatehash in self.transitionMatrixDic:
            for throughaction in self.actions.values():
                fromstate = str(self.keyDict[fromstatehash])
                if fromstate in pacmanenv.agent.q_values:
                    if throughaction in pacmanenv.agent.q_values[fromstate]:
                        sig_one.append(pacmanenv.agent.q_values[fromstate][throughaction])
                    else:
                        sig_one.append(0)
                if fromstate in pacman_perturbedenv.agent.q_values:
                    if throughaction in pacman_perturbedenv.agent.q_values[fromstate]:
                        sig_two.append(pacman_perturbedenv.agent.q_values[fromstate][throughaction])
                    else:
                        sig_two.append(0)
                    
        return wasserstein_distance(sig_one, sig_two)