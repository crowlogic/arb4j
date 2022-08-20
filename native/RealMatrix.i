%typemap(javaimports) arb_mat_struct %{
import java.io.*;
import java.util.function.*;
import java.util.stream.*;

import dnl.utils.text.table.*;
%}

%typemap(javafinalize) arb_mat_struct ""
%typemap(javainterfaces) arb_mat_struct "AutoCloseable"

%typemap(javacode) arb_mat_struct %{

  /**
   * @see arb#arb_mat_zero(RealMatrix)
   * 
   * @return this
   */
  public RealMatrix zero()
  {
    arb.arb_mat_zero(this);
    return this;
  }

  /**
   * Puts 1s on the diagonal and zeros everywhere else
   * 
   * @see arb#arb_mat_one(RealMatrix)
   * 
   * @return this
   */
  public RealMatrix identity()
  {
    arb.arb_mat_one(this);
    return this;
  }

  /**
   * @see arb#arb_mat_overlaps(RealMatrix, RealMatrix)
   * @param other
   * @return
   */
  public boolean overlaps(RealMatrix other)
  {
    return arb.arb_mat_overlaps(this, other) != 0;
  }

  /**
   * @see arb#arb_mat_contains(RealMatrix, RealMatrix)
   * @param other
   * @return
   */
  public boolean contains(RealMatrix other)
  {
    return arb.arb_mat_overlaps(this, other) != 0;
  }


  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof RealMatrix))
    {
      return false;
    }
    RealMatrix other = (RealMatrix)obj;
    return arb.arb_mat_eq(this, other) != 0;    
  }


 /**
   * Accessor for the i,j-th element
   * 
   * @param i
   * @param j
   * @return {@link arb#arb_mat_entry_ptr(RealMatrix, int, int)}
   */
  public Real get(int i, int j)
  {
    return arb.arb_mat_entry_ptr(this, i,j);
  }

  public String name;
  
  @Override
  public String toString()
  {
    Object[][] strings    = new String[this.getRows()][this.getCols()];
    int        maxLength  = 0;
    int        maxDecimal = 0;
    for (int i = 0; i < Math.min(100, this.getRows()); ++i)
    {
      for (int j = 0; j < this.getCols(); ++j)
      {
        String string  = get(i, j).toFixedString();
        int    decimal = string.indexOf(46);
        if (decimal > maxDecimal)
        {
          maxDecimal = decimal;
        }
        if (string.length() > maxLength)
        {
          maxLength = string.length();
        }
        strings[i][j] = string;
      }
    }
    maxLength += 2;
    IntFunction<String>   func  = k -> k == 0 ? (name == null ? "" : name) + " " + k : "" + k;
    TextTable             table = new TextTable( IntStream.range(0, this.getCols())
                                                          .mapToObj(func)
                                                          .collect(Collectors.toList())
                                                          .stream()
                                                          .toArray(size -> new String[size]),
                                                strings);
    ByteArrayOutputStream os    = new ByteArrayOutputStream();
    PrintStream           ps    = new PrintStream(os);
    StringBuffer          sb    = new StringBuffer();
    table.setAddRowNumbering(true);
    table.printTable(ps, 0);
    ps.close();
    try
    {
      return os.toString("UTF8");
    }
    catch (UnsupportedEncodingException e)
    {
      e.printStackTrace(System.err);
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
  }

  private String getDimString()
  {
    String dimString = "(" + this.getRows() + "," + this.getCols() + ")";
    return dimString;
  }
  
 public static RealMatrix newMatrix( int rows, int cols )
  {
    RealMatrix m = new RealMatrix();
    m.init(rows, cols);
    return m;
  }

  /**
   * @see arb#arb_mat_transpose(RealMatrix, RealMatrix)
   * 
   * @param result
   * @return result
   */  
  public RealMatrix transpose(RealMatrix result)
  {
    arb.arb_mat_transpose(result, this);
    return result;
  }
  
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

  /**
   * @see arb#arb_mat_mul(RealMatrix, RealMatrix, RealMatrix, int)
   * @param x
   * @param prec
   * @param result
   * @return result
   */
  public RealMatrix mul(RealMatrix x, int prec, RealMatrix result)
  {
    arb.arb_mat_mul(result, this, x, prec);
    return result;
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




