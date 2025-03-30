\documentclass{article}
\usepackage{amsmath}
\usepackage{braket}

\begin{document}

In a non-perturbative approach, we aim to solve the time-dependent Schrödinger equation exactly, without relying on perturbative approximations. The overlap integral plays a crucial role in this context as well.

Consider the time-dependent Schrödinger equation:

$$
i\hbar \frac{\partial}{\partial t}|\psi(t)\rangle = \hat{H}|\psi(t)\rangle
$$

where $\hat{H}$ is the Hamiltonian operator. If $\hat{H}$ is time-independent, we can formally solve this equation as:

$$
|\psi(t)\rangle = e^{-i\hat{H}t/\hbar}|\psi(0)\rangle  
$$

Here, $|\psi(0)\rangle$ is the initial state at time $t=0$. The exponential operator $e^{-i\hat{H}t/\hbar}$ is the time-evolution operator, which governs the unitary evolution of the quantum state.

To calculate the probability amplitude of finding the system in an energy eigenstate $|\lambda\rangle$ at time $t$, we compute the overlap integral:

$$
\langle \lambda | \psi(t) \rangle = \langle \lambda | e^{-i\hat{H}t/\hbar} | \psi(0) \rangle
$$

Using the spectral decomposition of the Hamiltonian, $\hat{H} = \sum_\lambda \lambda |\lambda\rangle\langle\lambda|$, we can express this as:

$$
\langle \lambda | \psi(t) \rangle = e^{-i\lambda t/\hbar} \langle \lambda | \psi(0) \rangle  
$$

The probability of measuring the system in the eigenstate $|\lambda\rangle$ at time $t$ is then given by:

$$
P(\lambda, t) = |\langle \lambda | \psi(t) \rangle|^2 = |\langle \lambda | \psi(0) \rangle|^2
$$

This result shows that the probability is time-independent, a consequence of the stationary nature of energy eigenstates.

To obtain the average value of an observable $\hat{A}$ at time $t$, we use the expectation value:

$$
\langle \hat{A} \rangle_t = \langle \psi(t) | \hat{A} | \psi(t) \rangle = \sum_\lambda \langle \psi(t) | \lambda \rangle \langle \lambda | \hat{A} | \psi(t) \rangle  
$$

By evaluating these overlap integrals and summing over the energy eigenstates, we can compute the time-dependent expectation values of observables without resorting to perturbation theory.

This non-perturbative approach provides exact solutions, but it relies on our ability to diagonalize the Hamiltonian and find its eigenstates and eigenvalues. In practice, this can be challenging for complex systems, which is where perturbative methods and numerical techniques become valuable.

\end{document}
