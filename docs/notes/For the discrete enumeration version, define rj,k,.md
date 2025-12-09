<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# For the discrete enumeration version, define rj,k,nr_{j,k,n}rj,k,n exactly as an integer sum with Kronecker deltas and fully explicit indices.

Definition of rj,k,nr_{j,k,n}rj,k,n
Take integers n≥2n \ge 2n≥2, 2≤k≤n2 \le k \le n2≤k≤n, and 0≤j≤n n−1−10 \le j \le n^{\,n-1}-10≤j≤nn−1−1. Define
rj,k,n=∏q=2n(∑aq=0n−1)ak δ ⁣(j, ∑p=2nap n p−2)δ ⁣(n−1, ∑p=2n(p−1) ap),r_{j,k,n} = \prod_{q=2}^{n} \left( \sum_{a_q=0}^{n-1} \right) a_k\, \delta\!\left( j,\, \sum_{p=2}^{n} a_p\,n^{\,p-2} \right) \delta\!\left( n-1,\, \sum_{p=2}^{n} (p-1)\,a_p \right),rj,k,n=q=2∏naq=0∑n−1akδ(j,p=2∑napnp−2)δ(n−1,p=2∑n(p−1)ap),
where:
Each aqa_qaq is an integer summation variable with range 0≤aq≤n−10 \le a_q \le n-10≤aq≤n−1.
δ(x,y)\delta(x,y)δ(x,y) is the Kronecker delta (equal to 111 if x=yx=yx=y, and 000 otherwise).
The term ∑p=2nap n p−2\displaystyle \sum_{p=2}^{n} a_p\,n^{\,p-2}p=2∑napnp−2 encodes the tuple (a2,…,an)(a_2,\dots,a_n)(a2,…,an) as a single integer in base nnn, so for each admissible tuple there is exactly one jjj with δ(j,∑p=2napnp−2)=1\delta\big(j,\sum_{p=2}^{n} a_p n^{p-2}\big)=1δ(j,∑p=2napnp−2)=1.
The second delta δ ⁣(n−1,∑p=2n(p−1)ap)\displaystyle \delta\!\left(n-1,\sum_{p=2}^{n} (p-1)a_p\right)δ(n−1,p=2∑n(p−1)ap) enforces the linear constraint ∑p=2n(p−1)ap=n−1\sum_{p=2}^{n} (p-1)a_p = n-1∑p=2n(p−1)ap=n−1.
This gives a purely discrete, fully explicit formula: rj,k,nr_{j,k,n}rj,k,n is an integer-valued function of (j,k,n)(j,k,n)(j,k,n) expressed only as finite sums over integer indices and products of Kronecker deltas, with no multi-index notation and no undefined summation variables.

The displayed definition already gives a fully explicit discrete formula: $r_{j,k,n}$ is an integer-valued function of $(j,k,n)$ defined as a finite sum over the integer variables $a_2,\dots,a_n$, enforced by Kronecker deltas.  The only ambiguity is the missing explicit summation product notation, which can be written cleanly as follows.[^1][^2]

## Explicit Kronecker–delta definition

For integers $n\ge 2$, $2\le k\le n$, and $0\le j\le n^{\,n-1}-1$, define

$$
r_{j,k,n}
=
\sum_{a_2=0}^{n-1}\sum_{a_3=0}^{n-1}\cdots\sum_{a_n=0}^{n-1}
a_k\,
\delta\!\Bigl(
  j,\;
  \sum_{p=2}^{n} a_p\,n^{\,p-2}
\Bigr)\,
\delta\!\Bigl(
  n-1,\;
  \sum_{p=2}^{n} (p-1)\,a_p
\Bigr).
$$

Here $\delta(x,y)$ is the usual (bivariate) Kronecker delta, equal to $1$ if $x=y$ and $0$ otherwise.[^3][^1]

## Interpretation of the indices

- The map $(a_2,\dots,a_n)\mapsto \sum_{p=2}^{n} a_p\,n^{\,p-2}$ is the base-$n$ encoding of the $(n-1)$-tuple $(a_2,\dots,a_n)$ as a unique integer $j\in\{0,\dots,n^{\,n-1}-1\}$.[^4]
- The second Kronecker delta enforces the linear constraint

$$
\sum_{p=2}^{n} (p-1)\,a_p = n-1,
$$

so only those encoded tuples satisfying this equation contribute.
- For each admissible encoded tuple, $r_{j,k,n}$ equals the value of $a_k$; otherwise it is zero, so the definition is purely discrete, with all indices and constraints made explicit via Kronecker deltas.[^5][^2]
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://en.wikipedia.org/wiki/Kronecker_delta

[^2]: https://functions.wolfram.com/IntegerFunctions/DiscreteDelta/introductions/TensorFunctions/ShowAll.html

[^3]: https://oeis.org/wiki/Kronecker_delta

[^4]: https://stackoverflow.com/questions/55555778/convert-a-list-of-position-value-tuples-into-a-single-list

[^5]: https://ecommons.cornell.edu/bitstreams/0dc42cc2-2a30-42f1-af4f-bde1fa4609d4/download

[^6]: https://functions.wolfram.com/IntegerFunctions/KroneckerDelta2/introductions/TensorFunctions/ShowAll.html

[^7]: https://resources.system-analysis.cadence.com/blog/msa2022-the-properties-of-the-kronecker-delta-function

[^8]: https://cs.uwaterloo.ca/journals/JIS/VOL24/Orozco/orozco5.pdf

[^9]: https://vldb.org/workshops/2024/proceedings/ADMS/ADMS24_02.pdf

[^10]: https://www.reddit.com/r/learnmath/comments/senbw4/need_help_proving_a_certain_sum_is_a_kronecker/

[^11]: https://www.combinatorics.org/ojs/index.php/eljc/article/download/v28i4p24/pdf/

[^12]: https://www.reddit.com/r/math/comments/x15ift/kroneckers_delta/

[^13]: https://arxiv.org/pdf/2406.17613.pdf

[^14]: https://en.wikipedia.org/wiki/Bell_polynomials

[^15]: https://www.youtube.com/watch?v=DLboQfRh6TU

[^16]: http://rosenberglab.stanford.edu/papers/Rosenberg2019-AdvApplMath.pdf

[^17]: https://www.mat.univie.ac.at/~slc/s/s75luque.pdf

[^18]: https://arxiv.org/pdf/1402.4761.pdf

[^19]: https://forum.pyro.ai/t/discrete-enumeration-in-super-simple-toy-model/1814

[^20]: https://www.reed.edu/physics/faculty/wheeler/documents/Miscellaneous Math/Bell Polynomials, Pochhammer Symbols, Etc/Bell Polynomials.pdf

