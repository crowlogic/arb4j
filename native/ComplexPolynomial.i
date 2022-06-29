%typemap(javaimports) acb_poly_struct %{
import static arb.Constants.*;
import arb.functions.complex.ComplexFunction;
%}

%typemap(javafinalize) acb_poly_struct ""
%typemap(javainterfaces) acb_poly_struct "AutoCloseable,ComplexFunction"

%typemap(javacode) acb_poly_struct %{

  /**
   * Calls {@link arb#acb_clear(Complex)}
   * 
   * @return this
   */
  public ComplexPolynomial clear()
  {
    if ( swigCMemOwn )
    {
      arb.acb_poly_clear(this);
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
    arb.acb_poly_product_roots(this, xs, xs.dim, prec);
    return this;
  }
  
  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    switch (order)
    {
    case 1:
      arb.acb_poly_evaluate(w, this, z, prec);
      return w;
    case 2:
      arb.acb_poly_evaluate2(w, w.get(1), this, z, prec);
      return w;
    default:
      throw new UnsupportedOperationException("derivatives beyond the first are not yet implemented");
    }

  }
  
  public double evaluateDouble(double d)
  {
    try ( Complex t = new Complex(); Complex s = new Complex() )
    {
      t.getReal().set(d);
      return evaluate(t, 1, 70, s).getReal().doubleValue();
    }
  }
  
%};