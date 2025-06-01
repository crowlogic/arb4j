<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# How does this relate to radon-nikodym derivatives?

The relationship between joint and conditional densities is fundamentally grounded in the theory of Radon-Nikodym derivatives, which provide the measure-theoretic foundation for all density functions in probability theory.

## **Densities as Radon-Nikodym Derivatives**

Joint and marginal density functions are Radon-Nikodym derivatives of probability measures with respect to appropriate reference measures[^2][^4]. Specifically:

- The joint density $f_{X,Y}(x,y)$ is the Radon-Nikodym derivative $\frac{d\mathbb{P}_{(X,Y)}}{d(\lambda \times \lambda)}(x,y)$, where $\mathbb{P}_{(X,Y)}$ is the joint probability measure and $\lambda \times \lambda$ is the product Lebesgue measure on $\mathbb{R}^2$
- The marginal density $f_X(x)$ is the Radon-Nikodym derivative $\frac{d\mathbb{P}_X}{d\lambda}(x)$ of the marginal probability measure with respect to Lebesgue measure


## **Conditional Densities and Disintegration**

The conditional density $f_{Y|X}(y|x)$ represents the Radon-Nikodym derivative of the conditional probability measure $\mathbb{P}_{Y|X=x}$ with respect to Lebesgue measure on the $y$-space[^5]. The fundamental relationship:

$f_{X,Y}(x,y) = f_{Y|X}(y|x) \cdot f_X(x)$

expresses the **disintegration** of the joint measure into conditional measures[^2][^5].

## **Measure-Theoretic Interpretation**

This relationship can be written in terms of Radon-Nikodym derivatives as:

$\frac{d\mathbb{P}_{(X,Y)}}{d(\lambda \times \lambda)}(x,y) = \frac{d\mathbb{P}_{Y|X=x}}{d\lambda}(y) \cdot \frac{d\mathbb{P}_X}{d\lambda}(x)$

The existence of these densities depends on the absolute continuity of the respective probability measures with respect to their reference measures, which is guaranteed by the Radon-Nikodym theorem when the measures are σ-finite[^2][^4].

## **Chain Rule Property**

The multiplicative relationship mirrors the chain rule property of Radon-Nikodym derivatives mentioned in the search results[^6]. Just as Radon-Nikodym derivatives satisfy composition rules, the joint-conditional density relationship reflects how probability measures can be factored through conditional measures.

## **Independence from Joint Distribution**

The search results note that Radon-Nikodym derivatives between marginal measures are independent of their joint distribution[^1]. This means that $\frac{d\mathbb{P}_Y}{d\mathbb{P}_X}$, when it exists, depends only on the marginal distributions of $X$ and $Y$, not on their dependence structure. However, the conditional densities $f_{Y|X}(y|x)$ do capture this dependence structure and are essential for reconstructing the joint density through the disintegration formula.

<div style="text-align: center">⁂</div>

[^1]: https://math.stackexchange.com/questions/3706220/does-joint-distribution-affect-radon-nikodym-derivative

[^2]: https://en.wikipedia.org/wiki/Radon_Nikodym

[^3]: https://www.numberanalytics.com/blog/radon-nikodym-derivative-ultimate-guide

[^4]: https://en.wikipedia.org/wiki/Radon–Nikodym_theorem

[^5]: http://www.stat.yale.edu/~pollard/Manuscripts+Notes/Beijing2010/UGMTP_chap3%5Bpart%5D.pdf

[^6]: https://www.youtube.com/watch?v=sPcXyZB1bkM

[^7]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Decomposition/RadonNikodym.html

[^8]: https://math.stackexchange.com/questions/4643649/writing-radon-nikodym-derivative-of-joint-distributions-in-terms-of-marginals-an

[^9]: https://math.stackexchange.com/questions/4008787/probability-density-function-and-radon-nikodym-derivative

[^10]: https://mathoverflow.net/questions/340025/radon-nikodym-derivatives-with-parameters

