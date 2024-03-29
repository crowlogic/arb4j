/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.1.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class MantissaPointer {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public MantissaPointer(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(MantissaPointer obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_MantissaPointer(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setD(SWIGTYPE_p_mp_ptr value) {
    arblibJNI.MantissaPointer_d_set(swigCPtr, this, SWIGTYPE_p_mp_ptr.getCPtr(value));
  }

  public SWIGTYPE_p_mp_ptr getD() {
    return new SWIGTYPE_p_mp_ptr(arblibJNI.MantissaPointer_d_get(swigCPtr, this), true);
  }

  public MantissaPointer() {
    this(arblibJNI.new_MantissaPointer(), true);
  }

}
