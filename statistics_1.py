# pacman.py
# ---------
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


"""
Pacman.py holds the logic for the classic pacman game along with the main
code to run a game.  This file is divided into three sections:

  (i)  Your interface to the pacman world:
          Pacman is a complex environment.  You probably don't want to
          read through all of the code we wrote to make the game runs
          correctly.  This section contains the parts of the code
          that you will need to understand in order to complete the
          project.  There is also some code in game.py that you should
          understand.

  (ii)  The hidden secrets of pacman:
          This section contains all of the logic code that the pacman
          environment uses to decide who can move where, who dies when
          things collide, etc.  You shouldn't need to read this section
          of code, but you can if you want.
defineTransitionMatrix
  (iii) Framework to start a game:
          The final section contains the code for reading the command
          you use to set up the game, then starting up a new game, along with
          linking in all the external parts (agent functions, graphics).
          Check this section out to see all the options available to you.

To play your first game, type 'python pacman.py' from the command line.
The keys are 'a', 's', 'd', and 'w' to move (or arrow keys).  Have fun!
"""

"""
to run this file: 
python runStatistics.py -m s -p BoltzmannAgent -l v3 -s '{"epochs":100,"trained_agents":2,"n_training_steps":10,"n_testing_steps":10,"timeout":30}' -t "saved_agent.pkl" -n '{"semanticDistribution":"DistributedNoise","noiseType":"GaussianNoise","noiseArgs":{"mean":0,"std":1,"scale":0.1}}'
"""

import layout
import sys
import random
import os
from QLearningAgent import *
from search import *
from transitionFunction import *
from pacman import ClassicGameRules
import noise
import json
from pathlib import Path
import csv
#import keyboard
import time
import pandas as pd


def default(str):
    return str + ' [Default: %default]'


def defineAgents(agentOpts, pacmanName, noKeyboard):

    pacmanType = loadAgent(pacmanName, noKeyboard)
    pacman = pacmanType(agentOpts["pacman"])

    ghost_list = []
    for ghost in agentOpts["ghosts"]:
        ghostType = loadAgent(ghost["name"], 1)
        ghost_list.append(
            ghostType(index=ghost["args"]["index"], prob=ghost["args"]["prob"]))

    return pacman, ghost_list


