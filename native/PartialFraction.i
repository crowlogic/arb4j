%{
#include "partial_fraction.h"
%}

%rename (PartialFraction) arb4j_partial_fraction_t;

/* Avoid name clash with SWIG-generated acb_ptr getters. */
%typemap(javacode) arb4j_partial_fraction_t %{
  public Complex[] getPolesArray()
  {
    int m = getN();
    Complex[] arr = new Complex[m];
    for (int i = 0; i < m; i++)
    {
      arr[i] = new Complex();
      arblib.arb4j_partial_fraction_get_pole(arr[i], this, i);
    }
    return arr;
  }

  public Complex[] getResiduesArray()
  {
    int m = getN();
    Complex[] arr = new Complex[m];
    for (int i = 0; i < m; i++)
    {
      arr[i] = new Complex();
      arblib.arb4j_partial_fraction_get_residue(arr[i], this, i);
    }
    return arr;
  }
%}

%include "partial_fraction.h"
