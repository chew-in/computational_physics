# Artificial Neural Network (ANN)
In this project, we will build perceptrons (also known as McCulloch–Pitts neuron, or M-P neuron) in Python, which is the simplest kind of artificial neural network, to implement equivalence and XOR logics.

## Introduction
**_Artificial neural networks (ANN)_** are information processing systems modeled after the human brain. Like the human brain, an ANN possesses a large number of highly interconnected processing elements called neurons, much like biological cells. Each artificial neuron has an internal state of its own called the activation. Each artificial neuron is connected to other artificial neurons via interconnection links specified by the weights, much like dendrites. The transmission of activation signal goes from the output of a neuron to the input of other neuron(s), whose biologically analogs take place from the axon of the output neuron, to the soma of the input neuron. The human brain learns by modifying the biological connections between neurons after being stimulated by chemical signals, and similarly the ANN learns by making adjustments to the synaptic connections that exist between the neurons.

The power of biological or artificial neural network come from 1) the vast number of neurons, 2) the multiple interconnectivity between them, and 3) the different classes of neurons available. In contrast with the more traditional methods of computing, ANNs can derive meanings from complicated or imprecise data, extract patterns and detect trends that are too complex to be noticed otherwise, and answer ‘what if’ questions. Due to these advantages, ANN are well-suited for tasks such as pattern-matching and classification, optimization function, approximation, vector quantization, and data clustering.

ANN and the human brain have a few major differences as follows. The speed for execution cycle time is a lot faster in a typical ANN than in a human brain. ANN also processes parallel operations simultaneously faster. The human brain has a lot more cells and complexity built into it. Fault tolerance is only handled in the human brain by its distributed nature, where the death of cells is not disastrous. Memory and control mechanisms are also handled differently between biological and artificial neurons.

ANN is specified by three entities: 1) synaptic interconnections, 2) learning rules for updating weights, 3) activation functions. Categorizing them in terms of synaptic interconnections, ANNs come in five main types of network architecture:
1. Single-layer feed-forward network
1. Multilayer feed-forward network
1. Single node with its own feedback
1. Single-layer recurrent network
1. Multilayer recurrent network

In this project we will only focus on the simplest topology, a single-layer perceptron. 

## Perceptron
A _**single-layer perceptron**_, also called McCulloch–Pitts neuron, or M-P neuron, is the simplest architecture of an artificial neural network. The term single-layer means that other than the input neurons and the output neuron, there is no hidden layer of neurons between them for computation. A single-layer perceptron is a _**feed-forward**_ network, meaning that no neuron in the output layer is an input to a node in the same layer or in the preceding layer. 

_**Architecture**_. The perceptron needed consists of four input neurons , one output neuron , and the interconnections between them are denoted by the weights  where  denotes pointing from input  to output . Like a biological neuron, the weights may be either excitatory (positive) or inhibitory (negative).

_**Activation function**_. In general, an activation function associated with a neuron transforms the net input to the desired output. There are many examples of activation functions, such as 
1. The identity function $f(x)=x$, used in the input layer.
1. The step functions, including 1) the binary step function $f(x)=1$ if $x \geq \theta$ and $f(x)=0$ if $x \leq \theta$, where $\theta$ is the threshold value, or 2) the bipolar step function $f(x)=1$ if $x \geq \theta$ and $f(x)=-1$ if $x \leq \theta$, both used in the output layer.
1. The ramp function $f(x)=0$ if $x < 0$, $f(x)=x$ if $0 \leq x \leq 1$, and $f(x)=1$ if $x > 1$.
1. The binary sigmoid function $f(x)=\frac{1}{1+e^{-x}}$ whose output ranges from $0$ to $1$.
1. The hyperbolic tangent function, $f(x)=\frac{1-e^{-2 x}}{1+e^{- 2x}}$ whose output ranges from $-1$ to $+1$. This is mathematically equivalent to the bipolar sigmoid function.

Note that the nonlinearity of the binary sigmoid function and the hyperbolic tangent function help bound the output. In our project, we will experiment with both of them.

## Project 1 - single-layer perceptron for equivalence relation
We will implement an equivalence logic on the perceptron as described in the following truth table. 
| Header 1 | Header 2 | Header 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

- performance plot comparing tanh and sigmoid
- 


## Project 2 - two-layer perceptron for XOR relation
Train it in batch mode with the four examples mentioned in our slides, and test it with the other four remaining cases. 
Does it work? If you observe any limitations, explain their cause. Does it work for the example provided in the slides involving the XOR function?

###############Juan 
## Transfer Function
Compare the performance of the tanh and sigmoid transfer functions in your code (do not forget to change their derivative when doing this, also in the validation process). Is one faster than the other? (use the command CALL CPU_TIME( ) to time your code at given intervals). Does one work better than the other for the test inputs? If so, why?

## Learning Rate 
Optimize the learning rate separately for these two transfer functions. Do this by plotting the error vs. training epoch, as in the example below. Describe your observations.

# Performance Analysis
* Does the performance (error vs. epoch, or error in validation set) improve if you expand the training set? (e.g., by adding one more case to it). 
If you scramble it? (stay at four training cases, but use other cases for training). 
Do not forget to update the dimensions of your matrices when adding or subtracting new cases to the training set.

* Once your code is built, test it for other patterns of your own that link inputs and outputs: in doing so, develop a feeling for the limitations of the single neuron perceptron.


OPTIONAL: attempt the two-layer perceptron able to describe the XOR relation
(see http://iamtrask.github.io/2015/07/12/basic-python-network/ for guidance).
