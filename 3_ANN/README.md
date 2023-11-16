# Artificial Neural Network (ANN)
In this project, we will build 1) a single layer perceptron for equivalence logic, 2) a double layer perceptron for XOR logic, 3) a full neural network for categorizing MNIST dataset, in Python.

Useful resource for theory: 1) 3Blue1Brown video, 2) http://neuralnetworksanddeeplearning.com/index.html

## Project 1 - single-layer perceptron for equivalence
* Data. We have three binary inputs and one binary output, whose relationship is described by Output = Input 1. 
   - The original training set contains 4 cases. The original test set contains 4 cases. 
   - The expanded training set contains 5 cases, one from the original test set. The reduced test set contains 3 cases, one taken out. 
   - The scrambled training set contains 4 cases, the scrambled test set contains 4 cases, but with an original training and an original test case swapped. 

Training set, original: 
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 1      | 0      |
| 0      | 1      | 1      | 0      |
| 1      | 0      | 1      | 1      |
| 1      | 1      | 1      | 1      |

Test set, original:
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 0      | 0      |
| 0      | 1      | 0      | 0      |
| 1      | 0      | 0      | 1      |
| 1      | 1      | 0      | 1      |

Training set, expand: 
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 1      | 0      |
| 0      | 1      | 1      | 0      |
| 1      | 0      | 1      | 1      |
| 1      | 1      | 1      | 1      |
| 0      | 0      | 0      | 0      |

Test set, expand:
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 1      | 0      | 0      |
| 1      | 0      | 0      | 1      |
| 1      | 1      | 0      | 1      |

Training set, scramble: 
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 1      | 0      |
| 0      | 1      | 1      | 0      |
| 1      | 0      | 1      | 1      |
| 1      | 0      | 0      | 1      |

Test set, scramble:
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 0      | 0      |
| 0      | 1      | 0      | 0      |
| 1      | 1      | 1      | 1      |
| 1      | 1      | 0      | 1      |

* Architecture. This neural network has only one single layer, with three input neurons, one output neuron, and a weight matrix of the shape $3 \times 1$. There is no hidden layer of neurons between the input and output. We do not include a bias term here to keep the architecture as simple as possible. 

* Transfer function. In general, a nonlinear transfer function is needed to bound the output. We experiment with both sigmoid function $\sigma(z)=\frac{1}{1+e^{-z}}$, and hyperbolic tangent tanh function $\tanh(z)=\frac{e^{z}-e^{-z}}{e^{z}+e^{-z}}$.

* Gradient descent. Back-propagation is an general algorithm that performs a backward pass to adjust the parameters of a neural network, aiming to minimize error, a.k.a. cost function. One commonly used algorithm to find the set of weights that minimizes the cost function is gradient descent. Gradient descent algorithm calculates the partial derivative of the cost function with respect to each weight, and take a step at the opposite direction for maximal decrease of the error. The size of the step is determined by the learning rate. Mathematically, let weights of layer $L$ be denoted by $w^{(L)}$, weighted sum by denoted by $z^{(L)}$. activation of the last layer neuron is $a^{(L)}$, 
   - Activation is given by,
$$a^{(L)} = \sigma(z^{(L)}) = \sigma(w^{(L)}a^{(L-1)}+b^{(L)})$$
   - Cost function for first training example, 
$$C_0= (a^{(L)}-y)^2$$
Partial derivative of this cost function w.r.t. each weight, 
$$\frac{\partial C_0}{\partial w^{(L)}} = \frac{\partial C_0}{\partial a^{(L)}} \frac{\partial a^{(L)}}{\partial z^{(L)}}  \frac{\partial z^{(L)}}{\partial w^{(L)}}$$
   - Term by term,
$$\frac{\partial C_0}{\partial a^{(L)}} = 2(a^{(L)}-y)$$
$$\frac{\partial a^{(L)}}{\partial z^{(L)}} =\sigma’(z^{(L)})$$
$$\frac{\partial z^{(L)}}{\partial w^{(L)}} =a^{(L-1)}$$
   - Altogether, 
$$\frac{\partial C_0}{\partial w^{(L)}} =2(a^{(L)}-y) \sigma’(z^{(L)}) a^{(L-1)}$$
   - Average cost function for all training example for batch training, 
$$\frac{\partial C}{\partial w^{(L)}} = \frac{1}{n} \sum_{k=0}^{n-1} \frac{\partial C_k}{\partial w^{(L)}}$$

* Learning rate. The plots below shows the training error as a function of the training epoch number, of the original, expanded, and scrambled training sets. Each plot compares sigmoid and tanh transfer functions, and various learning rates. This plot is used to pick the most optimized learning rate for each transfer function. This is in rough agreement with the paper. 

![train_original](./plots/train_original.png)

![train_expand](./plots/train_expand.png)

![train_scramble](./plots/train_scramble.png)

* Testing. Performance of test cases on optimized learning rate are plotted for original, expanded, and scrambled datasets. A few observations: 
   - tanh successfully predicts the test cases accurately and consistently, but sigmoid fails on the test cases even when the training error is low.
   - In particular, the large errors for sigmoid comes from the mathematical difference between sigmoid and tanh functions, even though their overall shapes look similar. Specifically, sigmoid ranges from $0$ to $1$ and $s(0)=0.5$, whereas tanh ranges from $-1$ to $1$ and $\tanh(0)=0$. 
   - This makes all the difference because given the same net input, say $0$, tanh predicts $0$ (which is correct) while sigmoid predicts $0.5$ (which is wrong). But the calculated gradient term is $0$ for both since it is a product of three terms including the input $0$. As a result, even though the sigmoid function sees a discrepancy between the predicted output $0.5$ and the desired output $0$, it does not have the suitable instrument to correct for the error in the gradient descent algorithm. One caveat is that sigmoid could adjust the weights so that the net input is very negative, but this approach biases other results. So, without including a bias term, sigmoid is not suitable to be the transfer function for the problem at hand where the input/ output function crosses the origin.

![test_original](./plots/test_original.png)

![test_expand](./plots/test_expand.png)

![test_scramble](./plots/test_scramble.png)

## Project 2 - two-layer perceptron for XOR relation

We will implement the XOR logic on the perceptron as described in the following truth table. See xxx notebook for details.

Training set, original: 
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 1      | 0      |
| 0      | 1      | 1      | 1      |
| 1      | 0      | 1      | 1      |
| 1      | 1      | 1      | 0      |

Test set, original:
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 0      | 0      |
| 0      | 1      | 0      | 1      |
| 1      | 0      | 0      | 1      |
| 1      | 1      | 0      | 0      |

Training set, expand: 
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 1      | 0      |
| 0      | 1      | 1      | 1      |
| 1      | 0      | 1      | 1      |
| 1      | 1      | 1      | 0      |
| 0      | 0      | 0      | 0      |

Test set, expand:
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 1      | 0      | 1      |
| 1      | 0      | 0      | 1      |
| 1      | 1      | 0      | 0      |

Training set, scramble: 
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 1      | 0      |
| 0      | 1      | 1      | 0      |
| 1      | 0      | 1      | 1      |
| 1      | 0      | 0      | 1      |

Test set, scramble:
| Input 1    | Input 2    | Input 3    | Output    |
| ----------- | ----------- | ----------- | ----------- |
| 0      | 0      | 0      | 0      |
| 0      | 1      | 0      | 1      |
| 1      | 1      | 1      | 0      |
| 1      | 1      | 0      | 0      |



