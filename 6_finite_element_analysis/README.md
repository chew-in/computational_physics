# Finite Element Analysis 
This project will attempt to numerically solve the heat diffusion equation in 2D from scratch before using a commercially available FEA software such as COMSOL. 

## Background
Finite Element Analysis (FEA) uses numerical methods to solve a system of equations that represents the physical behavior of the structure, by solving for the unknowns (displacements, temperatures, etc.) at each node of the mesh. FEA can be applied to solve processes described by a system of differential equations, such as heat transfer.

## Math
 Our goal is to solve the 2D heat equation,
$$\frac{\partial T}{\partial t} = D \nabla^2 T = D \left(\frac{\partial^2 T}{\partial x^2} + \frac{\partial^2 T}{\partial y^2} \right)$$
With boundary conditions $T(0,y,t) = T(9,y,t) = T(x,0,t) = T(x,9,t) = T_{bath}(t)$.

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





