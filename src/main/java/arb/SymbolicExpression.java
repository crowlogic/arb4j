/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.2.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class SymbolicExpression {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public SymbolicExpression(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(SymbolicExpression obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  @SuppressWarnings({"deprecation", "removal"})
  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_SymbolicExpression(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setData(long value) {
    arblibJNI.SymbolicExpression_data_set(swigCPtr, this, value);
  }

  public long getData() {
    return arblibJNI.SymbolicExpression_data_get(swigCPtr, this);
  }

  public SymbolicExpression() {
    this(arblibJNI.new_SymbolicExpression(), true);
  }

}
