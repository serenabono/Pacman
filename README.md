# QLearningAgent

Welcome to the QlearningAgent codebase. This library primarily contains implementations of (Boltzmann exploration and E_greedy Q-learning) in (on-policy(SARSA) and off-policy) settings. Additionally, for interactive testing of the code, I've pushed it along with the open-source berkeley pacman domain. So you can make changes in real-time and see the policy changing. I've however made the agent domain agnostic, robust and adaptable to the point of simply calling 6 functions regardless of which domain you're in. Alright enough intro stuff, let's dive in.

## Files to consider

* QLearningAgent.py
* SearchAgents.py

QLearningAgent.py contains all of the implementation. However, if you don't want to look at the implementation of the algorithms themselves and would directly like to learn how to use the library, you can completely ignore this file. 

SearchAgents.py contains the code where the QLearning agent is defined and function calls to the library are made. You only need to look at GoWestAgent (I was in a hurry to implement this fast, so I didn't create a new agent name. I just completely modified the code of an agent that always took the action of going west. Later, at some point, I'll change the name. At this point GoWestAgent is actually a smart QLearner).

## A little bit about pacman domain (and the codebase)

Pacman is a famous Atari game released in the 1980. There’s a lot of interesting trivia about the game, but I won’t go into it here. The important thing is that this domain is and has been extensively used in RL research. 

Game dynamics: The goal of the agent (pacman) is to avoid ghosts and eat all the pellets on the map (For this version, I haven’t included ghosts getting scared, etc). The actions of the ghost are completely stochastic and the model unknown, thus, making it an ideal test bed for model-free qlearning. 

You can define any map you’d like for this codebase. The maps are given in /layouts. They are text files and can be easily modified using any text editor. For this tutorial, I’ll use the map layouts/v2.lay

you can run the game using the following command:

```
python pacman.py -p GoWestAgent -l v2 -n 1000 -q
```

Flags:
* -p: Name of the agent. In our case, it is GoWestAgent (which is actually the QLearner)
* -l: Name of the layout. In our case, it is v2
* -n: Number of training/evaluation episodes
* -q: Quiet mode


## Back to QLearningAgent

If you look at the class GoWestAgent inside searchAgents.py, you’ll see that there is a constructor and a function getAction(). This function is responsible for returning the action that pacman should take in any given state. It has access to the current state, reward and legal actions that can be taken in the current state. 

### Constructor

In order to write an agent for any domain, you need to first create a QLearningAgent using the constructor. I’ve created this in the init() function.


```
self.agent = QLearningAgent(exploration_strategy="BOLTZMANN", T=1.5, epsilon=None, 
            on_policy=False, initialization_value=0, gamma=0.9, alpha=0.05, is_train=True, 
            load_existing_agent=True)
```

let me explain each parameter:

* **Exploration strategy**: Can either be either “BOLTZMANN” or “E_GREEDY”
* **T**: Temperature constant for BOLTZMANN explotation
* **epsilon**: Initial epsilon for E_GREEDY exploration
* **on_policy**: False/True. If true, agent will do SARSA. If false, agent will do regular q-learning
* **Inititialization value**: Initial values in the q-table
* **gamma**: discount factor
* **alpha**: learning rate
* **is_train**: True/False. If it is true, the agent will learn and update its q_values. It’ll also return a sampled action depending on the exploration strategy used. If this is False, the agent will not update any q_values and will simply take the max_action in any given state. This method is primarily to evaluate the policy of an agent. Thus, it is important that an “agent.pkl” file be present in the directory in order to evaluate an already existing agent. (you can write your agent at the end of learning by simply calling:

```
self.agent.save_agent_to_disk()
```

* **load_existing_agent**: True/False. Sometimes, you might want to have the agent learn for a few episodes. Then stop learning and evaluate the policy. And then finally, again load the existing agent to continue learning. In such cases, you can set the load_existing_agent parameter to true along with is_train=true. 


*Note: By default, if is_train=False, the value of load_existing_agent does not matter. It’ll bypass default load and existing agent it it exists (since the whole point of is_train is to either train an agent or evaluate an existing agent)**.*

### * *Function calls

Regardless of which state you’re in or what domain you’re in. During each time step, you should make the following 6 calls. In our case, every time pacman needs to take an action (after the ghost has moved), it makes the 6 function calls in getAction().


```
        self.agent.set_current_state(state_rep)
        self.agent.set_current_legal_actions(actions_rep)
        self.agent.set_current_state_type(state_type)
        self.agent.initialize_q_values_if_absent()
        action = self.agent.get_action()
        self.agent.update(reward)
```



* **set_current_state**: Set whatever state you’re in. For this domain, I just fed the entire configuration of the map at the timestep.
* **set_current_legal_actions**: Set the legal actions you can take in a given state. This is an array. For example, in a given state, the only actions possible might be [“West”, “South”]
* **set_current_state_type**: Can be either “initial”, “mid_episode” or “terminal”. 
* **initialize_q_values_if_absent**: This call is important for q-learning internal bookkeeping.
* **get_action**: This function returns one of possible legal actions you set in bullet 2 (based on whether is_train is set to True or False)
* **update**: Performs q_value updates



## How do I run this code?

First train the agent. So, 
set is_train=True in the constructor and run.

```
python pacman.py -p GoWestAgent -l v2 -n 1000 -q
```

If you’re doing Boltzmann exploration off-policy with the default parameters, you see the agent win about 92% of the time. You should also have a file called "agent.pkl" at this point. 

Now, test the agent:
**set is_train=False** in the constructor and run the aforementioned command again. This time you should see a win rate of 100% because you’re evaluating an already trained agent. 

If you wish to see the policy in action, 
**set is_train=False** in the constructor and run:

```
python pacman.py -p GoWestAgent -l v2 -n 10
```

Pacman will play 10 games and since the -q flag isn’t present, you’ll be able to see pacman execute the policy with graphics. 


Please feel free to reach out with any questions! Have fun!




