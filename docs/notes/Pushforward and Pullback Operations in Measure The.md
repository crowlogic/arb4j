<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Pushforward and Pullback Operations in Measure Theory

The operations of pushforward and pullback are fundamental constructs in measure theory, facilitating the transformation of measures between measurable spaces through measurable functions. These operations are intrinsically tied to the structure of sigma-algebras and the preservation of measurability, forming the bedrock for more advanced analytical endeavors. This exposition delineates their definitions, theoretical underpinnings, and interrelationships, adhering strictly to their measure-theoretic formulations.

## Pushforward Measures

### Definition and Construction

Let $(X, \mathcal{A})$ and $(Y, \mathcal{B})$ be measurable spaces, and let $f: X \to Y$ be a measurable function. Given a measure $\mu$ on $(X, \mathcal{A})$, the **pushforward measure** $f_*\mu$ on $(Y, \mathcal{B})$ is defined by:

$$
(f_*\mu)(B) = \mu(f^{-1}(B)) \quad \text{for all } B \in \mathcal{B}.
$$

This operation transfers the measure $\mu$ from $X$ to $Y$ by pre-composing $\mu$ with the inverse image map $f^{-1}$. The measurability of $f$ ensures that $f^{-1}(B) \in \mathcal{A}$ for every $B \in \mathcal{B}$, thereby guaranteeing that $f_*\mu$ is well-defined[^6][^11][^14].

### Functorial Properties

The pushforward operation exhibits natural functoriality: for measurable functions $f: X \to Y$ and $g: Y \to Z$, the composition satisfies:

$$
(g \circ f)_*\mu = g_*(f_*\mu).
$$

This property underscores the categorical coherence of pushforwards, aligning with the compositional structure of measurable functions[^18][^19].

### Inherited Measure Properties

Critical properties of $\mu$-such as finiteness, $\sigma$-finiteness, or being a probability measure-are preserved under pushforward if $f$ is surjective or otherwise compatible with the support of $\mu$. For instance, if $\mu$ is a probability measure, $f_*\mu$ inherits this normalization[^1][^6][^9].

## Pullback Measures

### Conceptual Challenges

In contrast to the universally defined pushforward, the **pullback** of a measure lacks a canonical construction in general measure theory. Given a measurable function $f: X \to Y$ and a measure $\nu$ on $Y$, there is no intrinsic mechanism to "pull back" $\nu$ to a measure on $X$ without additional structural assumptions. This asymmetry arises because the forward image $f(A)$ of a measurable set $A \subseteq X$ need not be measurable in $Y$, complicating the direct transposition of measures from the codomain to the domain[^5][^16].

### Existence Under Invertibility

When $f$ is a **measurable isomorphism**-i.e., a bijection with measurable inverse $f^{-1}: Y \to X$-the pullback $f^*\nu$ of $\nu$ can be defined as:

$$
f^*\nu = f^{-1}_*\nu,
$$

effectively reducing the pullback to the pushforward via the inverse map. This construction hinges critically on the invertibility and mutual measurability of $f$, ensuring that $f^{-1}(A)$ is measurable for every $A \in \mathcal{A}$[^5][^11].

### Disintegration and Conditional Measures

In broader settings, partial analogs of pullbacks may be realized through **disintegration theorems**, which decompose measures relative to a measurable partition or fibration. However, such decompositions require stringent conditions on $f$ (e.g., being a measurable surjection with Polish fibers) and often involve auxiliary structures like conditional probability kernels. These methods transcend pure pullback operations, instead relying on projective limits or fiber-wise integrations[^3][^9][^11].

## Comparative Analysis

### Structural Duality

Pushforward and pullback operations exhibit a dual relationship contingent on the invertibility of the underlying function. For an isomorphism $f$, the equivalence $f_*\mu = \nu \iff \mu = f^*\nu$ holds, mirroring categorical adjunctions. Absent invertibility, this duality dissolves: pushforwards remain universally applicable, while pullbacks become ill-posed without supplementary data[^5][^14][^16].

### Topological and Smooth Contexts

In specialized frameworks-such as smooth manifolds equipped with Borel measures-pullbacks gain traction when paired with differentiable maps. For a diffeomorphism $f: M \to N$, the pullback $f^*\nu$ of a measure $\nu$ on $N$ is defined via the Jacobian determinant, integrating geometric data absent in pure measure theory. These extensions, however, exceed the scope of abstract measure spaces, necessitating differentiable or topological structure[^11][^14][^19].

## Conclusion

The pushforward operation is a cornerstone of measure theory, characterized by its generality and functorial coherence. In contrast, the pullback of measures is inherently restrictive, viable only under stringent invertibility conditions or within enriched geometric contexts. This dichotomy underscores the foundational asymmetry between forward and inverse transformations of measures, reflecting deeper categorical and structural principles governing measurable spaces.

<div style="text-align: center">⁂</div>

[^1]: https://arxiv.org/abs/2103.02364

[^2]: https://pubmed.ncbi.nlm.nih.gov/36282875/

[^3]: https://arxiv.org/abs/2302.13965

[^4]: https://www.semanticscholar.org/paper/fbe22e3c932bf08498eb0306e997eb79e44a0eb4

[^5]: https://arxiv.org/pdf/2007.13347.pdf

[^6]: https://arxiv.org/abs/1112.4765

[^7]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9582555/

[^8]: https://arxiv.org/pdf/1606.00095.pdf

[^9]: http://arxiv.org/pdf/2405.06466.pdf

[^10]: https://www.semanticscholar.org/paper/2b7afb328da6bdcac676d03eb9573f8e5c497cbe

[^11]: http://arxiv.org/pdf/2202.12446.pdf

