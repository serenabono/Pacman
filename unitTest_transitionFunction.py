from transitionFunction import *
from pacman import *
import pprint

def runTransitionTest( layout, pacman, ghosts, display, numGames, record, numTraining = 0, catchExceptions=False, timeout=30 ):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)
    games = []

    for i in range( numGames ): # we only need to run the probability calculation once I think per layout
        print(i)
        beQuiet = i < numTraining
        if beQuiet:
                # Suppress output and graphics
            import textDisplay
            gameDisplay = textDisplay.NullGraphics()
            rules.quiet = True
        else:
            gameDisplay = display
            rules.quiet = False
        game = rules.newGame( layout, pacman, ghosts, gameDisplay, beQuiet, catchExceptions)
        
        #define transition function
        tree = TransitionFunctionTree(game)
        tree.computeProbabilities()
        print(tree.probabilities)

        game.run(i, numGames)
        if not beQuiet: games.append(game)

        if record:
            import time, cPickle
            fname = ('recorded-game-%d' % (i + 1)) +  '-'.join([str(t) for t in time.localtime()[1:6]])
            f = file(fname, 'w')
            components = {'layout': layout, 'actions': game.moveHistory}
            cPickle.dump(components, f)
            f.close()

    if (numGames-numTraining) > 0:
        scores = [game.state.getScore() for game in games]
        wins = [game.state.isWin() for game in games]
        winRate = wins.count(True)/ float(len(wins))
        print 'Average Score:', sum(scores) / float(len(scores))
        print 'Scores:       ', ', '.join([str(score) for score in scores])
        print 'Win Rate:      %d/%d (%.2f)' % (wins.count(True), len(wins), winRate)
        print 'Record:       ', ', '.join([ ['Loss', 'Win'][int(w)] for w in wins])

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
        tmat = tree.transitionMatrix
        #tree.printSlicesOfTransitionMatrix()

        # confirm the size of the probability tree
        # manual check: there are 
        print "the transition matrix size is:"
        print(tmat.shape)
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
