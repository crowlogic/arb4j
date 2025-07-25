<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# ok then mayne i specified the filter incorrectly, because A_t(lambda) should equal exp(i*lambda*(theta(t)-t)) so that phi_t(lambda)=exp(I*lambda*theta(t)) . Determine the h_t(u) corresponding to that

Great clarification!
You want the family of functions

$$
\phi_t(\lambda) = e^{i\lambda \theta(t)}
$$

and you want to express this as

$$
A_t(\lambda) = e^{i\lambda (\theta(t) - t)}
$$

in the form

$$
X_t = \int A_t(\lambda) e^{i\lambda t} dZ(\lambda)
$$

and to identify the time-varying filter \$ h_t(u) \$ corresponding to this \$ A_t(\lambda) \$.

## Step 1: Express \$ A_t(\lambda) \$ in Terms of \$ h_t(u) \$

Recall from Priestley:

$$
A_t(\lambda) = \int e^{i\lambda u} h_t(u) du
$$

with the inverse (for nice enough \$ h_t \$):

$$
h_t(u) = \frac{1}{2\pi} \int e^{-i\lambda u} A_t(\lambda)\, d\lambda
$$

Given

$$
A_t(\lambda) = e^{i\lambda(\theta(t)-t)}
$$

so

$$
h_t(u) = \frac{1}{2\pi} \int e^{-i\lambda u} e^{i\lambda (\theta(t)-t)} d\lambda
= \frac{1}{2\pi} \int e^{-i\lambda [u - (\theta(t) - t)]} d\lambda
$$

## Step 2: Evaluate the Integral

$$
h_t(u) = \frac{1}{2\pi} \int e^{-i\lambda [u - (\theta(t)-t)]}\, d\lambda
$$

But

$$
\frac{1}{2\pi}\int e^{-i\lambda a} d\lambda = \delta(a)
$$

Therefore,

$$
h_t(u) = \delta\big(u - [\theta(t) - t]\big)
$$

## Step 3: Write Final Answer

$$
\boxed{
h_t(u) = \delta\Big(u - [\theta(t) - t]\Big)
}
$$

**In words:**

- The filter at time \$ t \$ is a pure delay of \$ \theta(t) - t \$.
- The corresponding family is \$ \phi_t(\lambda) = e^{i \lambda \theta(t)} \$.

**Check:**
Plugging back into the formula:

$$
A_t(\lambda) = \int e^{i\lambda u}\, \delta(u - [\theta(t)-t])\, du = e^{i\lambda(\theta(t) - t)}
$$

which matches your requirement.

**Summary Table**


| Quantity | Formula |
| :-- | :-- |
| \$ \phi_t(\lambda) \$ | \$ e^{i\lambda \theta(t)} \$ |
| \$ A_t(\lambda) \$ | \$ e^{i\lambda (\theta(t)-t)} \$ |
| Corresponding filter \$ h_t(u) \$ | \$ \delta(u - [\theta(t)-t]) \$ |

If you want to know what sort of process \$ X_t \$ results when a stationary process is filtered through this \$ h_t(u) \$, let me know!

