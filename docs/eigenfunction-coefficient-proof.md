Proof:

1) We start with the eigenfunction equation:

   $$\int_0^{\infty} R(s,t) \psi_n(s) \, ds = \lambda_n \psi_n(t)$$

2) Multiply both sides by $\phi_k(t)$ and integrate over t:

   $$\int_0^{\infty} \phi_k(t) \int_0^{\infty} R(s,t) \psi_n(s) \, ds \, dt = \lambda_n \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

3) By Fubini's theorem, we can swap the order of integration on the left side:

   $$\int_0^{\infty} \int_0^{\infty} R(s,t) \phi_k(t) \, dt \, \psi_n(s) \, ds = \lambda_n \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

4) Recall the definition of $\psi_n(t)$:

   $$\psi_n(t) = \sum_{j=1}^{\infty} c_{n,j} \phi_j(t)$$

5) Substitute this into the left side of the equation from step 3:

   $$\int_0^{\infty} \int_0^{\infty} R(s,t) \phi_k(t) \, dt \, \sum_{j=1}^{\infty} c_{n,j} \phi_j(s) \, ds = \lambda_n \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

6) Expand the left side:

   $$\sum_{j=1}^{\infty} c_{n,j} \int_0^{\infty} \int_0^{\infty} R(s,t) \phi_k(t) \phi_j(s) \, dt \, ds = \lambda_n \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

7) Recognize the definition of $K_{kj}$ from the original proof:

   $$\sum_{j=1}^{\infty} c_{n,j} K_{kj} = \lambda_n \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

8) The left side is exactly $\lambda_n c_{n,k}$ from the eigenvalue equation $K\mathbf{c}_n = \lambda_n \mathbf{c}_n$:

   $$\lambda_n c_{n,k} = \lambda_n \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

9) Divide both sides by $\lambda_n$:

   $$c_{n,k} = \frac{1}{\lambda_n} \int_0^{\infty} \phi_k(t) \psi_n(t) \, dt$$

This completes the proof.

