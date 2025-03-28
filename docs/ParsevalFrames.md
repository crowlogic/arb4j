---
author:
- |
  $S \tau \Sigma v \varepsilon$\
  December 7, 2024
title: Parseval Frames
---

Parseval frames are a specialized type of frame in Hilbert spaces that
extend the concept of orthonormal bases. They maintain the preservation
of vector norms while introducing redundancy into the system. This
redundancy allows for greater flexibility in representation and
analysis, distinguishing Parseval frames as a valuable mathematical tool
in the study of Hilbert spaces.

# Definition of Parseval Frames

A Parseval frame is a specific type of frame in linear algebra and
functional analysis that generalizes the concept of orthonormal bases
while maintaining certain desirable properties. Formally, a sequence of
vectors $\{f_j \}$ in a Hilbert space $H$ is called a Parseval frame if
it satisfies the following condition for all vectors $x$ in $H$:
$$\sum_j | \langle x, f_j \rangle |^2 = \|x\|^2$$ This equation, known
as the frame condition, is a generalization of Parseval's identity for
orthonormal bases. It ensures that the norm of any vector $x$ is
preserved when expressed in terms of its inner products with the frame
elements.

Parseval frames can be characterized by their frame operator $S$,
defined as: $$Sx = \sum_j \langle x, f_j \rangle f_j$$ For a Parseval
frame, the frame operator is equal to the identity operator, i.e.,
$S = I$. This property distinguishes Parseval frames from general frames
and tight frames.

An equivalent definition of a Parseval frame can be given in terms of
the analysis operator $T$ and its adjoint $T^{\ast}$: $$T^{\ast} T = I$$
where $T$ is the operator that maps a vector $x$ to its sequence of
frame coefficients $\{\langle x, f_j \rangle\}$.

In finite-dimensional spaces, Parseval frames have an additional
characterization: a set of vectors $\{f_j \}$ forms a Parseval frame if
and only if the matrix $F$ whose columns are the frame vectors satisfies
$FF^{\ast} = I$, where $F^{\ast}$ is the conjugate transpose of $F$.

# Key Properties of Parseval Frames

1.  Norm Equivalence: One of the fundamental properties of Parseval
    frames is their ability to maintain norm equivalence between a
    vector in the Hilbert space and its sequence of coefficients.

2.  Redundancy: Unlike orthonormal bases, Parseval frames can have more
    vectors than the dimension of the space they span.

3.  Tight Frame Property: Parseval frames are a special case of tight
    frames, where the frame bounds $A$ and $B$ are equal to $1$.

4.  Reconstruction Formula: For any vector $x$ in the Hilbert space, a
    Parseval frame $\{f_j \}$ satisfies the reconstruction formula:
    $$x = \sum_j \langle x, f_j \rangle f_j$$

5.  Parseval's Identity: Parseval frames satisfy a generalized version
    of Parseval's identity:
    $$\|x\|^2 = \sum_j | \langle x, f_j \rangle |^2$$

6.  Duality: Every Parseval frame is self-dual, meaning that the frame
    itself serves as its own dual frame.

7.  Invariance Under Unitary Transformations: If $\{f_j \}$ is a
    Parseval frame and $U$ is a unitary operator, then $\{Uf_j \}$ is
    also a Parseval frame.

8.  Finite-Dimensional Characterization: In finite-dimensional Hilbert
    spaces, a set of vectors forms a Parseval frame if and only if the
    matrix whose columns are the frame vectors has orthonormal rows.

# Construction via Orthogonal Projection

Let $H$ be infinite-dimensional Hilbert space\
Let $W \subseteq H$ be finite-dimensional subspace\
Let $\{e_1, e_2, ..., e_n \}$ be orthonormal basis for $W$\
Let $\{f_k \}_{k = 1}^{\infty}$ be orthonormal basis for $H$

Orthogonal projection $P_W$ onto $W$:\
$P_W x = \sum \langle x, e_i \rangle e_i$

Construction of Parseval frame:
$$\tilde{f}_k = \frac{P_W f_k}{\sqrt{\sum | \langle f_k, e_i \rangle |^2}}$$
Verification:

1.  For any $x \in W$:
    $$\langle x, \tilde{f}_k \rangle = \frac{\langle x, P_W f_k
        \rangle}{\sqrt{\sum | \langle f_k, e_i \rangle |^2}} = \frac{\langle P_W
        x, f_k \rangle}{\sqrt{\sum | \langle f_k, e_i \rangle |^2}} =
        \frac{\langle x, f_k \rangle}{\sqrt{\sum | \langle f_k, e_i \rangle |^2}}$$

2.  Parseval frame condition:
    $$\sum | \langle x, \tilde{f}_k \rangle |^2 = \sum \frac{| \langle x, f_k
        \rangle |^2}{\sum | \langle f_k, e_i \rangle |^2}$$

3.  Interchanging sums:
    $$\sum_i \sum_k \frac{| \langle x, f_k \rangle |^2 | \langle f_k, e_i
        \rangle |^2}{(\sum | \langle f_k, e_j \rangle |^2)^2}$$

4.  Using orthonormal basis property:
    $$\sum | \langle x, e_i \rangle |^2 = \|P_W x\|^2 = \|x\|^2$$
