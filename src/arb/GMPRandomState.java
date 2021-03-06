/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class GMPRandomState {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  public GMPRandomState(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(GMPRandomState obj) {
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
        arbJNI.delete_GMPRandomState(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setSeed(MultiplePrecisionInteger value) {
    arbJNI.GMPRandomState_seed_set(swigCPtr, this, MultiplePrecisionInteger.getCPtr(value), value);
  }

  public MultiplePrecisionInteger getSeed() {
    long cPtr = arbJNI.GMPRandomState_seed_get(swigCPtr, this);
    return (cPtr == 0) ? null : new MultiplePrecisionInteger(cPtr, false);
  }

  public void setAlgorithm(RandomAlgorithm value) {
    arbJNI.GMPRandomState_algorithm_set(swigCPtr, this, value.swigValue());
  }

  public RandomAlgorithm getAlgorithm() {
    return RandomAlgorithm.swigToEnum(arbJNI.GMPRandomState_algorithm_get(swigCPtr, this));
  }

  public RandomAlgorithmData getAlgorithmData() {
    long cPtr = arbJNI.GMPRandomState_algorithmData_get(swigCPtr, this);
    return (cPtr == 0) ? null : new RandomAlgorithmData(cPtr, false);
  }

  public GMPRandomState() {
    this(arbJNI.new_GMPRandomState(), true);
  }

}
