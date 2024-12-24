# Solving Initial Value Problems (IVP) Using Euler's Methods

This repository demonstrates solving second-order initial value problems (IVP) using:
1. **Euler's Method (EM)**.
2. **Improved Euler's Method (IEM)**.
3. Comparison with the analytical solution.

The problem involves approximating the solution to a differential equation for different step sizes and visually comparing the results.

## Problem Definition

We are tasked with solving the following second-order initial value problem (IVP):

**Differential Equation:**
 y'' = -19/4y - 10y' 
with initial conditions:
 y(0) = -9,  y'(0) = 0 

**Analytical Solution:**
The analytical solution to this IVP is:
 y(t) = -19/2 e^(-t/2) + 1/2 e^(-19t/2) 


## Features

- Solves the IVP using Euler's and Improved Euler's Methods.
- Compares numerical solutions with the analytical solution.
- Produces plots for different time steps (\(N = 45, 55, 75, 100, 250\)).
- Computes solutions over the interval \( t in [0, 10] \).

---

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/IVP-Euler-Methods.git

2.	Open the IVP_Euler_Methods.m script in MATLAB.
3.	Run the script to:
	•	Generate solutions for EM, IEM, and the analytical method.
	•	Plot the solutions for different (N) values.

## Functions

- EMsolver: Implements Euler’s Method for solving the IVP.

- IEMsolver: Implements Improved Euler’s Method for solving the IVP.

- analytical: Computes the analytical solution of the IVP.

## Visualization

- Blue Line: Numerical solution from Euler’s Method (EM).

- Red Line: Numerical solution from Improved Euler’s Method (IEM).

- Yellow Line: Analytical solution.

## Recommendation

- Based on the comparison of computational efficiency and accuracy:

	•	(N = 100): A reasonable balance for EM.

	•	(N = 55): Recommended for IEM, providing better accuracy with fewer steps.
