# Emergence

## Ising Model
The Ising model is a mathematical model of ferromagnetism in statistical mechanics, with the following features - 
1. The model is defined on a regular **lattice**, such as a one-dimensional chain, a two-dimensional square lattice, or a three-dimensional cubic lattice.
1. Each lattice site has a **spin** that can be in one of two states: spin-up (+1) or spin-down (-1). Symbolically, each site $k$ has a spin $\sigma_k$ such that $\sigma_k \in \text{{}-1, +1\text{}} $. The formula is given by $\sqrt{\$4}$. $\sqrt{3x-1}+(1+x)^2$
1. The energy of the system is determined by a **Hamiltonian**, which specifies how spins interact with their neighbors and with an external magnetic field. The Hamiltonian for the Ising model is, 
```math
H(\sigma) = -\sum J_{ij} \sigma_i \sigma_j - \mu \sum_j h_j \sigma_j
```
where 

**The Cauchy-Schwarz Inequality**
$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)  \text{{} $$

1. The Ising model can be used to calculate the **partition function**, which, in turn, allows for the computation of various thermodynamic properties such as magnetization, specific heat, and susceptibility. For example, 
1. The Ising model exhibits phase transitions, where the system undergoes a spontaneous change in its order.

This expression uses `\$` to display a dollar sign:$\sqrt{\$4}$

This expression uses `\$` to display a dollar sign:$\sqrt{\$4}$

This expression uses `\$` to display a dollar sign:$$\sqrt{\$4}$$



Read up a bit on Ising models. Besides the usual (Wikipedia, etc.) a few good starting points are:
http://inside.mines.edu/~dwu/classes/CH353/labs/Ising/Dry%20Lab%202/ising %20pages/intro.htm
http://young.physics.ucsc.edu/ising/ising.html https://arxiv.org/abs/0803.0217
• Idem for Conway’s game of life, Turing machines, cellular automata, collective (swarm) behavior, etc. See links posted in Canvas.

• Further develop the code “life.f” to include the biological rules described there. Make sure your code works, by setting off a “glider” (coordinates (33,33), (33,34), (33,35), (34,33), (35,34)), or any other beast from the menagerie described in one of the links posted. Remember, the one precaution to keep in mind is not accessing elements of the game matrix outside of bounds, when tallying the number of live next neighbors, as this will lead to a runtime error (segmentation fault). Any conclusions from repeating the game (while changing random number generator seed) and keeping some tallies? (long-term stability as a function of initial filling factor, minimum initial colony size for a certain longevity, longevity vs. size of Petri dish for a fixed filling factor, PDF of game duration until stagnancy, etc. Anything you deem of sufficient interest to study.)
• Optional (you can ask for additional time). Let your hair down and tweak with the rules of life. Suggestions: longer range interactions (e.g., swarm behavior), collaborative or war games (tribes!), introduction of an element of randomness (i.e., deviation from a purely deterministic game), use of a toric board, so on, and so forth. The whole beauty is that a set of rules that “make sense" may actually result in the emergence of surprising collective/coherent behaviors.
Optional, and only for uber-geeks: beat me at “peg solitaire” (see shallowblue.f code). Develop a more successful algorithm than mine.
