<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# is a bijection neccessarily unitary?

A **bijection** is not necessarily unitary. A bijection is simply a function that is both injective (one-to-one) and surjective (onto), meaning there is a perfect pairing between the domain and codomain[^5][^8]. In contrast, a **unitary transformation** is a special kind of bijection (specifically, a linear bijection between inner product spaces) that also preserves the inner product structure[^2][^6].

So, every unitary transformation is a bijection, but not every bijection is unitary. The property of being unitary is additional: it requires not only that the transformation is bijective and linear, but also that for all vectors \$ x \$ and \$ y \$, the inner product is preserved, i.e., \$ \langle Ux, Uy \rangle = \langle x, y \rangle \$[^2][^6][^4].

For example, a bijective function between sets (even between vector spaces) does not, in general, respect any linear or inner product structure unless it is specifically constructed to do so.

**Key distinctions:**

- **Bijection:** Any invertible function between sets, with no requirements about structure preservation[^5][^8].
- **Unitary transformation:** A bijective, linear map between inner product spaces that also preserves inner products[^2][^6].

In summary, being **unitary** is a much stronger condition than being a **bijection**.

<div style="text-align: center">⁂</div>

[^1]: https://math.stackexchange.com/questions/2885884/what-is-the-difference-between-a-surjective-unitary-operator-and-a-bijective

[^2]: https://en.wikipedia.org/wiki/Unitary_transformation

[^3]: https://en.wikipedia.org/wiki/Antiunitary_operator

[^4]: https://www.reddit.com/r/AskPhysics/comments/18f7v5a/active_and_passive_transformations/

[^5]: https://www.sfu.ca/~mdevos/notes/geom-sym/12_transformations.pdf

[^6]: https://cse.iitkgp.ac.in/~goutam/quantumComputing/lect4part.pdf

[^7]: https://www.damtp.cam.ac.uk/user/dbs26/PQM/chap4.pdf

[^8]: https://www.cl.cam.ac.uk/teaching/2021/DiscMath/DiscMathSlides16.1.pdf

[^9]: https://www.sciencedirect.com/topics/mathematics/unitary-transformation

[^10]: https://physics.stackexchange.com/questions/466660/difference-on-the-invariance-of-operators-and-their-transformations-under-unitar

