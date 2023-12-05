# Finite Element Analysis 
This project will attempt to numerically solve the heat diffusion equation in 2D from scratch before using a commercially available FEA software such as COMSOL. 

## Background
Finite Element Analysis (FEA) uses numerical methods to solve a system of equations that represents the physical behavior of the structure, by solving for the unknowns (displacements, temperatures, etc.) at each node of the mesh. FEA can be applied to solve processes described by a system of differential equations, such as heat transfer.

Our goal is to solve the 2D heat equation,
$$\frac{\partial T}{\partial t} = D \nabla^2 T = D \left(\frac{\partial^2 T}{\partial x^2} + \frac{\partial^2 T}{\partial y^2} \right)$$

In general for solving a 2D parabolic equation of the kind
$$\frac{\partial u}{\partial t} = \kappa \left(\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} \right)$$
Let $i, j, n$ denote the discrete steps for $x, y, t$, i.e. $x=i\Delta x, y=j\Delta y, t=n\Delta t$, then the value of the function at a specific location at a specific time can be simply denoted as $u_{i,j,n}$.

According to Taylor’s theorem,
$$u_{i+1}\approx u_{i} + \Delta x \cdot u'(x) +\frac{1}{2}(\Delta x)^2\cdot u''(x)$$
$$u_{i-1}\approx u_{i} - \Delta x \cdot u'(x) +\frac{1}{2}(\Delta x)^2\cdot u''(x)$$
Therefore, the first order derivatives can be approximated by,
$$u'(x)=\frac{1}{2\Delta x} \left(u_{i+1} - u_{i-1}\right)$$
Or alternatively, the forward-difference formula,
$$u'(x)\approx \frac{1}{\Delta x} \left(u_{i+1} - u_{i}\right)$$
The second-order derivative can be approximated by
$$u''(x)=\frac{1}{(\Delta x)^2} \left(u_{i-1} -  2u_{i} + u_{i+1}\right)$$

Thus, the heat equation differential equation can be approximated by,
$$\frac{1}{\Delta t} \left(u_{i,j,n+1} -  u_{i,j,n}\right) =\frac{\kappa}{(\Delta x)^2} \left(u_{i-1,j,n} -  2u_{i,j,n} + u_{i+1,j,n}\right) +\frac{\kappa}{(\Delta y)^2} \left(u_{i,j-1,n} -  2u_{i,j,n} + u_{i,j+1,n}\right)$$

By using the alternating-direction method, I have rewritten the future state of each cell as a function of present state of itself and nearest neighbors only. Incidentally, the Courant-Fiedrichs-Lewy condition for validity of linear approximation is,
$$\kappa \left(\frac{1}{(\Delta x)^2}+\frac{1}{(\Delta y)^2}\right) \Delta t \leq \frac{1}{2}$$
Therefore if I divide the detector cross-section into $1$ cm square lattice cells, the largest time increment I can use to calculate the evolution is $125$ s.

## Project Description
This project simulates the temperature behavior of a bubble detector, as the sensitivity of the detector to neutron-induced nuclear recoils depends strongly on temperature. The device is a tall flask of square cross section ($9 \times 9$ cm$^2$) immersed in a temperature-controlled water bath, which could be approximated as a 2D heat diffusion problem, i.e. 
$$\frac{\partial T}{\partial t} = D \nabla^2 T = D \left(\frac{\partial^2 T}{\partial x^2} + \frac{\partial^2 T}{\partial y^2} \right)$$
where $D$ the thermal diffusion coefficient is $0.002$ cm$^2$/s.

The system is subject to initial conditions of $T(x,y,0) = 0$.

The boundary conditions for the detector is,
$$T(0,y,t) = T(9,y,t) = T(x,0,t) = T(x,9,t) = T_{bath}(t)$$

The temperature of the bubble detector needs to be scanned as fast as possible. Physically, if the ramping is too slow, the detector will degrade during the experiment (e.g. causing false events bubble nucleations). But if the ramping is too fast, the system will induce a large gradient of temperature between the inner and outer regions of the detector, which is undesirable. I will answer how fast we can scan the temperature range between $0$ and $15$ C, while keeping the temperature gradient within the detector smaller than 1°? 

## Results






