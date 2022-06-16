from transitionFunction import *
from pacman import *
import pprint

def constructTransitionTest( layout, pacman, ghosts, display, numGames, record, numTraining = 0, catchExceptions=False, timeout=30 ):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)
    games = []

    for i in range( 1 ):
        # print(i)
        # Suppress output and graphics
        beQuiet = True
        import textDisplay
        gameDisplay = textDisplay.NullGraphics()
        rules.quiet = True

        game = rules.newGame( layout, pacman, ghosts, gameDisplay, beQuiet, catchExceptions)
        
        #define transition function
        tree = TransitionFunctionTree(game)
        tree.computeProbabilities()
        tmat = tree.transitionMatrixDic
        tree.printSlicesOfTransitionMatrix(0)

        print "the transition matrix dictionary is: "
        print ("length: %d" % len(tmat))
        pprint.pprint(tmat)

        # confirm the size of the probability tree
        # manual check: there are 
        # print "the transition matrix size is:"
        # print(tmat.shape)
        # print "the transition matrix: "
        # for a in tree.actions:
        #     print("slice for action " + a + ":")
        #     slicemat = tmat[:, :, tree.actions.index(a)]
        #     print(slicemat)
        #     print("spot checking the %s transition matrix: " % a)
        #     fromind = np.random.choice(np.arange(tree.numStates))
        #     #import pdb; pdb.set_trace();
        #     probs = slicemat[fromind]
        #     toind = np.argmax(probs)
        #     #import pdb; pdb.set_trace();
        #     print("going from this state: ")
        #     print(tree.statetoid[fromind])
        #     print ("to this state: ")
        #     print(tree.statetoid[toind])
        #     print ("with probability: ")
        #     print (probs[toind])


if __name__ == "__main__":
    args = readCommand( sys.argv[1:] )
    constructTransitionTest( **args )
    pass