"""
@param argv
read the commandline and set the paramator of the pacman game
"""
def readCommand(argv):
    """
    Processes the command used to run pacman from the command line.
    """
    from optparse import OptionParser
    usageStr = """
    USAGE:      python pacman.py <options>
    EXAMPLES:   (1) python pacman.py
                    - starts an interactive game
                (2) python pacman.py --layout smallClassic --zoom 2
                OR  python pacman.py -l smallClassic -z 2
                    - starts an interactive game on a smaller board, zoomed in
    """
    parser = OptionParser(usageStr)
    parser.add_option('-m', '--mode', dest='mode',
                      help=default(
                          'type of statistics you want to run (s, e, g, t)'),
                      default='s')
    parser.add_option('-l', '--layout', dest='layout',
                      help=default(
                          'the LAYOUT_FILE from which to load the map layout'),
                      metavar='LAYOUT_FILE', default='mediumClassic')
    parser.add_option('-p', '--pacman', dest='pacman',
                      help=default(
                          'the agent TYPE in the pacmanAgents module to use'),
                      metavar='TYPE', default='KeyboardAgent')
    parser.add_option('-g', '--ghosts', dest='ghost',
                      help=default(
                          'the ghost agent TYPE in the ghostAgents module to use'),
                      metavar='TYPE', default='RandomGhost')
    parser.add_option('-k', '--numghosts', type='int', dest='numGhosts',
                      help=default('The maximum number of ghosts to use'), default=4)
    parser.add_option('-z', '--zoom', type='float', dest='zoom',
                      help=default('Zoom the size of the graphics window'), default=1.0)
    parser.add_option('-q', '--quietTextGraphics', action='store_true', dest='quietGraphics',
                      help='Generate minimal output and no graphics', default=False)
    parser.add_option('-r', '--recording', action='store_true', dest='recordingParam',
                      help='Generate recordings of testing epochs', default=False)
    parser.add_option('-f', '--fixRandomSeed', action='store_true', dest='fixRandomSeed',
                      help='Fixes the random seed to always play the same game', default=False)
    parser.add_option('-a', '--agentArgs', dest='agentArgs',
                      help='Comma separated values sent to agent. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('--timeout', dest='timeout', type='int',
                      help=default('Maximum length of time an agent can spend computing in a single game'), default=30)
    parser.add_option('-s', '--statArgs', dest='statArgs',
                      help='Comma separated values sent to stat. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('-c', '--swapsArg', dest='swapsArg',
                      help='Comma separated values sent to stat. e.g. "opt1=val1,opt2,opt3=val3"')
    parser.add_option('-t', '--pretrainedAgent', dest='pretrainedAgent', help=default('The pre-trained pacmanAgents module to use'),
                      metavar='TYPE', default=None)
    parser.add_option('-o', '--outputStats', dest='outputStats', help=default('Output file to save stats'),
                      metavar='TYPE', default='saved_agent.pkl')
    parser.add_option('-d', '--savedfFolder', dest='savedfFolder', help=default('Output file to save stats'),
                      metavar='TYPE', default='.')
    parser.add_option('-n', '--noiseArgs', dest='noiseArgs',
                      help='Comma separated values sent to noise. e.g. "opt1=val1,opt2,opt3=val3,noise=\{arg1=val1,arg2=val2\}"')
    parser.add_option('-y', '--ghostArgs', dest='noiseArgs',
                      help='Comma separated values sent to noise. e.g. "opt1=val1,opt2,opt3=val3,noise=\{arg1=val1,arg2=val2\}"')
    parser.add_option('--frameTime', dest='frameTime', type='float',
                      help=default('Time to delay between frames; <0 means keyboard'), default=0.1)
    parser.add_option('-u', '--userID', type='int', dest = 'userID',
                      help = 'Generated userID')

    options, otherjunk = parser.parse_args(argv)
    if len(otherjunk) != 0:
        raise Exception('Command line input not understood: ' + str(otherjunk))
    args = dict()

    # Fix the random seed
    if options.fixRandomSeed:
        random.seed('cs188')

    # Choose a layout
    args['layout'] = layout.getLayout(options.layout)
    if args['layout'] == None:
        raise Exception("The layout " + options.layout + " cannot be found")

    # Choose a Pacman agent
    noKeyboard = options.quietGraphics

    print(options.agentArgs)

    try:
        agentOpts = json.loads(options.agentArgs)
    except:
        agentOpts = {}

    try:
        args['statOpts'] = json.loads(options.statArgs)
    except:
        args['statOpts'] = {}
    
    print(args['statOpts'])

    args["ghosts"] = {}
    args['pacman'] = {}
    args["perturbOpts"] = {}

    # Instantiate Pacman with agentArgs
    pacman, ghosts = defineAgents(
        agentOpts["test"], options.pacman, noKeyboard)
    args['pacman']["test"] = pacman
    args["ghosts"]["test"] = []
    args["ghosts"]["test"] = ghosts
    args["perturbOpts"]["test"] = agentOpts["test"]["perturb"]

    if "ensemble" in agentOpts:
        pacman, ghosts = defineAgents(
            agentOpts["test"], options.pacman, noKeyboard)
        args['pacman']["ensemble"] = pacman
        args["ghosts"]["ensemble"] = []
        args["ghosts"]["ensemble"] = ghosts
        args["perturbOpts"]["ensemble"] = agentOpts["ensemble"]["perturb"]

    # Don't display training games
    if 'numTrain' in agentOpts:
        options.numQuiet = int(agentOpts['numTrain'])
        options.numIgnore = int(agentOpts['numTrain'])

    if 'savedFolder' in agentOpts:
        args['savedFolder'] = options.savedFolder

    # Choose a display format
    if options.quietGraphics:
        import textDisplay
        args['display'] = textDisplay.NullGraphics()
    else:
        import graphicsDisplay
        args['display'] = graphicsDisplay.PacmanGraphics(
            options.zoom, frameTime=options.frameTime)

    if options.recordingParam:
        args['recording'] = options.outputStats + "-RECORDING-"
    else:
        args['recording'] = None

    args['timeout'] = options.timeout
    args['agentOpts'] = agentOpts
    args['pacmanAgentName'] = options.pacman
    args['pretrainedAgentName'] = options.pretrainedAgent
    args['outputStats'] = options.outputStats
    args['swapsArg'] = options.swapsArg

    args['mode'] = options.mode
    args['userID'] = options.userID

    # print("INPUT USER ID IS", args['userID'])

    return args

