%typemap(javaimports) acb_mat_struct %{
import static arb.RealConstants.*;
%}

%typemap(javafinalize) acb_mat_struct ""
%typemap(javainterfaces) acb_mat_struct "AutoCloseable"

%typemap(javacode) acb_mat_struct %{

  /**
   * Calls {@link arb#acb_mat_clear(ComplexMatrix)}
   * @return this
   */
  public ComplexMatrix clear()
  {
    if ( swigCMemOwn )
    {
      arb.acb_mat_clear(this);
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
    arb.acb_mat_init(this, rows, cols);
    return this;
  } 
  
%};




