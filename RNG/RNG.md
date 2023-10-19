# Random Number Generator

## Introduction 
Random Number Generators (RNG) are used for...
In this project, I study xx different RNGs: `RND()`, `RANDM()`, `RANDU`, `RANDOM_NUMBER`, `R250` generator, routine from Numerical Recipe, and a paper posted on Canvas. For each RNG, I will 1) explain how the random number is generated, 2) test and visualize the performance of the random numbers generated, 3) conclude about the respective qualities of these RNGs. I will test the RNGs in a few ways with various degree of statistical rigor: 1) sort the random numbers in histogram bins and check for statistically significant deviations from the mean (vary the seed, and the numerical precision of the variable holding the random number), 2) examine correlations between triplets, 3) plot the frequency of appearance of 0-9 integers at a certain decimal position, 4) implement the "maximum spacing" method in J. Heinrich's paper. 

## Fundamentals of RNGs
[Visit OpenAI](https://www.openai.com)

## Performance Testing of the RNGs

How the histogram works. 
Can make fancy plots for the distribution - q-q plot, chi-square distribution, sigma testing, with brief justification, 3D plots (random angle, and find the angle that display the bad structure) 