# GENERALIZATION_WORLDS = [{"pacman":{},"ghosts":[{"name":"RandomGhost","args":{"index":1,"prob":{}}}],"perturb":{"noise":{"mean":0,"std":0.1},"perm":{}}},
#     {"pacman":{},"ghosts":[{"name":"RandomGhost","args":{"index":1,"prob":{}}}],"perturb":{"noise":{"mean":0,"std":0.2},"perm":{}}}]


GENERALIZATION_WORLDS = [{"pacman": {}, "ghosts": [{"name": "RandomGhost", "args": {
    "index": 1, "prob": {}}}], "perturb": {"noise": {"mean": 0, "std": 0.1}, "perm": {}}},{"pacman": {}, "ghosts": [{"name": "RandomGhost", "args": {
    "index": 1, "prob": {}}}], "perturb": {"noise": {"mean": 0, "std": 0.2}, "perm": {}}},{"pacman": {}, "ghosts": [{"name": "RandomGhost", "args": {
    "index": 1, "prob": {}}}], "perturb": {"noise": {"mean": 0, "std": 0.3}, "perm": {}}},{"pacman": {}, "ghosts": [{"name": "RandomGhost", "args": {
    "index": 1, "prob": {}}}], "perturb": {"noise": {"mean": 0, "std": 0.5}, "perm": {}}},{"pacman": {}, "ghosts": [{"name": "RandomGhost", "args": {
    "index": 1, "prob": {}}}], "perturb": {"noise": {"mean": 0, "std": 0.7}, "perm": {}}},{"pacman": {}, "ghosts": [{"name": "RandomGhost", "args": {
    "index": 1, "prob": {}}}], "perturb": {"noise": {"mean": 0, "std": 0.9}, "perm": {}}}]


SWAP_LIST = [0, 0.1, 0.2, 0.3, 0.5, 0.7, 0.9]

def recordRange(index, range):
    if index < range["max"] and index >= range["min"]: 
        return True
    else:
        return False

def saveRecordings(tree, game, layout, filepath):
    import time
    import pickle
    fname = filepath
    f = open(fname, 'wb')
    components = {'layout': layout, 'actions': game.moveHistory}
    pickle.dump(components, f)
    f.close()

def saveHeatMap(tree, game, layout, filepath):
    import time
    import pickle
    fname = filepath
    f = open(fname, 'wb')
    components = {'heatmap': tree.generateHeatMapAgent(
        layout, game.moveHistory, 0)}
    pickle.dump(components, f)
    f.close()


