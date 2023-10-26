# Emergence
Emergence is the unexpected complexity and structure generated out of simple building blocks, subject to disorder, but constrained by a few rules. This chapter discusses a few examples.

## Ising Model
The Ising model is a mathematical model of ferromagnetism in statistical mechanics, with the following features - 
1. The model is defined on a regular _**lattice**_, such as a one-dimensional chain, a two-dimensional square lattice, or a three-dimensional cubic lattice.

1. Each lattice site has a _**spin**_ that can be in one of two states: spin-up (+1) or spin-down (-1). Symbolically, each site $k$ has a spin $\sigma_k$ such that $\sigma_k \in (-1, 1)$. 

1. The energy of the system is determined by a _**Hamiltonian**_, which specifies how spins interact with their neighbors and with an external magnetic field. The Hamiltonian for the Ising model is, 
$$H(\sigma) = -\sum J_{ij} \sigma_i \sigma_j - \mu \sum_j h_j \sigma_j$$
where $\sigma$ is the configuration, $H$ is the Hamiltonian, sites $i, j$ are nearest neighbors with interaction $J_{ij}$, $\mu$ is the magnetic moment, $h_j$ is an external magnetic field. The first part of the Hamiltonian describes spin-spin interaction, and the second part of the Hamiltonian describes spin-field interaction.

   If $J_{ij}>0$, $\uparrow \uparrow$ and $\downarrow \downarrow$ are energetically favored, and the interaction is ferromagnetic; if $J_{ij}<0$, $\uparrow \downarrow$ and $\downarrow \uparrow$ are energetically favored, and the interaction is antiferromagnetic; if $J_{ij}=0$, the spins are noninteracting. 

   If $h_j>0$ the spin site $j$ desires to line up in the positive direction; if $h_j<0$ the spin site $j$ desires to line up in the negative direction; if $h_j=0$, there is no external influence on the spin site.

1. The Ising model can be used to calculate the _**partition function**_, which, in turn, allows for the computation of various thermodynamic properties such as magnetization, specific heat, and susceptibility. The partition function is,
$${Z_\beta} = \sum_\sigma e^{-\beta H(\sigma)}$$

1. The _**configuration probability**_ is given by the Boltzmann distribution with inverse temperature $\beta \geq 0$:
$$P_\beta(\sigma) = \frac{e^{-\beta H(\sigma)}}{Z_\beta}$$
where $\beta=(k_\beta T)^{-1}$, and $Z_\beta$ is the partition function. For any observable $X$ as a function of spins, the _**expectation**_ (statistical average) of $X$ is given by, 
$$\langle X \rangle_\beta = \sum_\sigma X(\sigma) P_\beta(\sigma) = \frac{1}{Z_\beta} \sum_\sigma X(\sigma) e^{-\beta H(\sigma)}$$

1. The Ising model exhibits _**phase transitions**_, where the system undergoes a spontaneous change in its order. The most famous phase transition predicted in the Ising model is the ferromagnetic phase transition, where spins align and the material becomes magnetized. 

1. Due to the complexity of solving the Ising model analytically, numerical techniques like _**Monte Carlo simulations**_ are often used to study the behavior of the model and explore its phase transitions. An example is the Metropolis algorithm as follows - 
   1. Establish an initial microstate.
   1. Choose a spin at random and make a trial flip.
   1. Compute the change in the energy of the system due to the trial flip, $\Delta H := H_{trial} - H_{old}$. 
   1. If $\Delta H \leq 0$, accept the new microstate and go to step viii. 
   1. If $\Delta H < 0$, compute the quantity $w = e^{- \beta \Delta H}$.
   1. Generate a uniform random number $r$ in the unit interval $[0, 1]$.
   1. If $r \leq w$, accept the new microstate; otherwise retain the previous microstate.
   1. Determine the value of the desired physical quantities.
   1. Repeat steps ii through viii to obtain a sufficient number of microstates.
   10. Periodically compute averages over the microstates. 
   
   
## Cellular Automaton
Cellular automata (singular: cellular automaton) are mathematical and computational models used to study and simulate complex systems, often in the fields of physics, computer science, and biology. The cellular automaton consists of a line of cells, each colored either black or white. At every step there is then a definite rule that determines the color of a given cell from the color of that cell and its immediate left and right neighbors on the step before. Key characteristics of cellular automata include -
1. _**Grid Structure**_: Cellular automata are typically represented as a grid or lattice, where each cell can be in a particular state. The grid can be one-dimensional, two-dimensional, or even higher-dimensional, depending on the specific problem being modeled.

