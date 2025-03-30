<TeXmacs|2.1.4>

<style|<tuple|article|std-latex>>

<\body>
  <doc-data|<doc-title|Proof that <math|<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|<frac|4*n+1|2*\<pi\>>>=<frac|4*n+1|\<pi\>>>>>

  <\proof>
    We will prove that:

    <\equation>
      <sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|<frac|4*n+1|2*\<pi\>>>=<frac|4*n+1|\<pi\>>
    </equation>

    <\enumerate>
      <item>Start with the left side of the equation:

      <\equation>
        =<sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|<frac|4*n+1|2*\<pi\>>>
      </equation>

      <item>Multiply the terms under the square roots:

      <\equation>
        =<sqrt|<frac|<around|(|8*n+2|)>*<around|(|4*n+1|)>|\<pi\>
        2**\<pi\>>>=<sqrt|<frac|<around|(|8*n+2|)>*<around|(|4*n+1|)>|2*\<pi\><rsup|2>>>
      </equation>

      <item>Expand the numerator:

      <\equation>
        =<sqrt|<frac|32*n<rsup|2>+8*n+8*n+2|2*\<pi\><rsup|2>>>
      </equation>

      <item>Simplify:

      <\equation>
        =<sqrt|<frac|32*n<rsup|2>+16*n+2|2*\<pi\><rsup|2>>>
      </equation>

      <item>Divide both numerator and denominator by 2:

      <\equation>
        =<sqrt|<frac|16*n<rsup|2>+8*n+1|\<pi\><rsup|2>>>
      </equation>

      <item>Factor the numerator:

      <\equation>
        =<sqrt|<frac|<around|(|4*n+1|)><rsup|2>|\<pi\><rsup|2>>>
      </equation>

      where we see by expanding that

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<around*|(|4n+1|)>*<around*|(|4n+1|)>>|<cell|=4n*4n+4n+4n+1>>|<row|<cell|>|<cell|=16
        n n+4n+4n+1>>|<row|<cell|>|<cell|=16n<rsup|2>+4n+4n+1>>|<row|<cell|>|<cell|=16n<rsup|2>+8n+1>>>>>
      </equation>

      <item>Now, the square root of a square is the identity so finally :

      <\equation>
        =<frac|4*n+1|\<pi\>>
      </equation>
    </enumerate>

    This is exactly the right side of the equation whose proof was sought;
    therefore, it has been shown that:

    <\equation>
      <sqrt|<frac|8*n+2|\<pi\>>>*<sqrt|<frac|4*n+1|2*\<pi\>>>=<frac|4*n+1|\<pi\>>
    </equation>

    The proof is complete.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
  </collection>
</initial>