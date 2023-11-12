%typemap(javaimports) acb_poly_struct %{
import static arb.RealConstants.*;
import arb.functions.complex.ComplexFunction;
import static arb.arblib.*;
%}

%typemap(javafinalize) acb_poly_struct ""
%typemap(javainterfaces) acb_poly_struct "AutoCloseable,HolomorphicFunction"

%typemap(javacode) acb_poly_struct %{

  @Override
  public String toString()
  {
    return String.format("ComplexPolynomial[length=%d, coeffs=%s]", getLength(), getCoeffs());
  }


  /**
   * Calls {@link arb#acb_clear(Complex)}
   * 
   * @return this
   */
  public ComplexPolynomial clear()
  {
    if ( swigCMemOwn )
    {
      acb_poly_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  {
    clear();
  }
  
 /**
   * @see arb#acb_poly_product_roots(ComplexPolynomial, Complex, int, int)
   * 
   * @param xs
   * @param prec
   * @return
   */
  public ComplexPolynomial productRoots(Complex xs, int prec)
  {
    acb_poly_product_roots(this, xs, xs.dim, prec);
    return this;
  }
  
  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    switch (order)
    {
    case 1:
      acb_poly_evaluate(w, this, z, prec);
      return w;
    case 2:
      acb_poly_evaluate2(w, w.get(1), this, z, prec);
      return w;
    default:
      throw new UnsupportedOperationException("derivatives beyond the first are not yet implemented");
    }

  }
  
  public double eval(double d)
  {
    try ( Complex t = new Complex(); Complex s = new Complex() )
    {
      t.getReal().set(d);
      return evaluate(t, 1, 70, s).getReal().doubleValue();
    }
  }
  
  public void setCoeffs(Complex value)
  {
    setCoeffsNative(value);
    setLength(value.size());
  }

  public Complex getCoeffs()
  {
    Complex coeffsNative = getCoeffsNative();
    coeffsNative.dim = getLength();
    coeffsNative.elements = new Complex[coeffsNative.dim];
    return coeffsNative;
  }  
%};