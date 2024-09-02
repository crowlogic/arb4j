<TeXmacs|2.1.4>

<style|<tuple|article|std-latex>>

<\body>
  <doc-data|<doc-title|Proof of Equality>|<doc-date|<date|>>>

  <\proof>
    We will prove that:

    <\equation*>
      <frac|1|2>*<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|2>*<sqrt|<frac|4*n+1|\<pi\>>>=<frac|4*n+1|\<pi\>>
    </equation*>

    <\enumerate>
      <item>Start with the left side of the equation:

      <\equation*>
        <frac|1|2><around*|(|<frac|8*n+2|\<pi\>>|)><rsup|<frac|1|2>>*2<rsup|<frac|1|2>><around*|(|<frac|4*n+1|\<pi\>>|)><rsup|<frac|1|2>>
      </equation*>

      <item>Simplify <math|2<rsup|<frac|1|2>>>:

      <\equation*>
        <frac|1|2><around*|(|<frac|8*n+2|\<pi\>>|)><rsup|<frac|1|2>><sqrt|2><around*|(|<frac|4*n+1|\<pi\>>|)><rsup|<frac|1|2>>
      </equation*>

      <item>Combine terms under square roots:

      <\equation*>
        <frac|1|2>*<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|2>*<sqrt|<frac|4*n+1|\<pi\>>>
      </equation*>

      <item>Combine <math|<sqrt|2>> with one of the other square roots:

      <\equation*>
        <frac|1|2>*<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|<frac|2*<around|(|4*n+1|)>|\<pi\>>>
      </equation*>

      <item>Multiply terms under the square roots:

      <\equation*>
        <frac|1|2>*<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|<frac|8*n+2|\<pi\>>>
      </equation*>

      <item>Multiply equal square roots:

      <\equation*>
        <frac|1|2>*<frac|8*n+2|\<pi\>>
      </equation*>

      <item>Multiply <math|<frac|1|2>> by <math|<around|(|8*n+2|)>>:

      <\equation*>
        <frac|4*n+1|\<pi\>>
      </equation*>
    </enumerate>

    This is exactly the right side of the equation we were trying to prove.

    Therefore, we have shown that:

    <\equation*>
      <frac|1|2>*<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|2>*<sqrt|<frac|4*n+1|\<pi\>>>=<frac|4*n+1|\<pi\>>
    </equation*>

    The proof is complete.
  </proof>
</body>

<initial|<\collection>
</collection>>