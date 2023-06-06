import pickle


with open('/home/seb300/QLearningAgentTransitionFunction/recordings_v2_BoltzmannAgent_MoveMostlyWestGhost_{"index":1,"prob":0.1}_{"mean":0,"std":0}}/saved_agent_v2_BoltzmannAgent_MoveMostlyWestGhost_{"index":1,"prob":0.1}_{"mean":0,"std":0}_500-14607-06:06:2023-03:33:25-test-RECORDING-99_epoch_0_agent-9_round.pkl', 'rb') as f:
    data = pickle.load(f)

print(data)