<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# unitary bijection would imply a measure-preserve (ergodic) flow and an invariant measure would it not? i thought the 0 1 law thing had to do with the fact that if its ergodic then all possible paths of the process either have the property or NONE of them do, its never mixed

A **unitary bijection** (in the context of ergodic theory or operator theory) typically refers to a **unitary operator**, which is a bijective, linear, and inner-product-preserving transformation on a Hilbert space. When such a transformation acts by shifting functions or states in a measure space, it gives rise to a **measure-preserving transformation**. If you have a flow (a family of invertible measure-preserving maps parametrized by time), and the transformation is ergodic, then it means there are no nontrivial invariant measurable sets—any invariant set under the unitary flow has either full or zero measure, which is what you were describing as the "0-1 law"[^1][^2][^3].

Let's clarify the key points:

- **Unitary Bijection and Measure-Preservation:** If you consider the Koopman operator \$ U_T f = f \circ T \$ induced by a measure-preserving invertible transformation \$ T \$ on a probability space, \$ U_T \$ is unitary on \$ L^2 \$ precisely when \$ T \$ and its inverse both preserve the measure[^2]. That means the flow itself is measure-preserving.
- **Invariant Measure:** A measure is called invariant under a transformation or flow if applying the transformation does not change the measure of any measurable set[^1][^4]. For ergodic flows, if a finite invariant measure exists, it is unique up to scaling[^5].
- **Ergodicity and the Zero-One Law:** The ergodic property of a transformation (or flow) states that any measurable set invariant under the transformation has measure zero or one. This is exactly the "zero-one law" you mentioned: for ergodic systems, almost every path either has the property or almost none do—no 'mix'[^3][^6][^7][^8].

In summary:
A unitary bijection in the setting of \$ L^2 \$ or measure-preserving systems does indeed correspond to a measure-preserving (and invertible) transformation, and when ergodic, any invariant measurable set has measure zero or one. This is the essence of the zero-one law in ergodic theory[^3][^6]. The existence of an invariant measure is part of this framework, and ergodicity implies the invariance leads to 'all or nothing' outcomes for invariant sets—as you described.

- **References in support:**
    - Invertible measure-preserving maps induce unitary operators on \$ L^2 \$ spaces[^2].
    - Ergodic measure-preserving systems have the property that invariant sets must have measure zero or one—the "zero-one law"[^3][^6][^7].
    - Flows with invariant measures inherit this property as well[^5][^9][^4].

So yes, your understanding is essentially correct: a unitary bijection (operator) ties in naturally with measure preservation, an invariant measure, and—when ergodic—the classical zero-one law underlies this 'nothing in-between' behavior for invariant events[^3][^6][^8].

<div style="text-align: center">⁂</div>

[^1]: https://math.dartmouth.edu/~m146w22/section2_annotated.pdf

[^2]: https://personalpages.manchester.ac.uk/staff/Charles.Walkden/magic/lecture04.pdf

[^3]: https://ncatlab.org/nlab/show/zero-one+law

[^4]: https://en.wikipedia.org/wiki/Invariant_measure

[^5]: https://www.ams.org/journals/proc/1992-114-01/S0002-9939-1992-1059639-0/S0002-9939-1992-1059639-0.pdf

[^6]: https://www.ism.ac.jp/editsec/aism/pdf/10463_2009_Article_262.pdf

[^7]: https://www.aub.edu.lb/fas/math/Documents/zero-one-laws-report.pdf

[^8]: https://math.stackexchange.com/questions/2798217/ergodicity-and-kolmogorov-0-1-law

[^9]: https://arxiv.org/pdf/1706.00044.pdf

[^10]: https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf

[^11]: https://petersen.web.unc.edu/wp-content/uploads/sites/17054/2018/04/lecturespdf.pdf

[^12]: https://en.wikipedia.org/wiki/Ergodic_theory

[^13]: https://www.stat.berkeley.edu/~pitman/s205s03/lecture10.pdf

[^14]: https://sgp.fas.org/othergov/doe/lanl/pubs/00418728.pdf

[^15]: https://en.wikipedia.org/wiki/Ergodic_flow

[^16]: https://people.math.harvard.edu/~ctm/papers/home/text/class/notes/ergodic/course.pdf

[^17]: https://www.math.u-bordeaux.fr/~jquint/publications/courschine.pdf

[^18]: https://www.sciencedirect.com/science/article/pii/0022123680900725

[^19]: https://ems.press/content/serial-article-files/31527

[^20]: https://math.berkeley.edu/~fengt/ergodic_theory.pdf