def loadAgent(pacman, nographics):
    # Looks through all pythonPath Directories for the right module,
    pythonPathStr = os.path.expandvars("$PYTHONPATH")
    if pythonPathStr.find(';') == -1:
        pythonPathDirs = pythonPathStr.split(':')
    else:
        pythonPathDirs = pythonPathStr.split(';')
    pythonPathDirs.append('.')

    for moduleDir in pythonPathDirs:
        if not os.path.isdir(moduleDir):
            continue
        moduleNames = [f for f in os.listdir(
            moduleDir) if f.endswith('gents.py')]
        for modulename in moduleNames:
            try:
                module = __import__(modulename[:-3])
            except ImportError:
                continue
            if pacman in dir(module):
                if nographics and modulename == 'keyboardAgents.py':
                    raise Exception(
                        'Using the keyboard requires graphics (not text display)')
                return getattr(module, pacman)
    raise Exception('The agent ' + pacman +
                    ' is not specified in any *Agents.py.')


def train_epoch(transitionMatrixTree, n_training_steps, rules, pacman, ghosts, layout, gameDisplay):

    for i in range(n_training_steps):
        import textDisplay
        game = rules.newGame(layout, pacman, ghosts,
                             gameDisplay, 1, catchExceptions=False)
        transitionMatrixTree.state = game.state
        game.transitionFunctionTree = transitionMatrixTree.copy()
        if 'Boltzmann' in pacman.__class__.__name__:
            pacman.agent.set_trainable(trainable=True)
        elif 'PacmanDQN' in pacman.__class__.__name__:
            pacman.set_trainable(trainable=True)
        game.run(i, n_training_steps)

def shellquote(s):
    return "'" + s.replace("'", "'\\''") + "'"

def test_epoch(transitionMatrixTree, n_testing_steps, rules, pacman, ghosts, layout, gameDisplay, ensemble_agent=None, record=None):
    scores = []
    key_historys = []
    key_inputs = []
    state_list = []

    for i in range(n_testing_steps):
        #capture_key_press(key_presses)
        import textDisplay
        game = rules.newGame(layout, pacman, ghosts,
                             gameDisplay, 1, catchExceptions=False)
        if record:
            import graphicsDisplay
            grapDisplay = graphicsDisplay.PacmanGraphics(
            1, frameTime=0.1)
            game.display = grapDisplay
            game.display.initialize(game.state.data)

        transitionMatrixTree.state = game.state
        game.transitionFunctionTree = transitionMatrixTree.copy()
        if 'Boltzmann' in pacman.__class__.__name__:
            pacman.agent.set_trainable(trainable=False)
        elif 'PacmanDQN' in pacman.__class__.__name__:
            pacman.set_trainable(trainable=False)
        game.get_key_presses().append({'Timestamp': time.time(), 'Key': "NEWGAME", 'Source': "NEWGAME"})
        game.run(i, n_testing_steps, ensemble_agent=ensemble_agent, record=record)
        
        scores.append(game.state.getScore())
        key_historys.append(game.get_key_presses())
        key_inputs.append(game.key_input)
        state_list.append(game.state)

        if record:
            gifname = shellquote(f'./{record}_agent_{i}.gif')
            os.system(f"convert -delay 15 -loop 1 -compress lzw -layers optimize ./frames/* {gifname}")
            os.system(f"rm -r frames/**")
    return np.asarray(scores), key_historys, key_inputs, state_list

def test_noisy_agents_epoch(transitionMatrixTreeList, n_testing_steps, rules, pacman, ghosts, layout, gameDisplay, record=None):

    across_agents_scores = []
    for n in range(len(transitionMatrixTreeList)):
        scores = []
        for i in range(n_testing_steps):
            import textDisplay
            game = rules.newGame(layout, pacman, ghosts,
                                 gameDisplay, 1, catchExceptions=False)
            
            if record:
                import graphicsDisplay
                grapDisplay = graphicsDisplay.PacmanGraphics(
                1, frameTime=0.1)
                game.display = grapDisplay
                game.display.initialize(game.state.data)

            transitionMatrixTreeList[n].state = game.state
            game.transitionFunctionTree = transitionMatrixTreeList[n].copy()

            if 'Boltzmann' in pacman.__class__.__name__:
                pacman.agent.set_trainable(trainable=False)
            elif 'PacmanDQN' in pacman.__class__.__name__:
                pacman.set_trainable(trainable=False)

            game.run(i, n_testing_steps, record=record)
            scores.append(game.state.getScore())
            
            if record:
                gifname = shellquote(f'./{record[n]}_agent_{i}.gif')
                os.system(f"convert -delay 15 -loop 1 -compress lzw -layers optimize ./frames/* {gifname}")
                os.system(f"rm -r frames/**")

        across_agents_scores.append(np.asarray(scores))

    return across_agents_scores


