## Time-Varying Filter Functions

Let g(t,u) be a time-dependent filter then the gain function
corresponding to such a time-varying filter is

$$G_t(\omega) = \int_{-\infty}^{\infty} g(t,u) e^{-i\omega u} du$$

or equivalently:

$$G_t(\omega) = \int_{-\infty}^{\infty} g(t,t-\tau) e^{-i\omega (t-\tau)} d\tau$$
