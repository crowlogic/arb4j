<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Comments on ``A Note on the Predictability of
  Band-Limited Processes''>|<doc-author|<author-data|<author-name|Farokh
  Marvasti>>>|<doc-date|January 21, 1986>>

  <abstract-data|<\abstract>
    A simpler proof is provided for the problem presented by Papoulis
    regarding past uniform sampling of random signals, extending the result
    to deterministic signals and nonuniform sampling.
  </abstract>>

  <section|Introduction>

  The problem of past uniform sampling of random signals, as presented by
  Papoulis<cite|papoulis1985>, is shown to have been previously solved by
  others using different methods. This note provides a simpler proof that
  covers both random and deterministic signals with uniform or nonuniform
  sampling.

  <section|Proof of Uniqueness for Band-Limited Signals>

  <\theorem>
    <label|thm:uniqueness>If the past samples have a rate slightly greater
    than the Nyquist rate, then no band-limited signal (having a bandwidth
    equal to or smaller than half the Nyquist rate) can be found to have zero
    crossings at the past instances.
  </theorem>

  <\proof>
    The average zero crossings per interval of a band-limited signal is equal
    to the Nyquist rate. Therefore, the past samples represent uniquely the
    band-limited signal <cite|requicha1980>. This argument is valid for
    deterministic and random signals with uniform or nonuniform samples.
  </proof>

  <section|Discussion>

  The proof presented here is implied in <cite|requicha1980>. Previous
  solutions for this problem include:

  <\itemize>
    <item>Wainstein and Zubakov <cite|wainstein1962> at three times the
    Nyquist rate,

    <item>Brown <cite|brown1972> at two times the Nyquist rate,

    <item>Beutler <cite|beutler1966> for deterministic and random signals
    with general nonuniform samples,

    <item>Fjallbrandt <cite|fjallbrandt1975> for past uniform samples.
  </itemize>

  <section|Conclusion>

  The proof by Papoulis, while different, can be simplified and generalized
  to cover both deterministic and random signals with uniform or nonuniform
  sampling, as shown above.

  <section*|Acknowledgments>

  The author was with the University of California at Davis, on leave from
  Sharif University of Technology, Tehran, Iran, and is now at AT&T Bell
  Laboratories, Naperville, IL.

  <section*|References>

  <\thebibliography|9>
    <bibitem|papoulis1985>A. Papoulis, \PA note on the predictability of
    band-limited processes,\Q <with|font-shape|italic|Proc. IEEE>, vol. 73,
    no. 8, pp. 1332\U1333, Aug. 1985.

    <bibitem|wainstein1962>L. A. Wainstein and V. D. Zubakov,
    <with|font-shape|italic|Extraction of Signals from Noise>. Englewood
    Cliffs, NJ: Prentice-Hall, 1962.

    <bibitem|brown1972>J. L. Brown, Jr., \PUniform linear prediction of
    bandlimited processes from samples,\Q <with|font-shape|italic|IEEE Trans.
    Inform. Theory>, vol. IT-18, pp. 662\U664, Sept. 1972.

    <bibitem|beutler1966>F. Beutler, \PError free recovery of signals from
    irregular samples,\Q <with|font-shape|italic|SIAM Rev.>, vol. 8, pp.
    322\U335, July 1966.

    <bibitem|fjallbrandt1975>T. T. Fjallbrandt, \PInterpolation and
    extrapolation in non-uniform sampling sequences with average sampling
    rate below the Nyquist rate,\Q <with|font-shape|italic|Electron. Lett.>,
    vol. 11, no. 12, pp. 264\U266, 12th June 1975.

    <bibitem|requicha1980>A. Requicha, \PThe zeros of entire functions:
    Theory and engineering applications,\Q <with|font-shape|italic|Proc.
    IEEE>, vol. 68, no. 3, pp. 308\U328, Mar. 1980.

    <bibitem|knab1981>J. J. Knab, \PNoncentral interpolation of band-limited
    signals,\Q <with|font-shape|italic|IEEE Trans. Aerosp. Electron. Syst.>,
    vol. AES-17, no. 4, pp. 586\U590, July 1981.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|4|2>>
    <associate|auto-6|<tuple|4|2>>
    <associate|auto-7|<tuple|4|2>>
    <associate|bib-beutler1966|<tuple|beutler1966|2>>
    <associate|bib-brown1972|<tuple|brown1972|2>>
    <associate|bib-fjallbrandt1975|<tuple|fjallbrandt1975|2>>
    <associate|bib-knab1981|<tuple|knab1981|2>>
    <associate|bib-papoulis1985|<tuple|papoulis1985|2>>
    <associate|bib-requicha1980|<tuple|requicha1980|2>>
    <associate|bib-wainstein1962|<tuple|wainstein1962|2>>
    <associate|thm:uniqueness|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      papoulis1985

      requicha1980

      requicha1980

      wainstein1962

      brown1972

      beutler1966

      fjallbrandt1975
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof
      of Uniqueness for Band-Limited Signals>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Discussion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>