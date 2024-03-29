/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

import static arb.arblib.*;

import arb.functions.complex.ComplexFunction;

public class ComplexPolynomial implements AutoCloseable,ComplexFunction {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public ComplexPolynomial(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(ComplexPolynomial obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_ComplexPolynomial(swigCPtr);
      }
      swigCPtr = 0;
    }
  }


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
    if (coeffs != null && (coeffs.dim != getLength() || coeffs.swigCPtr != swigCPtr))
    {
      coeffs.close();
      coeffs = null;
    }
    if (coeffs == null)
    {
      coeffs = getCoeffsNative();
      if (coeffs != null)
      {
        coeffs.dim      = getLength();
        coeffs.elements = new Complex[coeffs.dim];
      }
    }
    return coeffs;
  }

  public Complex coeffs;

  public void setCoeffsNative(Complex value) {
    arblibJNI.ComplexPolynomial_coeffsNative_set(swigCPtr, this, Complex.getCPtr(value), value);
  }

  public Complex getCoeffsNative() {
    long cPtr = arblibJNI.ComplexPolynomial_coeffsNative_get(swigCPtr, this);
    return (cPtr == 0) ? null : new Complex(cPtr, false);
  }

  public void setLength(int value) {
    arblibJNI.ComplexPolynomial_length_set(swigCPtr, this, value);
  }

  public int getLength() {
    return arblibJNI.ComplexPolynomial_length_get(swigCPtr, this);
  }

  public ComplexPolynomial() {
    this(arblibJNI.new_ComplexPolynomial(), true);
  }

}
