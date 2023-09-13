%typemap(javaimports) arb_poly_struct %{
import static arb.arblib.*;
import arb.functions.real.RealFunction;
%}

%typemap(javafinalize) arb_poly_struct ""
%typemap(javainterfaces) arb_poly_struct "AutoCloseable,RealFunction"

%typemap(javacode) arb_poly_struct %{

  @Override
  public String toString()
  {
    return String.format("RealPolynomial[length=%d, coeffs=%s]", getLength(), getCoeffs());
  }


  /**
   * Calls {@link arb#arb_clear(Real)}
   * 
   * @return this
   */
  public RealPolynomial clear()
  {
    if ( swigCMemOwn )
    {
      arb_poly_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  {
    clear();
  }
  
 /**
   * @see arb#arb_poly_product_roots(RealPolynomial, Real, int, int)
   * 
   * @param xs
   * @param prec
   * @return
   */
  public RealPolynomial productRoots(Real xs, int prec)
  {
    arb_poly_product_roots(this, xs, xs.dim, prec);
    return this;
  }
  
  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    switch (order)
    {
    case 1:
      arb_poly_evaluate(w, this, z, prec);
      return w;
    case 2:
      arb_poly_evaluate2(w, w.get(1), this, z, prec);
      return w;
    default:
      throw new UnsupportedOperationException("derivatives beyond the first are not yet implemented");
    }

  }
  
  public double eval(double d)
  {
    try ( Real t = new Real(); Real s = new Real() )
    {
      t.set(d);
      return evaluate(t, 1, 70, s).doubleValue();
    }
  }
  
  
  public void setCoeffs(Real value)
  {
    setCoeffsNative(value);
    setLength(value.size());
  }

  public Real getCoeffs()
  {
    Real coeffsNative = getCoeffsNative();
    coeffsNative.dim = getLength();
    coeffsNative.elements = new Real[coeffsNative.dim];
    return coeffsNative;
  }  
%};