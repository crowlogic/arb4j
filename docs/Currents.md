# Definition {#definition .unnumbered}

A $T$ of degree $k$ on a manifold $M$ is a continuous linear functional
on the space of compactly supported smooth differential forms of
complementary degree $n - k$ (where $n$ is the dimension of the
manifold). This is expressed as: $$T (\omega)$$ for a compactly
supported smooth $(n - k)$-form $\omega$ on $M$.

# Properties and Operations {#properties-and-operations .unnumbered}

1.  If $T$ is a $k$-current, its boundary $\partial T$ is a
    $(k - 1)$-current defined by: $$\partial T (\omega) = T (d \omega)$$
    where $d \omega$ is the exterior derivative of $\omega$.

2.  Given a smooth map $f : M \to N$, the pushforward of a current can
    be defined from $M$ to $N$. The pullback, however, is generally not
    well-defined for currents.

3.  A $n$-dimensional current $T$ on $M$ can be integrated over $M$,
    represented by: $$\int_M T$$

# Examples of Currents {#examples-of-currents .unnumbered}

1.  For a point $p$ in $M$, the Dirac delta current $\delta_p$ of degree
    $n$ acts on a $n$-form $\omega$ by:
    $$\delta_p (\omega) = \omega (p)$$

2.  Let $S$ be a $k$-dimensional oriented smooth submanifold of $M$. The
    current $[S]$ associated with $S$ acts on a $(n - k)$-form $\omega$
    as: $$(\omega) = \int_S \omega$$

# Application in Equidistribution {#application-in-equidistribution .unnumbered}

Currents can be used to study the asymptotic distribution of zeros of
holomorphic sections in Hermitian vector bundles, particularly how these
zeros distribute themselves across the manifold, often converging to a
certain limiting current.
