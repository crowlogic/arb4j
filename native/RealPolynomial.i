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
   * Sets {C, max(lenThis, lenThat)} to the sum of {this, thisLen} and {that, thatLen} by calling
   * {@link arblib#arb_poly_add(RealPolynomial, RealPolynomial, RealPolynomial, int)}<br>
   * 
   * Allows aliasing of the input and output operands.
   * 
   * @param that
   * @param prec
   * @param result
   * @return result
   */
  public RealPolynomial add(RealPolynomial that, int prec, RealPolynomial result)
  {
    arblib.arb_poly_add(result, this, that, prec);
    return result;
  }
  
  /**
   * Sets {C, max(lenThis, lenThat)} to the difference of {this, thisLen} and {that, thatLen} by calling
   * {@link arblib#arb_poly_sub(RealPolynomial, RealPolynomial, RealPolynomial, int)}<br>
   * 
   * Allows aliasing of the input and output operands.
   * 
   * @param that
   * @param prec
   * @param result
   * @return result
   */
  public RealPolynomial sub(RealPolynomial that, int prec, RealPolynomial result)
  {
    arblib.arb_poly_sub(result, this, that, prec);
    return result;
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
    case 0:
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
    if ( coeffsNative != null )
    {
      coeffsNative.dim = getLength();
      coeffsNative.elements = new Real[coeffsNative.dim];      
    }
    return coeffsNative;
  }   
%};