<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# no speculation only elaboration\

This document elaborates on the 1958 paper "Envelopes and Pre-Envelopes of Real Waveforms" by J. Dugundji[^1]. The paper introduces a new formulation for the envelope of a real waveform that is simpler and more analytically tractable than the preceding definition by S. O. Rice[^1].

### Critique of Rice's Envelope Formulation

The paper begins by outlining Rice's method for determining the envelope of a multichromatic waveform $u(t)$[^1]. This method requires expressing the waveform as a sum of cosines:
\$ u(t) = \sum_n c_n \cos(\omega_n t + \varphi_n) \$
A "midband frequency" $q$ is selected, allowing the waveform to be rewritten in terms of in-phase and quadrature components, $I_c$ and $I_s$[^1]:
\$ u(t) = I_c \cos qt - I_s \sin qt \$
where
\$ I_c = \sum_n c_n \cos[(\omega_n - q)t + \varphi_n] \$
\$ I_s = \sum_n c_n \sin[(\omega_n - q)t + \varphi_n] \$
Rice defines the envelope as $R(t) = [I_c^2 + I_s^2]^{1/2}$[^1]. Dugundji identifies several issues with this approach: it necessitates a specific series expansion for $u(t)$, involves the arbitrary selection of a midband frequency $q$, and the explicit calculation of $R(t)$ is often prohibitively complex[^1].

### The Pre-Envelope and a New Definition of Envelope

To address these difficulties, the paper introduces the concept of the pre-envelope, which is based on the Hilbert transform[^1].

#### The Hilbert Transform

For a given real-valued function $u(t)$, its Hilbert transform, $\hat{u}(t)$, is defined by the principal value of the integral[^1]:
\$ \hat{u}(t) = \frac{1}{\pi} \int_{-\infty}^{\infty} \frac{u(\xi)}{t - \xi} d\xi \$
Key properties of the Hilbert transform used in the paper include:

* The Hilbert transform of $\cos(\omega t + \varphi)$ is $\sin(\omega t + \varphi)$[^1].
* Applying the Hilbert transform twice yields the negative of the original function: $\widehat{\hat{u}} = -u$[^1].
* If $U(f)$ is the Fourier transform of $u(t)$, the Fourier transform of $\hat{u}(t)$, denoted $\hat{U}(f)$, is given by $\hat{U}(f) = -i \cdot \text{sgn}(f) \cdot U(f)$[^1].


#### Pre-Envelope Definition

The **pre-envelope**, $z(t)$, of a real waveform $u(t)$ is defined as the complex-valued function[^1]:
\$ z(t) = u(t) + i\hat{u}(t) \$
The **envelope** of $u(t)$ is then simply the absolute value (or modulus) of its pre-envelope, $|z(t)|$[^1].

### Equivalence with Rice's Envelope

A central theorem of the paper establishes that this new definition of the envelope is identical to Rice's wherever Rice's definition is applicable[^1]. The proof demonstrates that if one forms the pre-envelope $z(t)$ for a signal $u(t)$ expressed in Rice's form, the result is[^1]:
\$ z(t) = [I_c + iI_s]e^{iqt} \$
Taking the absolute value of both sides directly shows that[^1]:
\$ |z(t)| = \sqrt{I_c^2 + I_s^2} = R(t) \$
This equivalence leads to an important corollary: Rice's envelope $R(t)$ is completely independent of the choice of the "midband frequency" $q$, a fact not immediately obvious from Rice's original formulation[^1].

### Properties of Pre-Envelopes

The pre-envelope possesses several useful analytical properties, particularly in the frequency domain and concerning correlation[^1].

#### Frequency Domain Characterization

The Fourier transform of a pre-envelope, $Z(f)$, has a distinct structure[^1]. It is zero for all negative frequencies:
\$ Z(f) = $$
\begin{cases} 2U(f) & f > 0 \\ U(f) & f = 0 \\ 0 & f < 0 \end{cases}
$$ \$
where $U(f)$ is the Fourier transform of the original real signal $u(t)$[^1]. Conversely, any complex function whose Fourier transform is zero for negative frequencies is the pre-envelope of its real part[^1]. This property provides a direct mathematical justification for the common engineering practice of analyzing signals by discarding negative frequencies and doubling the positive frequency spectrum[^1].

#### Correlation and Power Spectra

The paper analyzes the statistical relationship between a signal and its Hilbert transform[^1].

* A signal $u(t)$ and its Hilbert transform $\hat{u}(t)$ have identical autocorrelation functions and, therefore, identical power spectra[^1].
* The cross-correlation of $u(t)$ and $\hat{u}(t)$, denoted $R_{u\hat{u}}(t)$, is the Hilbert transform of the autocorrelation of $u(t)$, $\widehat{R_u}(t)$[^1].
* A direct consequence is that $u(t)$ and $\hat{u}(t)$ are uncorrelated at the same time instant, i.e., $R_{u\hat{u}}(0)=0$[^1].
* The autocorrelation of the pre-envelope itself, $R_z(t)$, is twice the pre-envelope of the autocorrelation of $u(t)$[^1]:
\$ R_z(t) = 2[R_u(t) + i\widehat{R_u}(t)] \$


### Applications of the Pre-Envelope

The paper concludes by demonstrating the utility of the pre-envelope concept in several areas of signal processing[^1].

#### Linear Filters

The pre-envelope simplifies the analysis of signals passing through linear systems[^1]. If a real signal $u(t)$ is the input to a linear filter with a real impulse response, the pre-envelope of the output signal is obtained by simply passing the pre-envelope of the input signal, $z(t)$, through the same filter[^1]. This means that to find the envelope of the output, one can work entirely with the complex pre-envelopes, which is often simpler[^1].

#### Probability Density of a Filtered Signal plus Noise

The pre-envelope is used to derive the first probability density function for the envelope of a filter's output when the input consists of an arbitrary signal plus Gaussian noise[^1]. The final probability density for the output envelope, $R$, is given by[^1]:
\$ p(R) = \frac{R}{\sigma^2} \exp\left[-\frac{R^2 + |z(t)|^2}{2\sigma^2}\right] I_0\left(\frac{R|z(t)|}{\sigma^2}\right) \$
In this expression, $|z(t)|$ is the envelope of the output that would result from the signal alone, $\sigma^2$ is the variance of the output noise, and $I_0$ is the modified Bessel function of the first kind of order zero[^1].

#### Generalized Frequency Modulation

The paper proposes a generalized definition of frequency modulation (FM) that applies to arbitrary waveforms[^1]. For a carrier waveform $u(t)$ and a modulating waveform $m(t)$, the frequency-modulated signal $\mu(t)$ is defined as[^1]:
\$ \mu(t) = u(t)\cos m(t) - \hat{u}(t)\sin m(t) \$
This can be expressed more compactly using the pre-envelope $z(t)$ of $u(t)$ as[^1]:
\$ \mu(t) = \Re\{z(t)e^{im(t)}\} \$
This definition is a generalization because it reduces to the conventional definition of FM when $u(t)$ is a simple sinusoid, but it can be applied to any arbitrary real waveforms for both the carrier and the modulation[^1]. The physical reasoning is that any signal can be written in terms of its envelope and instantaneous phase, and this definition corresponds to directly modulating this instantaneous phase[^1].

<div style="text-align: center">⁂</div>

[^1]: paste.txt

