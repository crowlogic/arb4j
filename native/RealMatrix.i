%typemap(javaimports) arb_mat_struct %{
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SegmentScope;
import java.nio.ByteOrder;
import java.nio.LongBuffer;
import java.util.Iterator;
import java.util.function.IntFunction;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import static arb.arblib.*;

import dnl.utils.text.table.TextTable;
%}

%typemap(javafinalize) arb_mat_struct ""
%typemap(javainterfaces) arb_mat_struct "AutoCloseable,Iterable<Real>"

%typemap(javacode) arb_mat_struct %{
  static { System.loadLibrary( "arblib" ); }

  public Real getRow(int i)
  {
    return rows[i];
  }  
  
  private LongBuffer rowPointers;

  public RealMatrix mul(Real k, int bits, RealMatrix result)
  {
    assert false : "TODO: multiply the elements of the matrix by a scalar and return the result";
    return result;
  }

  public RealMatrix sub(RealMatrix iI, int bits, RealMatrix result)
  {
    assert false : "TODO: implement matrix subtraction";
    return result;
  }
  
  public Real copyCol(int j, Real result )
  {
    assert result.dim == getNumRows();
    for ( int i = 0; i < getNumRows(); i++ )
    {
      result.get(i).set(get(i, j));
    }
   return result;   
  }
    
  @Override
  public Iterator<Real> iterator()
  {
    final int rowCount = getNumRows();

    return new Iterator<Real>()
    {
      int       i        = 0;

      @Override
      public boolean hasNext()
      {
        return i < rowCount;
      }

      @Override
      public Real next()
      {
        return RealMatrix.this.getRow(i++);
      }
    };
  }
  
  /**
   * Sets det to the determinant of the matrix A.
   * 
   * The lu version uses Gaussian elimination with partial pivoting. If at some
   * point an invertible pivot element cannot be found, the elimination is stopped
   * and the magnitude of the determinant of the remaining submatrix is bounded
   * using Hadamard’s inequality.
   * 
   * The precond version computes an approximate LU factorization of A and
   * multiplies by the inverse L and U martices as preconditioners to obtain a
   * matrix close to the identity matrix [Rum2010]. An enclosure for this
   * determinant is computed using Gershgorin circles. This is about four times
   * slower than direct Gaussian elimination, but much more numerically stable.
   * 
   * This function automatically selects between the lu and precond versions and
   * additionally handles small or triangular matrices by direct formulas.
   * 
   * @see arb#arb_mat_det(Real, RealMatrix, int)
   * @param bits
   * @param result
   * @return result after having been assigned the determinant
   */
  public Real determinant(int bits, Real result)

  {
    arb_mat_det(result, this, bits);
    return result;
  }

  /**
   * Sets where is a square matrix, computed by solving the system
   * 
   * X = A^(-1)
   * 
   * If cannot be inverted numerically (indicating either that is singular or that
   * the precision is insufficient), the values in the output matrix are left
   * undefined and zero is returned. A nonzero return value guarantees that the
   * matrix is invertible and that the exact inverse is contained in the output.
   * 
   * @see arb#arb_mat_inv(RealMatrix, RealMatrix, int)
   * 
   * @param bits
   * @param result
   * @return
   */
  public RealMatrix inverse(int bits, RealMatrix result)

  {
    arb_mat_inv(result, this, bits);
    return result;
  }  
  
  /**
   * @see arb#arb_mat_zero(RealMatrix)
   * 
   * @return this
   */
  public RealMatrix zero()
  {
    arb_mat_zero(this);
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
    arb_mat_one(this);
    return this;
  }

  /**
   * @see arb#arb_mat_overlaps(RealMatrix, RealMatrix)
   * @param other
   * @return
   */
  public boolean overlaps(RealMatrix other)
  {
    return arb_mat_overlaps(this, other) != 0;
  }

  /**
   * @see arb#arb_mat_contains(RealMatrix, RealMatrix)
   * @param other
   * @return
   */
  public boolean contains(RealMatrix other)
  {
    return arb_mat_contains(this, other) != 0;
  }


  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof RealMatrix))
    {
      return false;
    }
    RealMatrix other = (RealMatrix)obj;
    return arb_mat_eq(this, other) != 0;    
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
    return arb_mat_entry_ptr(this, i,j);
  }

  public String name;
  
  @Override
  public String toString()
  {
    int rowCount = Math.min(100, getNumRows());
    int colCount = Math.min(100, getNumCols());
    Object[][] strings    = new String[rowCount][colCount];
    int        maxLength  = 0;
    int        maxDecimal = 0;
    for (int i = 0; i < rowCount; ++i)
    {
      for (int j = 0; j < getNumCols(); ++j)
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
    IntFunction<String>   func  = k -> "" + k;
    TextTable             table = new TextTable(IntStream.rangeClosed(1, getNumCols())
                                                         .mapToObj(func)
                                                         .collect(Collectors.toList())
                                                         .stream()
                                                         .toArray(size -> new String[size]),
                                                strings);
    ByteArrayOutputStream os    = new ByteArrayOutputStream();
    PrintStream           ps    = new PrintStream(os);

    table.setAddRowNumbering(true);
    table.printTable(ps, 0);
    ps.flush();
    String string = (name != null ? name + "=\n" : "") + os.toString();
    return string;
  }  
  private String getDimString()
  {
    String dimString = "(" + this.getNumRows() + "," + this.getNumCols() + ")";
    return dimString;
  }
  
  Real[] rows;
  
  public static RealMatrix newMatrix(int rows, int cols)
  {
    RealMatrix m = new RealMatrix();
    m.init(rows, cols);

    m.rows = new Real[rows];
    MemorySegment ms = MemorySegment.ofAddress(m.getRowPointers(), rows * 8, SegmentScope.auto());

    m.rowPointers = ms.asByteBuffer().order(ByteOrder.nativeOrder()).asLongBuffer();
    m.rows        = new Real[rows];
    for (int i = 0; i < rows; i++)
    {
      m.rows[i]          = new Real(m.rowPointers.get(i),
                                    false);
      m.rows[i].elements = new Real[m.rows[i].dim = cols];
    }
    return m;
  }
  
  /**
   * @see arb#arb_mat_inv(RealMatrix, RealMatrix, int)
   * @param prec
   * @param result
   * @return result
   */
  public RealMatrix inv(int prec, RealMatrix result)
  {
    if (arb_mat_inv(result, this, prec) == 0)
    {
      return null;
    }
    else
    {
      result.name = "inv" + (name != null ? name : "");
      return result;
    }
  }

  
  /**
   * @see arb#arb_mat_transpose(RealMatrix, RealMatrix)
   * 
   * @param result
   * @return result
   */  
  public RealMatrix transpose(RealMatrix result)
  {
    arb_mat_transpose(result, this);
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
      arb_mat_clear(this);
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
    arb_mat_mul(result, this, x, prec);
    return result;
  }

  @Override
  public void close()
  { 
      clear();
  }
  
  
  public RealMatrix init(int rows, int cols)
  {
    arb_mat_init(this, rows, cols);
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
    if (arb_mat_cho(result, this, prec) == 0)
    {
      return null;
    }
    else
    {
      result.name = "√" + ( name != null ? name : "");
      return result;
    }
  }  
  
  /**
   * 
   * @return numRows == numCols
   */
  public boolean isSquare()
  {
    return getNumRows() == getNumCols();
  }

  public Real diag()
  {
    assert false : "todo";
    return null;
  }  
    
      
%};




