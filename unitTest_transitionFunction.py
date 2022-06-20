from transitionFunction import *
from pacman import *
import pprint


def runTransitionTest(layout, pacman, ghosts, display, numGames, record, numTraining=0, catchExceptions=False, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)
    games = []

    # we only need to run the probability calculation once I think per layout
    for i in range(numGames):
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
        game = rules.newGame(layout, pacman, ghosts,
                             gameDisplay, beQuiet, catchExceptions)

        # define transition function
        tree = TransitionFunctionTree(game)
        tree.computeProbabilities()
        print(tree.probabilities)

        game.run(i, numGames)
        if not beQuiet:
            games.append(game)

        if record:
            import time
            import cPickle
            fname = ('recorded-game-%d' % (i + 1)) + \
                '-'.join([str(t) for t in time.localtime()[1:6]])
            f = file(fname, 'w')
            components = {'layout': layout, 'actions': game.moveHistory}
            cPickle.dump(components, f)
            f.close()

    if (numGames-numTraining) > 0:
        scores = [game.state.getScore() for game in games]
        wins = [game.state.isWin() for game in games]
        winRate = wins.count(True) / float(len(wins))
        print 'Average Score:', sum(scores) / float(len(scores))
        print 'Scores:       ', ', '.join([str(score) for score in scores])
        print 'Win Rate:      %d/%d (%.2f)' % (wins.count(True), len(wins), winRate)
        print 'Record:       ', ', '.join([['Loss', 'Win'][int(w)] for w in wins])


def testCoherenceHashFunctions(game, tree):
    assert game.state == tree.getStatefromHash(
        game.state, tree.getHashfromState(game.state))
    assert [tree.toactions(Directions.NORTH), tree.toactions(Directions.SOUTH)] == tree.getKeysformHash(
        tree.getHashfromKeys([Directions.NORTH, Directions.SOUTH]))


def constructTransitionTest(layout, pacman, ghosts, display, numGames, record, numTraining=0, catchExceptions=False, timeout=30):
    import __main__
    __main__.__dict__['_display'] = display

    rules = ClassicGameRules(timeout)
    beQuiet = True
    import textDisplay
    gameDisplay = textDisplay.NullGraphics()
    rules.quiet = True

    game = rules.newGame(layout, pacman, ghosts,
                         gameDisplay, beQuiet, catchExceptions)

    # define transition function
    tree = TransitionFunctionTree(game)
    tree.computeProbabilities()
    tree.printSlicesOfTransitionMatrix(game.state)
    pprint.pprint(tree.transitionMatrixDic)


    return tree, game


def testCoherenceHashFunctionTest(tree, state):
    statehash = tree.getHashfromState(state)
    tostate = tree.getStatefromHash(state, statehash)

    try:
        assert str(tostate) == str(state)
    except:
        print("The State Hash Function is faulty")
    
    randomlist = random.sample(range(0, 5), tree.numAgents)

    actionash = tree.getHashfromKeys(randomlist)
    actions = tree.getKeysfromHash(actionash)

    try:
        for actionId in range(len(actions)):
            assert actions[actionId] == randomlist[actionId]
    except:
        print("The HashFunction is faulty")


if __name__ == "__main__":
    args = readCommand(sys.argv[1:])
    tree, game = constructTransitionTest(**args)

    # check that the State and Action HashFunction are completely invertible
    legal_acitons = game.state.getLegalActions(0)
    for action in legal_acitons:
        successor = game.state.generateSuccessor(
            0, action)
        testCoherenceHashFunctionTest(tree, successor)

    pass