def defineTransitionMatrix(pacman, ghost, layout, file_to_be_loaded=None, file_to_be_saved=None, applyperturb=None):
    # define transition function
    if pacman.__class__.__name__ == "BoltzmannAgent":
        # semanticDistribution, noiseType, noiseArgs
        try:
            if file_to_be_loaded:
                loaded_agent = pickle.load(open(file_to_be_loaded, "rb"))
                pacman.agent.__class__ = loaded_agent.__class__
                pacman.agent.__dict__ = loaded_agent.__dict__
                # set not trainable
                pacman.set_trainable(False)
        except:
            print("impossible to load file: " + file_to_be_loaded)
            print("starting a new agent from scratch ...")
    elif pacman.__class__.__name__ == 'PacmanDQN':
        try:
            if file_to_be_loaded:
                pacman.params["load_file"] = file_to_be_loaded
                pacman.params["save_file"] = file_to_be_saved
                # set not trainable
                pacman.agent.set_trainable(False)
        except:
            print("impossible to load file: " + file_to_be_loaded)
            print("starting a new agent from scratch ...")

    # only gaussian supported for now
    if applyperturb["perm"] != {}:
        transitionMatrixTree = TransitionMatrixDicTree(
            pacman, ghost, layout, swaps=float(applyperturb["perm"]))
    if applyperturb["noise"] != {}:
        transitionMatrixTree = TransitionMatrixDicTree(
            pacman, ghost, layout, noise=applyperturb["noise"])
    else:
        transitionMatrixTree = TransitionMatrixDicTree(pacman, ghost, layout)

    transitionMatrixTree.computeProbabilities()

    return transitionMatrixTree


def runStatistics(pacman, pacmanName, pacmanArgs, ghosts, layout, display, file_to_be_loaded=None,  applyperturb=None, record=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_testing_steps], dtype=np.float32)

    if not os.path.exists(args['outputStats'].split('/')[0]):
        os.makedirs(args['outputStats'].split('/')[0])
    
    os.system("rm frames/**")
    
    for i in range(trained_agents):
        transitionMatrixTreeList = []
        transitionMatrixTreeList.append(defineTransitionMatrix(
            pacman, ghosts, layout, file_to_be_loaded=file_to_be_loaded,  applyperturb=applyperturb))
        transitionMatrixTreeList.append(defineTransitionMatrix(
            pacman, ghosts, layout, file_to_be_loaded=file_to_be_loaded,  applyperturb=applyperturb))

        for j in range(epochs // n_testing_steps):
            print("record_range is ", record_range)
            if record_range and j >= record_range["min_range"] and j < record_range["max_range"]:
                os.makedirs(args['outputStats'].split('/')[0] + "/record/")
                recordpath = args['outputStats'].split('/')[0] + "/record/" + args['outputStats'].split('/')[1] + \
                    "-learnability-RECORDING-" + f"{j}_epoch"
            else:
                recordpath = None

            if (j * n_training_steps) < run_untill:
                transitionMatrixTree = transitionMatrixTreeList[1]
            else:
                transitionMatrixTree = transitionMatrixTreeList[0]

            print(j)
            if pacman["test"].__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTree, n_training_steps,
                            rules, pacman, ghosts, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTreeList[0], n_testing_steps, rules, pacman, ghosts, layout, display, record=recordpath))
            stats[i][j] = score
        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        np.savetxt(args['outputStats'] +
                   f"{i}_training_agent.pkl", stats[i],  delimiter=',')

        #   reinitialize pacman
        if pacman["test"].__class__.__name__ == "KeyboardAgent":
            pacmanType = loadAgent(pacmanName, 0)
        else:
            pacmanType = loadAgent(pacmanName, 1)
        pacman = pacmanType(pacmanArgs)

    return np.mean(stats, 0)