1. _**Discrete Time Steps**_: The system evolves in discrete time steps, with the state of each cell at time $t+1$ determined by the state of neighboring cells at time $t$.

1. _**Local Interaction**_: Cellular automata exhibit local interactions, meaning that the state of each cell depends on the states of its immediate neighbors (e.g., adjacent cells in the grid).

1. _**Rule-Based Evolution**_: The behavior of a cellular automaton is defined by a set of rules. These rules specify how each cell's state should change based on the states of its neighbors. Starting with three original cells each with two possible states, there are $2^3=8$ possible initial conditions. To create a rule for the next cell being black or white based on these configurations, there are then a total of $2^8=256$ possible rules. 

1. _**Emergent Patterns**_: One of the most intriguing aspects of cellular automata is their ability to generate complex, emergent patterns from relatively simple rules. For example, some basic types of patterns include 1) repetition, where a very simple pattern is formed, 2) nesting, where overall a very regular nested structure emerges, 3) irregularity, where there is a pattern that seems in many respects random, and 4) localization, where more elaborate localized structures are generated and interact in a complex manner.

1. _**Variations**_: There are several more complicated variations of cellular automaton. For example, 1) _mobile automata_ are similar to cellular automata except that they have just a single “active cell” that gets updated at each step. 2) [_Turing machines_](https://mathworld.wolfram.com/TuringMachine.html) are similar to mobile automata in that they consist of a line of cells, known as the “tape”, together with a single active cell, known as the “head”. But, the head in a Turing machine can have several possible states. 3) _Substitution systems_ are set up so that the number of elements can change, i.e. for a sequence of elements, at each step each one of the elements is replaced by a new block of elements. Just to name a few variations. 



## Philosophy 
Is the universe a computer? Do we live in a simulation? Does free will exist? 

Scientists have long debated on whether the universe is analog or digital. Classical physics studies continuous variables over continuous time by methods such as calculus. Quantum mechanics establishes that many observables, such as the energy levels of an atom, are discretized. But is the universe _inherently_ digital? And what causes these quantized features to emerge? Nobel laureate Gerard ’t Hooft thinks that some sort of information processing on a submicroscopic level is responsible for the quantum features that describe detectable reality, and calls this version of quantum physics the _cellular automaton interpretation_.

Stephen Wolfram studied cellular automata in the 1980’s, concluded that all the complexities of the natural world could arise from cellular automata–like processes, and holds the [controversial opinion](https://www.scientificamerican.com/article/physicists-criticize-stephen-wolframs-theory-of-everything/) that “from an extremely simple model, we’re able to reproduce special relativity, general relativity and the core results of quantum mechanics”, and even evolution. Key ideas/ findings/ approaches in his book “A New Kind of Science” include - 
* Complex behavior can arise from very simple rules. 
* Everyday computer programs are normally set up to perform very definite tasks. But,  the key idea was to ask what happens if one instead just looks at simple arbitrarily chosen programs, created without any specific task in mind. How do such programs typically behave? 
* Existing methods in theoretical physics tend to revolve around ideas of continuous numbers and calculus—or sometimes probability. Most of the systems in the book involve just simple discrete elements with definite rules. 
* Something irreducible can be achieved by the passage of time, which leads to an explanation of how we as humans can still show free will. 

## Swarm Behavior

## Conway's Game of Life
Conway's game of life is a famous example of a 2D cellular automaton, and has been extensively studied for its ability to produce various patterns, including gliders, oscillators, and still lifes.

• Further develop the code “life.f” to include the biological rules described there. Make sure your code works, by setting off a “glider” (coordinates (33,33), (33,34), (33,35), (34,33), (35,34)), or any other beast from the menagerie described in one of the links posted. Remember, the one precaution to keep in mind is not accessing elements of the game matrix outside of bounds, when tallying the number of live next neighbors, as this will lead to a runtime error (segmentation fault). Any conclusions from repeating the game (while changing random number generator seed) and keeping some tallies? (long-term stability as a function of initial filling factor, minimum initial colony size for a certain longevity, longevity vs. size of Petri dish for a fixed filling factor, PDF of game duration until stagnancy, etc. Anything you deem of sufficient interest to study.)
• Optional (you can ask for additional time). Let your hair down and tweak with the rules of life. Suggestions: longer range interactions (e.g., swarm behavior), collaborative or war games (tribes!), introduction of an element of randomness (i.e., deviation from a purely deterministic game), use of a toric board, so on, and so forth. The whole beauty is that a set of rules that “make sense" may actually result in the emergence of surprising collective/coherent behaviors.
Optional, and only for uber-geeks: beat me at “peg solitaire” (see shallowblue.f code). Develop a more successful algorithm than mine.
