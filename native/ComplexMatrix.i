%typemap(javaimports) acb_mat_struct %{
import static arb.arblib.acb_mat_clear;
import static arb.arblib.acb_mat_init;
%}

%typemap(javafinalize) acb_mat_struct ""
%typemap(javainterfaces) acb_mat_struct "AutoCloseable"

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
%typemap(javacode) acb_mat_struct %{

  /**
   * Calls {@link arb#acb_mat_clear(ComplexMatrix)}
   * @return this
   */
  public ComplexMatrix clear()
  {
    if ( swigCMemOwn )
    {
      acb_mat_clear(this);
    }
    
    return this;
  }

  @Override
  public void close()
  { 
      clear();
  }
  
  public ComplexMatrix init(int rows, int cols)
  {
    acb_mat_init(this, rows, cols);
    return this;
  } 
  
%};




