/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class acb_dft_naive_struct {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  public acb_dft_naive_struct(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(acb_dft_naive_struct obj) {
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
        arbJNI.delete_acb_dft_naive_struct(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setN(int value) {
    arbJNI.acb_dft_naive_struct_n_set(swigCPtr, this, value);
  }

  public int getN() {
    return arbJNI.acb_dft_naive_struct_n_get(swigCPtr, this);
  }

  public void setDv(int value) {
    arbJNI.acb_dft_naive_struct_dv_set(swigCPtr, this, value);
  }

  public int getDv() {
    return arbJNI.acb_dft_naive_struct_dv_get(swigCPtr, this);
  }

  public void setZclear(int value) {
    arbJNI.acb_dft_naive_struct_zclear_set(swigCPtr, this, value);
  }

  public int getZclear() {
    return arbJNI.acb_dft_naive_struct_zclear_get(swigCPtr, this);
  }

  public void setZ(Complex value) {
    arbJNI.acb_dft_naive_struct_z_set(swigCPtr, this, Complex.getCPtr(value), value);
  }

  public Complex getZ() {
    long cPtr = arbJNI.acb_dft_naive_struct_z_get(swigCPtr, this);
    return (cPtr == 0) ? null : new Complex(cPtr, false);
  }

  public void setDz(int value) {
    arbJNI.acb_dft_naive_struct_dz_set(swigCPtr, this, value);
  }

  public int getDz() {
    return arbJNI.acb_dft_naive_struct_dz_get(swigCPtr, this);
  }

  public acb_dft_naive_struct() {
    this(arbJNI.new_acb_dft_naive_struct(), true);
  }

}
