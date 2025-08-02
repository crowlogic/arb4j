Below, each major statement or claim is listed in **bold** and followed by a verification (✅ for true, ❌ for false), with a concise justification. The notation $$ M_\theta $$ and definitions $$\theta \in \mathcal{F}$$ are taken as given (strictly increasing, bijective, and $$C^1$$ a.e.).

### **Abstract**

- **Gaussian processes obtained through measure-preserving bijective unitary time transformations of stationary processes constitute a subclass of oscillatory processes in the sense of Priestley.**  
  ✅  
  The paper constructs a process $$ Z(t) = \sqrt{\dot{\theta}(t)} X(\theta(t)) $$ from a stationary Gaussian $$X(t)$$ and shows it is oscillatory with evolving spectrum, matching Priestley’s definition.  
- **The transformation yields an oscillatory process with evolutionary power spectrum $$dF_t(\omega) = \dot{\theta}(t) d\mu(\omega)$$.**  
  ✅  
  This is derived in Corollary \ref{cor:evolving_spec}.
- **An explicit unitary transformation between the input stationary process and the transformed oscillatory process is established, preserving the $$L^2$$-norm and providing a complete spectral characterization.**  
  ✅  
  $$M_\theta$$ is proven unitary in Theorem \ref{thm:unitary}, and the spectral characterization is given in Theorem \ref{thm:osc_rep}.

### **Definition of Scaling Functions (Sec 1)**

- **$$\theta$$ is absolutely continuous, $$\dot{\theta}(t) \geq 0$$ a.e., and $$\dot{\theta}(t) = 0$$ only on sets of Lebesgue measure zero.**  
  ✅  
  This is the definition of $$\mathcal{F}$$.
- **$$\theta$$ is strictly increasing and bijective.**  
  ✅  
  Definition.
- **The inverse $$\theta^{-1}$$ exists and is absolutely continuous, with $$\frac{d}{ds} \theta^{-1}(s) = 1 / \dot{\theta}(\theta^{-1}(s))$$ a.e.**  
  ✅  
  This is a direct application of the inverse function theorem for absolutely continuous functions, valid under these assumptions.

### **Oscillatory Processes (Sec 2)**

- **A complex-valued, second-order process $$\{X(t)\}$$ is called oscillatory if it admits a representation $$Z(t) = \int_{-\infty}^\infty A_t(\omega) e^{i\omega t} d\Phi(\omega)$$ with $$A_t(\cdot) \in L^2(\mu)$$ and $$\Phi(\omega)$$ a complex orthogonal random measure.**  
  ✅  
  This matches Priestley’s original definition.
- **All stationary processes are oscillatory with $$A_t(\omega) = 1$$.**  
  ✅  
  A stationary process has a spectral representation with constant (time-independent) amplitude.

### **Stationary Reference Process (Sec 3)**

- **A stationary Gaussian process admits a spectral representation $$X(t) = \int_{-\infty}^\infty e^{i\omega t} d\Phi(\omega)$$ with $$E|d\Phi(\omega)|^2 = d\mu(\omega) = S(\omega)$$.**  
  ✅  
  Standard spectral representation theorem for stationary processes.

### **Time-Changed Process (Sec 4)**

- **Definition of $$M_\theta f(t) = \sqrt{\dot{\theta}(t)} f(\theta(t))$$ for $$f \in L^2(\mathbb{R})$$.**  
  ✅  
  Well-defined under the stated conditions.
- **The inverse is $$M_\theta^{-1}g(s) = g(\theta^{-1}(s)) / \sqrt{\dot{\theta}(\theta^{-1}(s))}$$.**  
  ✅  
  Correct, by solving for the inverse operation and using properties of $$\theta$$.
- **The inverse is well-defined a.e. because $$\dot{\theta}(t) = 0$$ only on sets of measure zero.**  
  ✅  
  Lemma \ref{lem:inverse_well_defined} and its proof are correct.
- **$$M_\theta$$ is unitary: $$\int |(M_\theta f)(t)|^2 dt = \int |f(s)|^2 ds$$ for all $$f \in L^2(\mathbb{R})$$.**  
  ✅  
  The proof uses the substitution $$s = \theta(t)$$ and the Jacobian is correct.
