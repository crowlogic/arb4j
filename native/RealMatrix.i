%typemap(javaimports) arb_mat_struct %{
import static arb.RealConstants.*;
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


  /**
   * Computes the Cholesky decomposition of A. Returning the factor matrix iff the
   * symmetric matrix defined by the lower triangular part of this is certainly
   * positive definite then the result is set to the lower triangular matrix such
   * that this=result*conjugateTranspose(result)
   * 
   * @param prec
   * @param result
   * @return null if {@link arb#arb_mat_cho(RealMatrix, RealMatrix, int)} returned
   *         0 indicating either the matrix is not symmetric positive definite,
   *         the input matrix was computed to insufficient precision, or the
   *         decomposition was attempted at insufficient precision 0
   */
  public RealMatrix chol(int prec, RealMatrix result)
  {
    if (arb.arb_mat_cho(result, this, prec) == 0)
    {
      return null;
    }
    else
    {
      return result;
    }
  }
  
    
      
%};




