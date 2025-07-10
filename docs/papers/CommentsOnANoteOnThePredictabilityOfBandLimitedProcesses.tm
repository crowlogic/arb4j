<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Comments on ``A Note on the Predictability of
  Band-Limited Processes''>|<doc-author|<author-data|<author-name|Farokh
  Marvasti>|<\author-affiliation>
    The author was with the University of California at Davis, Davis, CA, on
    leave from Sharif University of Technology, Tehran, Iran. He is now at
    AT&T Bell Laboratories, Naperville, IL 60566, USA.
  </author-affiliation>>>>

  <abstract-data|<abstract|We show that the problem presented in the letter
  by Papoulis<nbsp><cite|papoulis1985> has been proved by
  others<nbsp><cite|wainstein1962|brown1972|beutler1966|fjallbrandt1975|requicha1980|knab1981>
  using different methods. We present a much simpler proof which covers
  random and deterministic signals with uniform or nonuniform sampling.>>

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

  <\theorem>
    <label|thm:unique_reconstruction>If the past samples have a rate slightly
    greater than the Nyquist, then no band-limited signal (having a bandwidth
    equal to or smaller than half the Nyquist rate) can be found to have zero
    crossings at the past instances. Therefore, the past samples represent
    uniquely the band-limited signal.
  </theorem>

  <\proof>
    This is because the average zero crossings per interval of a band-limited
    signal is equal to the Nyquist rate. Therefore, the past samples
    represent uniquely the band-limited signal<nbsp><cite|requicha1980>. This
    argument is valid for deterministic and random signals with uniform (or
    random) samples.
  </proof>

  <\thebibliography|99>
    <bibitem|wainstein1962>L.<nbsp>A.<nbsp>Wainstein and
    V.<nbsp>D.<nbsp>Zubakov, <em|Extraction of Signals from Noise>, Englewood
    Cliffs, NJ: Prentice-Hall, 1962.

    <bibitem|brown1972>J.<nbsp>L.<nbsp>Brown, Jr., \PUniform linear
    prediction of bandlimited processes from samples,\Q <em|IEEE Trans.
    Inform. Theory>, vol.<nbsp>IT-18, pp.<nbsp>662\U664, Sept.<nbsp>1972.

    <bibitem|beutler1966>F.<nbsp>Beutler, \PError free recovery of signals
    from irregular samples,\Q <em|SIAM Rev.>, vol.<nbsp>8, pp.<nbsp>322\U335,
    July<nbsp>1966.

    <bibitem|fjallbrandt1975>T.<nbsp>T.<nbsp>Fjallbrandt, \PInterpolation and
    extrapolation in non-uniform sampling sequences with average sampling
    rate below the Nyquist rate,\Q <em|Electron. Lett.>, vol.<nbsp>11,
    no.<nbsp>12, pp.<nbsp>264\U266, 12th June 1975.

    <bibitem|requicha1980>A.<nbsp>Requicha, \PThe zeros of entire functions:
    Theory and engineering applications,\Q <em|Proc. IEEE>, vol.<nbsp>68,
    no.<nbsp>3, pp.<nbsp>308\U328, Mar.<nbsp>1980.

    <bibitem|knab1981>J.<nbsp>J.<nbsp>Knab, \PNoncentral interpolation of
    band-limited signals,\Q <em|IEEE Trans. Aerosp. Electron. Syst.>,
    vol.<nbsp>AES-17, no.<nbsp>4, pp.<nbsp>586\U590, July<nbsp>1981.

    <bibitem|papoulis1985>A.<nbsp>Papoulis, \PA Note on the Predictability of
    Band-Limited Processes,\Q <em|Proc. IEEE>, vol.<nbsp>73, no.<nbsp>8,
    pp.<nbsp>1332\U1333, Aug.<nbsp>1985.
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
    <associate|bib-beutler1966|<tuple|beutler1966|1>>
    <associate|bib-brown1972|<tuple|brown1972|1>>
    <associate|bib-fjallbrandt1975|<tuple|fjallbrandt1975|2>>
    <associate|bib-knab1981|<tuple|knab1981|2>>
    <associate|bib-papoulis1985|<tuple|papoulis1985|2>>
    <associate|bib-requicha1980|<tuple|requicha1980|2>>
    <associate|bib-wainstein1962|<tuple|wainstein1962|1>>
    <associate|thm:unique_reconstruction|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      papoulis1985

      wainstein1962

      brown1972

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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>