- **The inverse really is the inverse: $$M_\theta M_\theta^{-1} = M_\theta^{-1} M_\theta = I$$.**  
  ✅  
  The proof of Theorem \ref{thm:unitary} is correct.
- **Measure preservation generalizes to measurable sets: $$\int_A |(M_\theta f)(t)|^2 dt = \int_{\theta(A)} |f(s)|^2 ds$$.**  
  ✅  
  This is a straightforward application of the substitution; so is Corollary \ref{cor:measure_preserve}.
- **The $$L^2$$-norm (integral of variance) is preserved: $$\int_I \mathrm{var}(Z(t)) dt = \int_{\theta(I)} \mathrm{var}(X(s)) ds$$.**  
  ✅  
  This is the probabilistic version of the $$L^2$$-norm preservation, proved via the same substitution.

### **Oscillatory Representation (Sec 4.2)**

- **The process $$Z(t) = \sqrt{\dot{\theta}(t)} X(\theta(t))$$ is oscillatory with $$\phi_t(\omega) = \sqrt{\dot{\theta}(t)} e^{i\omega \theta(t)}$$ and $$A_t(\omega) = \sqrt{\dot{\theta}(t)} e^{i\omega (\theta(t)-t)}$$.**  
  ✅  
  The spectral representation is correct, and $$A_t(\omega)$$ is as in Priestley’s definition.
- **$$A_t(\cdot) \in L^2(\mu)$$ for each $$t$$:**  
  ✅  
  The proof is correct—$$\dot{\theta}(t)$$ is finite a.e. and $$\mu$$ is finite.

### **Evolutionary Spectrum (Sec 4.3)**

- **The evolutionary power spectrum is $$dF_t(\omega) = \dot{\theta}(t) d\mu(\omega)$$.**  
  ✅  
  This is correct by construction and definition of the evolutionary spectrum.
- **This follows from $$|A_t(\omega)|^2 = \dot{\theta}(t)$$.**  
  ✅  
  The proof is correct.

### **Operator Conjugation (Sec 5)**

- **The transformed covariance operator $$T_{K_\theta}$$ is given by $$T_{K_\theta} = M_\theta T_K M_\theta^{-1}$$.**  
  ✅  
  The proof is a correct computation using the definitions of $$M_\theta$$, $$T_K$$, and the change of variables.
- **The kernel of the transformed process is $$K_\theta(s,t) = K(|\theta(t)-\theta(s)|) \sqrt{\dot{\theta}(t)\dot{\theta}(s)}$$.**  
  ✅  
  This is the covariance function of $$Z(t)$$, derived correctly.

### **Expected Zero Count (Sec 6)**

- **The expected number of zeros of the time-changed process in $$[a,b]$$ is $$\sqrt{-\ddot{K}(0)} (\theta(b) - \theta(a))$$.**  
  ✅  
  The Kac-Rice argument and the limit of the mixed partial derivative are correctly computed under the given smoothness assumptions.
- **The scaling factor $$\sqrt{\dot{\theta}(t)}$$ does not affect the zero count because it cancels out in the normalized process used in the Kac-Rice formula.**  
  ✅  
  The note is correct: for zero crossings (a.s.), the amplitude scaling does not matter—only the time warping (i.e., the range $$\theta(b) - \theta(a)$$) is relevant.

### **Conclusion**

- **The construction, spectral characterization, operator conjugation, and zero-crossing results are summarized accurately.**  
  ✅  
  The summary accurately reflects the paper’s results.
- **The note “the scaling factor does not affect the zero count” is correct and important.**  
  ✅  
  This is a key insight—zero crossings are invariant to amplitude scaling.

### **References**

- **All cited works exist and the descriptions are accurate.**  
  ✅  
  The references (Priestley, Cramér & Leadbetter, Kac, Rice) are real and relevant to the topic.

### **Minor Syntax/Notation**

- **No claims are made about non-stationary Gaussian processes in general, only those obtained by this construction.**  
  ✅  
  The scope is clear and correct.
- **There are no mathematical errors in the notation or logic.**  
  ✅  
  The mathematical development is sound, given the assumptions.

### **Final Verdict**

**No substantive errors or false claims were found in the manuscript.** ✅  
All major statements are mathematically correct and well-justified under the stated assumptions. The only criticism might be regarding the clarity or rigor of certain proofs, but the results themselves are valid.
