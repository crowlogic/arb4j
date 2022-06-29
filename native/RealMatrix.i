%typemap(javaimports) arb_mat_struct %{
import static arb.Constants.*;
%}

%typemap(javafinalize) arb_mat_struct ""
%typemap(javainterfaces) arb_mat_struct "AutoCloseable"

%typemap(javacode) arb_mat_struct %{

  /**
   * Calls {@link arb#arb_mat_clear(RealMatrix)}
   * @return this
   */
  public RealMatrix clear()
  {
    if ( swigCMemOwn )
    {      
      arb.arb_mat_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  { 
      clear();
  }
  
  
  public RealMatrix init(int rows, int cols)
  {
    arb.arb_mat_init(this, rows, cols);
    return this;
  } 
  
%};




