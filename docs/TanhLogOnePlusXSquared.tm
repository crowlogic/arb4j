<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Hyperbolic Tangent of the Logarithmic Of One Plus
  X Squared>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    The following identity holds:

    <\equation>
      tanh <around|(|log <around|(|1+x<rsup|2>|)>|)>=<frac|<around|(|1+x<rsup|2>|)><rsup|2>-1|<around|(|1+x<rsup|2>|)><rsup|2>+1>
    </equation>
  </theorem>

  <\proof>
    Beginning with the definition of the hyperbolic tangent function:

    <\equation>
      tanh <around|(|z|)>=<frac|e<rsup|z>-e<rsup|-z>|e<rsup|z>+e<rsup|-z>>
    </equation>

    Substitute <math|z=log <around|(|1+x<rsup|2>|)>> into <math|tanh
    <around|(|z|)>>:

    <\equation>
      tanh <around|(|log <around|(|1+x<rsup|2>|)>|)>=<frac|e<rsup|log
      <around|(|1+x<rsup|2>|)>>-e<rsup|-log
      <around|(|1+x<rsup|2>|)>>|e<rsup|log
      <around|(|1+x<rsup|2>|)>>+e<rsup|-log <around|(|1+x<rsup|2>|)>>>
    </equation>

    Using the property of exponentials,\ 

    <\equation>
      e<rsup|log <around|(|a|)>>=a
    </equation>

    <\equation>
      e<rsup|-log <around|(|a|)>>=<frac|1|a>
    </equation>

    simplify:

    <\equation>
      e<rsup|log <around|(|1+x<rsup|2>|)>>=1+x<rsup|2>
    </equation>

    <\equation>
      e<rsup|-log <around|(|1+x<rsup|2>|)>>=<frac|1|1+x<rsup|2>>
    </equation>

    Substitute these into the expression:

    <\equation>
      tanh <around|(|log <around|(|1+x<rsup|2>|)>|)>=<frac|<around|(|1+x<rsup|2>|)>-<frac|1|1+x<rsup|2>>|<around|(|1+x<rsup|2>|)>+<frac|1|1+x<rsup|2>>>
    </equation>

    Simplify the numerator and denominator by finding a common denominator of
    <math|1+x<rsup|2>>:

    <\equation>
      tanh <around|(|log <around|(|1+x<rsup|2>|)>|)>=<frac|<frac|<around|(|1+x<rsup|2>|)><rsup|2>-1|1+x<rsup|2>>|<frac|<around|(|1+x<rsup|2>|)><rsup|2>+1|1+x<rsup|2>>>
    </equation>

    Cancel the common factor of <math|1+x<rsup|2>> in the numerator and
    denominator:

    <\equation>
      tanh <around|(|log <around|(|1+x<rsup|2>|)>|)>=<frac|<around|(|x<rsup|2>+1|)><rsup|2>-1|<around|(|x<rsup|2>+1|)><rsup|2>+1>
    </equation>

    Thus, we have shown that:

    <\equation>
      tanh <around|(|log <around|(|1+x<rsup|2>|)>|)>=<frac|<around|(|x<rsup|2>+1|)><rsup|2>-1|<around|(|x<rsup|2>+1|)><rsup|2>+1>
    </equation>

    This completes the proof.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>