def append_text_to_csv(file_path, text):
    with open(file_path, 'a', newline='\n') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(text)
    csvfile.close()

def append_df_to_csv(file_path, data):
    df = pd.DataFrame(data[0])
    for i in range(1, len(data)):
        df = df.append(pd.DataFrame(data[i]), ignore_index=True)
    df.to_csv(file_path, index=False)

def runLearnability(pacman, pacmanName, pacmanArgs, ghosts, layout, display, file_to_be_loaded=None,  applyperturb=None, record=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)

    print("record_range: ",record_range)

    stats = np.zeros(
        [trained_agents, epochs // n_testing_steps], dtype=np.float32)

    # print("trained_agent is: ", trained_agents)
    # print("epochs: ", epochs // n_testing_steps)
    if not os.path.exists(args['outputStats'].split('/')[0]):
        os.makedirs(args['outputStats'].split('/')[0])
        
    
    os.system("rm frames/**")

    print(pacman["test"].__class__.__name__) #keyboardagent
    

    if record:
        if not os.path.exists(record.split('/')[0] + "/record/"):
            os.makedirs(record.split('/')[0] + "/record/")
        print("WE WILL RECORD")

    
   
        
    for i in range(trained_agents):
        output_filename1  =  args['outputStats'] + f"{i}_training_agent" + "_score" + ".csv"
        output_filename2  =  args['outputStats'] + f"{i}_training_agent" + "_key"+".csv"
        output_filename3 = args['outputStats'] + f"{i}_training_agent" + "_seed"+".csv"
        output_filename4 = args['outputStats'] + f"{i}_training_agent" + "_keyinput"+".csv"
        output_filename5 = args['outputStats'] + f"{i}_training_agent" + "_state"+".pickle"


        transitionMatrixTree = defineTransitionMatrix(
            pacman["test"], ghosts["test"], layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["test"])
        
        #save the randomness of the transition matrix
        #print("Randomeness: ", transitionMatrixTree.noise_list)
        #append_text_to_csv(output_filename3, transitionMatrixTree.noise_list)

        append_text_to_csv(output_filename3, transitionMatrixTree.seeds)

        for j in range(epochs // n_testing_steps):
            print(j, "th epochs now")

            recordpath = None
            if record and recordRange(j*n_training_steps, record_range):
                recordpath = record.split(
                    '/')[0] + "/record/" + record.split('/')[1] + f"{i}_training_agent_{j}_epoch"

            train_epoch(transitionMatrixTree, n_training_steps,
                        rules, pacman["test"], ghosts["test"], layout, display)
            #score:np array
            score, key_history, key_inputs, state_list = test_epoch(
                transitionMatrixTree, n_testing_steps, rules, pacman["test"], ghosts["test"], layout, display, record=recordpath)
            
            print("Saving the trained output to the file....")
            append_text_to_csv(output_filename1, score)
            append_df_to_csv(output_filename2, key_history)
            append_df_to_csv(output_filename4, key_inputs)
            with open (output_filename5, "wb") as file:
                pickle.dump(state_list, file)
            

            # # Create a DataFrame from the collected key press information
            # df = pd.DataFrame.from_records(key_history)
            # # Save the key press information to a CSV file
            # df.to_csv(output_filename2, index=False)
            


            stats[i][j] = np.mean(score)

        print('trained agent: ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        
       
        if pacman["test"].__class__.__name__ == "KeyboardAgent":
            pacmanType = loadAgent(pacmanName, 0)
        else:
            pacmanType = loadAgent(pacmanName, 1)
            pacman["test"] = pacmanType(pacmanArgs)
    
    #print("q value: ", pacman.q_values)

    # print("STATS IS ", stats)
        

    return np.mean(stats, 0)





def runEnsembleAgents(pacman, pacmanName, pacmanArgs, ghosts, layout, display, file_to_be_loaded=None, applyperturb=None, record=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, epochs // n_testing_steps], dtype=np.float32)

    env_pacman = pacman["test"]
    env_ghosts = ghosts["test"]
    perturbedenv_pacman = pacman["ensemble"]
    perturbedenv_ghosts = ghosts["ensemble"]

    if not os.path.exists(args['outputStats'].split('/')[0]):
        os.makedirs(args['outputStats'].split('/')[0])
    
    os.system("rm frames/**")

    if record:
        if not os.path.exists(record.split('/')[0] + "/record/"):
            os.makedirs(record.split('/')[0] + "/record/")

    for i in range(trained_agents):

        transitionMatrixTreeList = {}
        # normal environment agent
        transitionMatrixTree = defineTransitionMatrix(
            env_pacman, env_ghosts, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["test"])
        transitionMatrixTreeList["test"] = transitionMatrixTree

        transitionMatrixTree = defineTransitionMatrix(
            perturbedenv_pacman, perturbedenv_ghosts, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["ensemble"])
        transitionMatrixTreeList["ensemble"] = transitionMatrixTree

        for j in range(epochs // n_testing_steps):
            print(j)
            recordpath = None
            if record and recordRange(j*n_training_steps, record_range):
                recordpath = record.split(
                    '/')[0] + "/record/" + record.split('/')[1] + f"{i}_training_agent_{j}_epoch"

            if env_pacman.__class__.__name__ != "KeyboardAgent":
                train_epoch(transitionMatrixTreeList["test"], n_training_steps,
                            rules, env_pacman, env_ghosts, layout, display)
                train_epoch(transitionMatrixTreeList["ensemble"], n_training_steps,
                            rules, perturbedenv_pacman, perturbedenv_ghosts, layout, display)
            score = np.mean(test_epoch(
                transitionMatrixTreeList["test"], n_testing_steps, rules, env_pacman, env_ghosts, layout, display, ensemble_agent=perturbedenv_pacman, record=recordpath))
            stats[i][j] = score
        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        np.savetxt(args['outputStats'] +
                   f"{i}_training_agent.pkl", stats[i],  delimiter=',')

        # reinitialize agents
        perturbedenv_pacmanType = loadAgent(pacmanName, 1)
        perturbedenv_pacman = perturbedenv_pacmanType(pacmanArgs)
        pacmanType = loadAgent(pacmanName, 1)
        env_pacman = pacmanType(pacmanArgs)

    return np.mean(stats, 0)


def runGenralization(pacman, pacmanName, pacmanArgs, ghosts, layout, display, file_to_be_loaded=None, applyperturb=None, record=None, epochs=1000, trained_agents=500, n_training_steps=10, n_testing_steps=10, record_range=None, run_untill=None, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)

    stats = np.zeros(
        [trained_agents, len(GENERALIZATION_WORLDS) + 1, epochs // n_testing_steps], dtype=np.float32)

    if not os.path.exists(args['outputStats'].split('/')[0]):
        os.makedirs(args['outputStats'].split('/')[0])
    
    os.system("rm frames/**")

    if record:
        if not os.path.exists(record.split('/')[0] + "/record/"):
            os.makedirs(record.split('/')[0] + "/record/")
    
    for i in range(trained_agents):
        transitionMatrixTreeList = []
        transitionMatrixTree = defineTransitionMatrix(
            pacman["test"], ghosts["test"], layout, file_to_be_loaded=file_to_be_loaded, applyperturb=applyperturb["test"])
        transitionMatrixTreeList.append(transitionMatrixTree)
        if applyperturb:
            print("adding noise...")
            for n in range(len(GENERALIZATION_WORLDS)):
                newworld_pacman, newworld_ghosts = defineAgents(
                    GENERALIZATION_WORLDS[n], pacmanName, 1)
                transitionMatrixTreeList.append(defineTransitionMatrix(
                    newworld_pacman, newworld_ghosts, layout, file_to_be_loaded=file_to_be_loaded, applyperturb=GENERALIZATION_WORLDS[n]["perturb"]))

        for j in range(epochs // n_testing_steps):
            
            recordpaths = None

            if record and recordRange(j*n_training_steps, record_range):
                recordpaths = []
                for k in range(len(GENERALIZATION_WORLDS)):
                    token = "".join([f'_ghost{["name"]}_' + f'{ghost["args"]}' for ghost in GENERALIZATION_WORLDS[k]["ghosts"]])
                    recordpaths.append(record.split('/')[0] + "/record/" + record.split('/')[1] + token + f'_{GENERALIZATION_WORLDS[k]["perturb"]["noise"]}_'+ f"{i}_training_agent_{j}_epoch")

            print(j)
            train_epoch(transitionMatrixTreeList[0], n_training_steps,
                        rules, pacman["test"], ghosts["test"], layout, display)
            scores = test_noisy_agents_epoch(
                transitionMatrixTreeList[1:], n_testing_steps, rules, pacman["test"], ghosts["test"], layout, display, record=recordpaths)
            for k in range(len(scores)):
                stats[i][k][j] = np.mean(scores[k])

        print('trained agent ', i)
        print('Scores:       ', ', '.join([str(score) for score in stats[i]]))

        for k in range(len(GENERALIZATION_WORLDS)):
            token = "".join([f'_{ghost["name"]}_' + f'{ghost["args"]}' for ghost in GENERALIZATION_WORLDS[k]["ghosts"]])
            np.savetxt(args['outputStats'] + token + f'_{GENERALIZATION_WORLDS[k]["perturb"]["noise"]}_end_'
                       + f"{i}_training_agent.pkl", stats[i][k],  delimiter=',')

        pacmanType = loadAgent(pacmanName, 1)
        pacman["test"] = pacmanType(pacmanArgs)

    return np.mean(stats, 0)


if __name__ == '__main__':
    """
    The main function called when pacman.py is run
    from the command line:

    > python pacman.py

    See the usage string for more details.

    > python pacman.py --help
    """
    args = readCommand(sys.argv[1:])  # Get game components based on input
    if args['mode'] == 'l':
        output = runLearnability(args['pacman'], args['pacmanAgentName'], args['agentOpts'],
                                 args['ghosts'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], record=args['recording'], **args['statOpts'])
        
        #average over the game scores
        #append_text_to_csv(file_path, text)
        #np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 's':
        output = runStatistics(args['pacman'], args['pacmanAgentName'], args['agentOpts'],
                               args['ghosts'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], record=args['recording'], **args['statOpts'])
        np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'e':
        output = runEnsembleAgents(args['pacman'], args['pacmanAgentName'], args['agentOpts'],
                                   args['ghosts'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], record=args['recording'], **args['statOpts'])
        np.savetxt(args['outputStats']+".pkl", output,  delimiter=',')
    elif args['mode'] == 'g':
        output = runGenralization(args['pacman'], args['pacmanAgentName'], args['agentOpts'],
                                  args['ghosts'], args['layout'], args['display'], file_to_be_loaded=args['pretrainedAgentName'], applyperturb=args['perturbOpts'], record=args['recording'], **args['statOpts'])
        for n in range(len(GENERALIZATION_WORLDS)):
            np.savetxt(args['outputStats'] +
                       f"_{GENERALIZATION_WORLDS[n]}"+".pkl", output[n],  delimiter=',')

    pass