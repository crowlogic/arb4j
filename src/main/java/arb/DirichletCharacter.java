/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (https://www.swig.org).
 * Version 4.2.0
 *
 * Do not make changes to this file unless you know what you are doing - modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package arb;

import static arb.arblib.*;

public class DirichletCharacter implements AutoCloseable {
  protected long swigCPtr;
  protected boolean swigCMemOwn;

  public DirichletCharacter(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr(DirichletCharacter obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        arblibJNI.delete_DirichletCharacter(swigCPtr);
      }
      swigCPtr = 0;
    }
  }


  /**
   * Calls {@link arb#dirichlet_char_clear(DirichletCharacter)}
   * @return this
   */
  public DirichletCharacter clear()
  {
    if ( swigCMemOwn )
    {
      dirichlet_char_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  { 
      clear();
  }
  
  /**
   * 
   * Initializes {@link DirichletCharacter} and sets its value to the principal character of a specified {@link DirichletGroup} G 
   *
   * @return this
   *
   * @param group the {@link DirichletGroup} 
   * 
   * @return this
   */
  public DirichletCharacter init(DirichletGroup group)
  {
    dirichlet_char_init(this, group);
    return this;
  }
    

  public void setN(long value) {
    arblibJNI.DirichletCharacter_n_set(swigCPtr, this, value);
  }

  public long getN() {
    return arblibJNI.DirichletCharacter_n_get(swigCPtr, this);
  }

  public DirichletCharacter() {
    this(arblibJNI.new_DirichletCharacter(), true);
  }

}