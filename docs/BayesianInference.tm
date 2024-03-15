<TeXmacs|2.1.1>

<style|article>

<\body>
  <doc-data|<doc-title|Bayesian Inference>>

  <section|Introduction>

  Bayesian inference is a method of statistical inference that utilizes
  Bayes' theorem to update the probability of a hypothesis based on observed
  evidence. This article explores the principles underlying Bayesian
  inference.

  <section|Bayes' Theorem>

  At the core of Bayesian inference is Bayes' theorem, which relates the
  conditional and marginal probabilities of two events. It is expressed as:

  <\equation*>
    P<around|(|H\|E|)>=<frac|P<around|(|E\|H|)>\<cdot\>P<around|(|H|)>|P<around|(|E|)>>
  </equation*>

  Where:

  <\itemize>
    <item><math|P<around|(|H\|E|)>> is the posterior probability of
    hypothesis <math|H> given evidence <math|E>.

    <item><math|P<around|(|E\|H|)>> is the likelihood of observing evidence
    <math|E> given hypothesis <math|H>.

    <item><math|P<around|(|H|)>> is the prior probability of hypothesis
    <math|H>.

    <item><math|P<around|(|E|)>> is the probability of observing evidence
    <math|E>, also known as the marginal likelihood.
  </itemize>

  <section|Principles of Bayesian Inference>

  The principles of Bayesian inference can be summarized as follows:

  <\enumerate>
    <item><with|font-series|bold|Prior Probability>: Bayesian inference
    begins with a prior probability distribution representing beliefs or
    uncertainty about the parameters or hypotheses before observing any data.

    <item><with|font-series|bold|Likelihood Function>: The likelihood
    function quantifies the probability of observing the data given specific
    parameter values or hypotheses.

    <item><with|font-series|bold|Posterior Probability>: After observing the
    data, Bayes' theorem is used to update the prior probability distribution
    to obtain the posterior probability distribution, which represents
    updated beliefs or uncertainty about the parameters or hypotheses.

    <item><with|font-series|bold|Bayesian Updating>: Bayesian inference
    involves iteratively updating the posterior distribution as new data
    becomes available, allowing for incorporation of prior knowledge and
    updating beliefs based on observed evidence.

    <item><with|font-series|bold|Decision Making>: Bayesian inference allows
    for decision making by considering the entire posterior distribution. For
    example, one may choose the hypothesis with the highest posterior
    probability (maximum a posteriori estimation) or make decisions based on
    a loss function.
  </enumerate>

  <section|Conclusion>

  Bayesian inference provides a principled framework for updating beliefs or
  uncertainty about hypotheses or parameters based on observed evidence,
  incorporating prior knowledge and iteratively updating beliefs as new data
  becomes available.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Bayes'
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Principles
      of Bayesian Inference> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>