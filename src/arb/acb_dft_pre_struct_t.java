/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class acb_dft_pre_struct_t {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  public acb_dft_pre_struct_t(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(acb_dft_pre_struct_t obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  @SuppressWarnings("deprecation")
  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arbJNI.delete_acb_dft_pre_struct_t(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setRad2(acb_dft_rad2_struct value) {
    arbJNI.acb_dft_pre_struct_t_rad2_set(swigCPtr, this, acb_dft_rad2_struct.getCPtr(value), value);
  }

  public acb_dft_rad2_struct getRad2() {
    long cPtr = arbJNI.acb_dft_pre_struct_t_rad2_get(swigCPtr, this);
    return (cPtr == 0) ? null : new acb_dft_rad2_struct(cPtr, false);
  }

  public void setCyc(acb_dft_cyc_struct value) {
    arbJNI.acb_dft_pre_struct_t_cyc_set(swigCPtr, this, acb_dft_cyc_struct.getCPtr(value), value);
  }

  public acb_dft_cyc_struct getCyc() {
    long cPtr = arbJNI.acb_dft_pre_struct_t_cyc_get(swigCPtr, this);
    return (cPtr == 0) ? null : new acb_dft_cyc_struct(cPtr, false);
  }

  public void setProd(acb_dft_prod_struct value) {
    arbJNI.acb_dft_pre_struct_t_prod_set(swigCPtr, this, acb_dft_prod_struct.getCPtr(value), value);
  }

  public acb_dft_prod_struct getProd() {
    long cPtr = arbJNI.acb_dft_pre_struct_t_prod_get(swigCPtr, this);
    return (cPtr == 0) ? null : new acb_dft_prod_struct(cPtr, false);
  }

  public void setCrt(acb_dft_crt_struct value) {
    arbJNI.acb_dft_pre_struct_t_crt_set(swigCPtr, this, acb_dft_crt_struct.getCPtr(value), value);
  }

  public acb_dft_crt_struct getCrt() {
    long cPtr = arbJNI.acb_dft_pre_struct_t_crt_get(swigCPtr, this);
    return (cPtr == 0) ? null : new acb_dft_crt_struct(cPtr, false);
  }

  public void setNaive(acb_dft_naive_struct value) {
    arbJNI.acb_dft_pre_struct_t_naive_set(swigCPtr, this, acb_dft_naive_struct.getCPtr(value), value);
  }

  public acb_dft_naive_struct getNaive() {
    long cPtr = arbJNI.acb_dft_pre_struct_t_naive_get(swigCPtr, this);
    return (cPtr == 0) ? null : new acb_dft_naive_struct(cPtr, false);
  }

  public void setBluestein(acb_dft_bluestein_struct value) {
    arbJNI.acb_dft_pre_struct_t_bluestein_set(swigCPtr, this, acb_dft_bluestein_struct.getCPtr(value), value);
  }

  public acb_dft_bluestein_struct getBluestein() {
    long cPtr = arbJNI.acb_dft_pre_struct_t_bluestein_get(swigCPtr, this);
    return (cPtr == 0) ? null : new acb_dft_bluestein_struct(cPtr, false);
  }

  public acb_dft_pre_struct_t() {
    this(arbJNI.new_acb_dft_pre_struct_t(), true);
  }

}
