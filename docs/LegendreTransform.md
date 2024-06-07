# From Lagrangian to Hamiltonian Formulation {#from-lagrangian-to-hamiltonian-formulation .unnumbered}

1.  **Start with the Lagrangian:** $$L = L(q, \dot{q}, t)$$

2.  **Define the Conjugate Momenta:**
    $$p_i = \frac{\partial L}{\partial \dot{q}_i}$$

3.  **Perform the Legendre Transformation:**
    $$H = \sum_i p_i \dot{q}_i - L$$ Here, $\dot{q}_i$ should be
    expressed in terms of $p_i$ and $q_i$, making $H$ a function of $p$,
    $q$, and possibly $t$: $$H = H(q, p, t)$$

4.  **Hamiltonian Formulation:** In the Hamiltonian formulation, the
    equations of motion are derived from Hamilton's equations:
    $$\dot{q}_i = \frac{\partial H}{\partial p_i}, \quad \dot{p}_i = -\frac{\partial H}{\partial q_i}$$

# From Hamiltonian to Lagrangian Formulation {#from-hamiltonian-to-lagrangian-formulation .unnumbered}

1.  **Start with the Hamiltonian:** $$H = H(q, p, t)$$

2.  **Express the velocities:** Use Hamilton's equations to express the
    velocities $\dot{q}_i$ in terms of $p$ and $q$:
    $$\dot{q}_i = \frac{\partial H}{\partial p_i}$$

3.  **Invert to find $\dot{q}$ as functions of $q$ and $p$:** If
    possible, solve the expressions from Hamilton's equations to find
    $\dot{q}_i$ as functions of $q_i$ and $p_i$.

4.  **Perform the inverse Legendre Transformation:** Compute the
    Lagrangian by inverting the Legendre transformation:
    $$L = \sum_i p_i \dot{q}_i - H$$ where $H$ and $\dot{q}_i$ are
    expressed in terms of $p_i$ and $q_i$, recovering the Lagrangian
    description.
