/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.3.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

public class RandomState implements AutoCloseable {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public RandomState(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(RandomState obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_RandomState(swigCPtr);
      }
      swigCPtr = 0;
    }
  }


 static
 {
   System.loadLibrary( "arblib" );
 }

  @Override
  public void close() throws Exception
  {
    delete();
  }

  public RandomState initialize()
  {
    arblib.gmp_randinit_default(getGmpRandomState());
    setInitialized(1);
    return this;
  }
  
  public RandomState seed(long seed)
  {
    arblib.gmp_randseed_ui(getGmpRandomState(), seed);
    return this;
  }  
     

  public void setGmpRandomState(GMPRandomState value) {
    arblibJNI.RandomState_gmpRandomState_set(swigCPtr, this, GMPRandomState.getCPtr(value), value);
  }

  public GMPRandomState getGmpRandomState() {
    long cPtr = arblibJNI.RandomState_gmpRandomState_get(swigCPtr, this);
    return (cPtr == 0) ? null : new GMPRandomState(cPtr, false);
  }

  public void setInitialized(int value) {
    arblibJNI.RandomState_initialized_set(swigCPtr, this, value);
  }

  public int getInitialized() {
    return arblibJNI.RandomState_initialized_get(swigCPtr, this);
  }

  public void setRandomValue(long value) {
    arblibJNI.RandomState_randomValue_set(swigCPtr, this, value);
  }

  public long getRandomValue() {
    return arblibJNI.RandomState_randomValue_get(swigCPtr, this);
  }

  public void setRandomValue2(long value) {
    arblibJNI.RandomState_randomValue2_set(swigCPtr, this, value);
  }

  public long getRandomValue2() {
    return arblibJNI.RandomState_randomValue2_get(swigCPtr, this);
  }

  public RandomState() {
    this(arblibJNI.new_RandomState(), true);
  }

}