[^12]: https://www.semanticscholar.org/paper/ea339febc19c97dc78a57e0003f1b2d79f33cfa7

[^13]: https://www.semanticscholar.org/paper/1907aa94118d05f353a2075637120445c148d0df

[^14]: https://arxiv.org/abs/2401.01088

[^15]: https://www.semanticscholar.org/paper/19955c2b504f1e33a556a6e27f24081d59778414

[^16]: https://arxiv.org/pdf/2403.07471.pdf

[^17]: http://arxiv.org/pdf/2306.06637.pdf

[^18]: http://arxiv.org/pdf/1804.05268.pdf

[^19]: https://arxiv.org/pdf/2012.05793.pdf

[^20]: https://www.semanticscholar.org/paper/eeb8ae466050b369ce5ef5b4d6dce8199099f228

[^21]: https://www.semanticscholar.org/paper/be64092e47da824e7d38212016e8a722a9415baa

[^22]: https://arxiv.org/abs/2303.07905

[^23]: https://pubmed.ncbi.nlm.nih.gov/38656839/

[^24]: https://www.semanticscholar.org/paper/0122a1c804c18f984fba36dca0ad04b638f61d70

[^25]: https://www.semanticscholar.org/paper/aceff6611e5645c8971c57035be5031db8e95d5e

[^26]: https://arxiv.org/abs/2412.18532

[^27]: https://arxiv.org/abs/2302.04953

[^28]: http://arxiv.org/pdf/2008.09969.pdf

[^29]: https://arxiv.org/pdf/1908.03949.pdf

[^30]: https://pubmed.ncbi.nlm.nih.gov/31829640/

[^31]: https://www.semanticscholar.org/paper/37e1818cfeee933c795aac1979c3f634f01194a0

[^32]: http://arxiv.org/pdf/2202.12446.pdf

[^33]: https://www.semanticscholar.org/paper/2fea7ae27a7e572b49b0f2f8f8fe9b3698255907

[^34]: https://www.semanticscholar.org/paper/9548fa14f144b1414e5fbc2aa4d0bbd06a035856

[^35]: https://pubmed.ncbi.nlm.nih.gov/34003750/

[^36]: https://arxiv.org/abs/2402.09297

[^37]: https://www.semanticscholar.org/paper/f7fd61b1a4e6e2cad36d8e15f7383da1ae5a952b

[^38]: https://www.semanticscholar.org/paper/12d5d1d9d57beb14921ca40faaf3846cf8d89311

[^39]: https://www.semanticscholar.org/paper/0fc9f9bfb6b6cabcbc77aaedc6fc7ce80484b5cf

[^40]: https://arxiv.org/abs/2303.07713

[^41]: https://arxiv.org/pdf/1801.03008.pdf

[^42]: https://arxiv.org/html/2402.12072

[^43]: https://arxiv.org/pdf/1901.03707.pdf

[^44]: http://arxiv.org/pdf/2107.05727.pdf

[^45]: https://www.semanticscholar.org/paper/077af5650e3ff73e55c5b8f8569cfc09b2cb5485

[^46]: https://pubmed.ncbi.nlm.nih.gov/33749051/

[^47]: https://www.semanticscholar.org/paper/56bf3c2223d01ca19aa69e62fba08c5f065422ce

[^48]: https://arxiv.org/abs/2401.01088

[^49]: https://arxiv.org/abs/2412.09672

[^50]: https://www.semanticscholar.org/paper/1e5874adf830fa3db82630b9b9d6bff388fa7c34

[^51]: https://www.semanticscholar.org/paper/78a15535dc2d82f2522c3eb20caa65baad1bda44

[^52]: https://www.semanticscholar.org/paper/e67d17efc6c94fd147565c631268a179e7e82b35

[^53]: https://arxiv.org/abs/1112.4765

[^54]: http://arxiv.org/pdf/1111.2092.pdf

[^55]: http://arxiv.org/pdf/1903.10670.pdf

[^56]: https://arxiv.org/pdf/2310.02235.pdf

[^57]: https://pubmed.ncbi.nlm.nih.gov/26818318/

[^58]: https://www.semanticscholar.org/paper/0ce3e765b7f00153984cfafcdd4c7f327fe7e05b

[^59]: https://www.semanticscholar.org/paper/080e33f7721936b62cfee044a261009233744636

[^60]: https://pubmed.ncbi.nlm.nih.gov/37682675/

[^61]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11016549/

[^62]: https://arxiv.org/abs/2406.09978

[^63]: https://www.semanticscholar.org/paper/6066de0379a4d2818c4da0875ba31b754567fe12

[^64]: https://arxiv.org/abs/2401.14552

[^65]: https://www.semanticscholar.org/paper/bba814f382074683fe7ac2047e443eb6f72d7693

[^66]: https://arxiv.org/pdf/1911.01206.pdf

[^67]: https://arxiv.org/abs/1703.03938

[^68]: https://arxiv.org/pdf/2102.01712.pdf

[^69]: https://arxiv.org/pdf/2203.12251.pdf

[^70]: https://arxiv.org/abs/1107.1495

[^71]: https://arxiv.org/pdf/2110.03219.pdf

[^72]: https://www.semanticscholar.org/paper/ba25c6d4b254ff731c129404d4df33d975ca5523

[^73]: https://arxiv.org/abs/1606.00095

[^74]: https://arxiv.org/abs/1711.04625

[^75]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8602159/

[^76]: https://www.semanticscholar.org/paper/5a66de145c2327ed2529c2e0d1ae4d925a224e52

[^77]: https://arxiv.org/abs/1812.03375

[^78]: https://arxiv.org/abs/2307.08956

