<TeXmacs|2.1.1>

<style|<tuple|generic|mathematica|manila-paper>>

<\body>
  <\session|mathematica|default>
    <\unfolded-io>
      <with|color|red|In[42]:= >
    <|unfolded-io>
      ry := Function[t, (Sqrt[2]*Sin[t]*Cos[t])/(1 + Sin[t]^2)]
    <|unfolded-io>
      <math|<with|math-display|true|mode|text|Null>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|In[43]:= >
    <|unfolded-io>
      rx := Function[t, (Sqrt[2]*Cos[t])/(1 + Sin[t]^2)]
    <|unfolded-io>
      <math|<with|math-display|true|mode|text|Null>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|In[44]:= >
    <|unfolded-io>
      rx[t]
    <|unfolded-io>
      <math|<with|math-display|true|<frac|<sqrt|2>*cos
      <around|(|t|)>|sin<rsup|2><around|(|t|)>+1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|In[45]:= >
    <|unfolded-io>
      ry[t]
    <|unfolded-io>
      <math|<with|math-display|true|<frac|<sqrt|2>*sin <around|(|t|)>*cos
      <around|(|t|)>|sin<rsup|2><around|(|t|)>+1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|In[48]:= >
    <|unfolded-io>
      z:=Function[t,FullSimplify[rx[t]+I*ry[t]]]
    <|unfolded-io>
      <math|<with|math-display|true|mode|text|Null>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|In[49]:= >
    <|unfolded-io>
      z[t]
    <|unfolded-io>
      <math|<with|math-display|true|<frac|<sqrt|2>*cos <around|(|t|)>|1-i*sin
      <around|(|t|)>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|In[51]:= >
    <|unfolded-io>
      FullSimplify[D[z[t],t]]
    <|unfolded-io>
      <math|<with|math-display|true|<frac|<sqrt|2>*<around|(|sin
      <around|(|t|)>-i|)>|<around|(|sin <around|(|t|)>+i|)><rsup|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|In[52]:= >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>