/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.2.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.algebra.Ring;
 
/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public class IntegerPolynomial implements AutoCloseable,Ring<IntegerPolynomial> {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public IntegerPolynomial(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(IntegerPolynomial obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_IntegerPolynomial(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  static { System.loadLibrary( "arblib" ); }
  public String name;

  public IntegerPolynomial add(IntegerPolynomial addend, IntegerPolynomial res)
  {
    return add(addend, 0, res);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof IntegerPolynomial))
    {
      return false;
    }
    IntegerPolynomial other = (IntegerPolynomial) obj;

    return arblib.fmpz_poly_equal(this, other) != 0;
  }
  
  public IntegerPolynomial add(IntegerPolynomial addend, int bits, IntegerPolynomial res)
  {
    arblib.fmpz_poly_add(res, this, addend);
    return res;
  }
    
  @Override
  public void close() 
  {
    delete();
  }
  
    @Override
  public IntegerPolynomial mul(IntegerPolynomial operand, int prec, IntegerPolynomial result)
  {
    arblib.fmpz_poly_mul(result, this, operand);
    return result;
  }

  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
   this.name = name;
   return (N) this;
  }

  @Override
  public String getName()
  {
    return name;
  }
  
  @Override
  public IntegerPolynomial div(IntegerPolynomial operand, int prec, IntegerPolynomial result)
  {
    arblib.fmpz_poly_div(result, this, operand);
    return result;
  }  
  
  @Override
  public IntegerPolynomial sub(IntegerPolynomial subtrahend, int bits, IntegerPolynomial res)
  {
    arblib.fmpz_poly_sub(res, this, subtrahend);
    return res;
  }


  public void setCoeffsNative(long value) {
    arblibJNI.IntegerPolynomial_coeffsNative_set(swigCPtr, this, value);
  }

  public long getCoeffsNative() {
    return arblibJNI.IntegerPolynomial_coeffsNative_get(swigCPtr, this);
  }

  public void setLength(int value) {
    arblibJNI.IntegerPolynomial_length_set(swigCPtr, this, value);
  }

  public int getLength() {
    return arblibJNI.IntegerPolynomial_length_get(swigCPtr, this);
  }

  public IntegerPolynomial() {
    this(arblibJNI.new_IntegerPolynomial(), true);
  }

}