<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Comments on \PA Note on the Predictability of
  Band-Limited Processes\Q>|<doc-author|<author-data|<author-name|Farokh
  Marvasti>>>|<doc-title-options|cluster-all>>

  <abstract-data|<abstract|<with|par-mode|left|We show that the problem
  presented in the above letter<nbsp><cite|papoulis1985> by Papoulis has been
  proved by others<nbsp><cite|beutler1966|fjallbrandt1975|requicha1980|knab1981>
  using different methods. We present a much simpler proof which covers
  random and deterministic signals with uniform or nonuniform sampling>>>

  I just came across a recent letter by Papoulis<nbsp><cite|papoulis1985> on
  past uniform sampling of random signals. This problem was solved
  in<nbsp><cite|wainstein1962> at three times the Nyquist rate and
  in<nbsp><cite|brown1972> at two times the Nyquist rate.
  Beutler<nbsp><cite|beutler1966> solved this problem both for deterministic
  and random signals for general nonuniform samples at any rate greater than
  that of Nyquist. Fjallbrandt<nbsp><cite|fjallbrandt1975> has
  verified<nbsp><cite|beutler1966> for past uniform samples. Although the
  proof by Papoulis<nbsp><cite|papoulis1985> is different from the others,
  there is a much simpler way to prove past sampling for uniform or
  nonuniform samples for deterministic or random signals. The proof is
  implied in<nbsp><cite|requicha1980>.

  <\proof>
    <label|proof:main>If the past samples have a rate slightly greater than
    the Nyquist, then no band-limited signal (having a bandwidth equal to or
    smaller than half the Nyquist rate) can be found to have zero crossings
    at the past instances. This is because the average zero crossings per
    interval of a band-limited signal is equal to the Nyquist rate.
    Therefore, the past samples represent uniquely the band-limited
    signal<nbsp><cite|requicha1980>. This argument is valid for deterministic
    and random signals with uniform (or random) samples.
  </proof>

  <subsection*|Manuscript Information>

  Manuscript received January 21, 1986.

  The author was with the University of California at Davis, Davis, CA, on
  leave from Sharif University of Technology, Tehran, Iran. He is now at AT&T
  Bell Laboratories, Naparville, IL 60566, USA.

  <\thebibliography|9>
    <bibitem|wainstein1962>L. A. Wainstein and V. D. Zubakov, <em|Extraction
    of Signals from Noise>. Englewood Cliffs, NJ: Prentice-Hall, 1962.

    <bibitem|brown1972>J. L. Brown, Jr., \PUniform linear prediction of
    bandlimited processes from samples,\Q <em|IEEE Trans. Inform. Theory>,
    vol. IT-18, pp. 662-664, Sept. 1972.

    <bibitem|beutler1966>F. Beutler, \PError free recovery of signals from
    irregular samples,\Q <em|SIAM Rev.>, vol. 8, pp. 322-335, July 1966.

    <bibitem|fjallbrandt1975>T. T. Fjallbrandt, \PInterpolation and
    extrapolation in non-uniform sampling sequences with average sampling
    rate below the Nyquist rate,\Q <em|Electron. Lett.>, vol. 11, no. 12, pp.
    264-266, 12th June 1975.

    <bibitem|requicha1980>A. Requicha, \PThe zeros of entire functions:
    Theory and engineering applications,\Q <em|Proc. IEEE>, vol. 68, no. 3,
    pp. 308-328, Mar. 1980.

    <bibitem|knab1981>J. J. Knab, \PNoncentral interpolation of band-limited
    signals,\Q <em|IEEE Trans. Aerosp. Electron. Syst.>, vol. AES-17, no. 4,
    pp. 586-590, July 1981.

    <bibitem|papoulis1985>A. Papoulis, \PA Note on the Predictability of
    Band-Limited Processes,\Q <em|Proc. IEEE>, vol. 73, no. 8, pp. 1332-1333,
    Aug. 1985.
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|?|1>>
    <associate|bib-beutler1966|<tuple|beutler1966|2>>
    <associate|bib-brown1972|<tuple|brown1972|1>>
    <associate|bib-fjallbrandt1975|<tuple|fjallbrandt1975|2>>
    <associate|bib-knab1981|<tuple|knab1981|2>>
    <associate|bib-papoulis1985|<tuple|papoulis1985|2>>
    <associate|bib-requicha1980|<tuple|requicha1980|2>>
    <associate|bib-wainstein1962|<tuple|wainstein1962|1>>
    <associate|proof:main|<tuple|?|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      papoulis1985

      beutler1966

      fjallbrandt1975

      requicha1980

      knab1981

      papoulis1985

      wainstein1962

      brown1972

      beutler1966

      fjallbrandt1975

      beutler1966

      papoulis1985

      requicha1980

      requicha1980
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Manuscript Information
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>