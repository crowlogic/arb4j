/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.2.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class FastDFTSchemeUnion {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public FastDFTSchemeUnion(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(FastDFTSchemeUnion obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_FastDFTSchemeUnion(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setRad2(FastDFTRadix2Scheme value) {
    arblibJNI.FastDFTSchemeUnion_rad2_set(swigCPtr, this, FastDFTRadix2Scheme.getCPtr(value), value);
  }

  public FastDFTRadix2Scheme getRad2() {
    long cPtr = arblibJNI.FastDFTSchemeUnion_rad2_get(swigCPtr, this);
    return (cPtr == 0) ? null : new FastDFTRadix2Scheme(cPtr, false);
  }

  public void setCyc(FastDFTCyclicScheme value) {
    arblibJNI.FastDFTSchemeUnion_cyc_set(swigCPtr, this, FastDFTCyclicScheme.getCPtr(value), value);
  }

  public FastDFTCyclicScheme getCyc() {
    long cPtr = arblibJNI.FastDFTSchemeUnion_cyc_get(swigCPtr, this);
    return (cPtr == 0) ? null : new FastDFTCyclicScheme(cPtr, false);
  }

  public void setProd(FastDFTProductScheme value) {
    arblibJNI.FastDFTSchemeUnion_prod_set(swigCPtr, this, FastDFTProductScheme.getCPtr(value), value);
  }

  public FastDFTProductScheme getProd() {
    long cPtr = arblibJNI.FastDFTSchemeUnion_prod_get(swigCPtr, this);
    return (cPtr == 0) ? null : new FastDFTProductScheme(cPtr, false);
  }

  public void setCrt(FastDFTChineseRemainder value) {
    arblibJNI.FastDFTSchemeUnion_crt_set(swigCPtr, this, FastDFTChineseRemainder.getCPtr(value), value);
  }

  public FastDFTChineseRemainder getCrt() {
    long cPtr = arblibJNI.FastDFTSchemeUnion_crt_get(swigCPtr, this);
    return (cPtr == 0) ? null : new FastDFTChineseRemainder(cPtr, false);
  }

  public void setNaive(FastDFTNaiveScheme value) {
    arblibJNI.FastDFTSchemeUnion_naive_set(swigCPtr, this, FastDFTNaiveScheme.getCPtr(value), value);
  }

  public FastDFTNaiveScheme getNaive() {
    long cPtr = arblibJNI.FastDFTSchemeUnion_naive_get(swigCPtr, this);
    return (cPtr == 0) ? null : new FastDFTNaiveScheme(cPtr, false);
  }

  public void setBluestein(FastDFTBluesteinScheme value) {
    arblibJNI.FastDFTSchemeUnion_bluestein_set(swigCPtr, this, FastDFTBluesteinScheme.getCPtr(value), value);
  }

  public FastDFTBluesteinScheme getBluestein() {
    long cPtr = arblibJNI.FastDFTSchemeUnion_bluestein_get(swigCPtr, this);
    return (cPtr == 0) ? null : new FastDFTBluesteinScheme(cPtr, false);
  }

  public FastDFTSchemeUnion() {
    this(arblibJNI.new_FastDFTSchemeUnion(), true);
  }

}