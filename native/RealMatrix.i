%typemap(javaimports) arb_mat_struct %{

import static arb.arblib.*;
import static java.lang.String.format;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.lang.foreign.MemorySegment;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.LongBuffer;
import java.util.Iterator;
import java.util.function.IntFunction;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import arb.utensils.text.tables.TextTable;
import arb.algebra.Ring;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}
%typemap(javafinalize) arb_mat_struct ""
%typemap(javainterfaces) arb_mat_struct "AutoCloseable,Iterable<Real>,Ring<RealMatrix>,Becomable<RealMatrix>"

%typemap(javacode) arb_mat_struct %{
  static { System.loadLibrary( "arblib" ); }

  public RealMatrix set(int i, int j, Integer l)
  {
    get(i, j).set(l);
    return this;
  }

  public RealMatrix set(Integer integer)
  {
    if (getNumRows() != 1 || getNumCols() != 1)
    {
      become(RealMatrix.newMatrix(1, 1));
    }
    return set(0, 0, integer);
  }

  public RealMatrix set(RealMatrix that)
  {
    if (getNumRows() != that.getNumRows() || getNumCols() != that.getNumCols())
    {
      become(RealMatrix.newMatrix(that.getNumRows(), that.getNumCols()));
    }
    arblib.arb_mat_set(this, that);
    return this;
  }
    
  @Override
  public RealMatrix become(RealMatrix that)
  {
    close();
    this.rows           = that.rows;
    this.printPrecision = that.printPrecision;
    this.diagonal       = that.diagonal;
    swigCPtr            = that.swigCPtr;
    swigCMemOwn         = that.swigCMemOwn;
    name                = that.name;
    that.swigCMemOwn    = false;
    return this;
  }

  public RealMatrix add(Integer operand, int prec, RealMatrix result)
  {
    for ( Real row : rows )
    {
      row.add(operand,prec);
    }
    return this;
  }
  
  /**
   * Solve this*result=that, in other words this=A, result=X and that=B
   * 
   * @param that   B
   * @param bits   precision
   * @param result X
   * 
   * @return result after setting its value such that it is the solution to
   *         this*result=that
   */
  public RealMatrix solve(RealMatrix that, int bits, RealMatrix result)
  {
    arblib.arb_mat_solve(result, this, that, bits);
    return result;
  }
  
  @Override
  public RealMatrix div(RealMatrix j, int prec, RealMatrix result)
  {
    assert false : "todo: division";
    return null;
  }
  
  @SuppressWarnings("unchecked")
  public RealMatrix setName(String string)
  {
    this.name = string;
    return this;
  }

  public Real getRow(int i)
  {
    if ( rows == null )
    {
      initRows();
    }
  
    return rows[i];
  }  

  public long getRowPointer(int i)
  {
    return rows[i].swigCPtr;
  }      
  
  private void initRows() {
    if (rows == null) {
      rows = new Real[getNumRows()];
    }
    
    for (int i = 0; i < getNumRows(); i++) {
      // Use FLINT's arb_mat_entry_ptr to get correct pointer
      Real rowEntry = arblib.arb_mat_entry_ptr(this, i, 0);
      long rowPtr = rowEntry.swigCPtr;
      
      if (rows[i] == null) {
        rows[i] = new Real(rowPtr, false);
      } else {
        rows[i].swigCPtr = rowPtr;
      }
      rows[i].elements = new Real[rows[i].dim = getNumCols()];
    }
  }

  
  /**
   * Apply this{@link #swapRows(LongBuffer, int, int)} to each element of a permutation array
   * 
   * @param permutation
   * @return this after being permuted
   */
  public RealMatrix permute(LongBuffer permutation)
  {
    final int n = permutation.capacity();
    assert n == getNumRows() : String.format("length of permutation array = %d != numRows = %d\n", n, getNumRows() );
    for (int i = 0; i < n; i++)
    {
      int j = (int) permutation.get(i);
      assert j >= 0 && j < n : String.format("permutation[%d]=%d out of range, this.numRows=%d", j, n );
      swapRows(permutation, i, j);
    }
    return this;
  }
    
  /**
   * Multiplies each element of this matrix by a {@link Real} scalar
   * 
   * @param scalar
   * @param bits
   * @param result
   * @return
   */
  public RealMatrix mul(Real scalar, int bits, RealMatrix result)
  {
    assert getNumRows() == result.getNumRows() : String.format("this.numRows=%d != that.numRows = %d\n",
                                                               getNumRows(),
                                                               result.getNumRows());
    assert getNumCols() == result.getNumCols() : String.format("this.numCols=%d != that.numCols = %d\n",
                                                               getNumCols(),
                                                               result.getNumCols());

    arblib.arb_mat_scalar_mul_arb(result, this, scalar, bits);
    return result;
  }

  /**
   * Sets res to the sum of this and that. The operands must have the same
   * dimensions.
   * 
   * @param that
   * @param bits
   * @param result
   * @return result 
   */
  public RealMatrix add(RealMatrix that, int bits, RealMatrix result)
  {
    assert getNumRows() == that.getNumRows() : String.format("this.numRows=%d != that.numRows = %d\n",
                                                             getNumRows(),
                                                             that.getNumRows());
    assert getNumCols() == that.getNumCols() : String.format("this.numCols=%d != that.numCols = %d\n",
                                                             getNumCols(),
                                                             that.getNumCols());

    arblib.arb_mat_add(result, this, that, bits);
    return result;
  }
  
  /**
   * Sets res to the difference of this and that. The operands must have the same
   * dimensions.
   * 
   * @param that
   * @param bits
   * @param result
   * @return result 
   */
  public RealMatrix sub(RealMatrix that, int bits, RealMatrix result)
  {
    assert getNumRows() == that.getNumRows() : String.format("this.numRows=%d != that.numRows = %d\n",
                                                             getNumRows(),
                                                             that.getNumRows());
    assert getNumCols() == that.getNumCols() : String.format("this.numCols=%d != that.numCols = %d\n",
                                                             getNumCols(),
                                                             that.getNumCols());

    arblib.arb_mat_sub(result, this, that, bits);
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
   * Calculates the determinant of this matrix A
   * 
   * The lu version uses Gaussian elimination with partial pivoting. If at some
   * point an invertible pivot element cannot be found, the elimination is stopped
   * and the magnitude of the determinant of the remaining submatrix is bounded
   * using Hadamard’s inequality.
   * 
   * The preconditioned version computes an approximate LU factorization of A and
   * multiplies by the inverse L and U matrices as preconditioners to obtain a
   * matrix close to the identity matrix. An enclosure for this determinant is
   * computed using Gershgorin circles, a process that is about four times slower
   * than direct Gaussian elimination, but much more numerically stable.
   * 
   * This function automatically selects between the lu and preconditioned
   * versions and additionally handles small or triangular matrices by direct
   * formulas.
   * 
   * @see arb#arb_mat_det(Real, RealMatrix, int)
   * @param bits   precision
   * @param result the {@link Real} result variable to be assigned the value of
   *               the determinant
   * @return result after having been assigned the determinant
   */
  public Real determinant(int bits, Real result)

  {
    arb_mat_det(result, this, bits);
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

  public RealMatrix set(int i, int j, Real real)
  {
   get(i,j).set(real);
   return this;    
  }

  public RealMatrix set(int i, int j, long l)
  {
    get(i, j).set(l);
    return this;
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
    return getRow(i).get(j);
  }

  public String name;
  
  boolean printPrecision = false;
  
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
        Real x = get(i, j);
        String string  = printPrecision ? x.toString() : x.toFixedString();
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
    
  Real[] rows;
  
  public static RealMatrix newMatrix(int rows, int cols)
  {
    RealMatrix m = new RealMatrix();
    m.init(rows, cols);
    m.rows = new Real[rows];
    m.initRows();
    return m;
  }
  
  /**
   * Sets the result to the inverse of this (square) matrix, computed by solving the system
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
  public RealMatrix inverse(int prec, RealMatrix result)
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
   * @param transposed
   * @return result
   */
  public RealMatrix transpose(RealMatrix transposed)
  {
    assert getNumRows() == transposed.getNumCols() : String.format("this.numRows = %d != transposed.numCols = %d\n",
                                                                   this.getNumRows(),
                                                                   transposed.getNumCols());
    assert getNumCols() == transposed.getNumRows() : String.format("this.numCols = %d != transposed.numRows = %d\n",
                                                                   this.getNumCols(),
                                                                   transposed.getNumRows());

    arb_mat_transpose(transposed, this);
    return transposed;
  }
  
  /**
   * Swaps two rows of this matrix.
   *
   * This method swaps the rows indexed by {@code r} and {@code s} in this matrix.
   * If a {@code permutations} buffer is provided, it also records the swap in
   * this buffer. The method is designed to be efficient and only performs the
   * swap if {@code r} and {@code s} are different. After the swap, the method
   * returns this matrix with the updated row order.
   *
   * Note: This method uses assertions to check the validity of the indices and
   * the size of the permutations buffer. Assertions need to be enabled at runtime
   * for these checks to take effect.
   *
   * @param permutations An optional buffer of permutations. If non-null, the
   *                     method records the swap in this buffer. The buffer should
   *                     have at least as many elements as there are rows in the
   *                     matrix. Each element in the buffer represents a row
   *                     index, and the value at each position indicates where the
   *                     original row has been moved to after a series of swaps.
   * @param r            The index of the first row to swap. Must be a valid index
   *                     within the matrix.
   * @param s            The index of the second row to swap. Must be a valid
   *                     index within the matrix.
   * @return The {@code RealMatrix} object with the rows swapped, allowing for
   *         method chaining.
   */
  public RealMatrix swapRows(LongBuffer permutations, int r, int s)
  {
    int numRows = getNumRows();
    assert r >= 0 && r < numRows : "Row index r (" + r + ") is out of bounds. Valid range: [0, " + (numRows - 1)
                  + "].";
    assert s >= 0 && s < numRows : "Row index s (" + s + ") is out of bounds. Valid range: [0, " + (numRows - 1)
                  + "].";
    assert permutations == null || permutations.capacity() >= numRows : "Permutations buffer size ("
                  + (permutations != null ? permutations.capacity() : "null")
                  + ") is smaller than the number of rows (" + numRows + ").";
    Real rPtr = rows[r];
    rows[r] = rows[s];
    rows[s] = rPtr;
    arblib.arb_mat_swap_rows(this, permutations, r, s);
    return this;
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
   * <pre>
   * Sets res to the matrix product of mat1 and mat2. The operands must have
   * compatible dimensions for matrix multiplication.
   * 
   * The classical version performs matrix multiplication in the trivial way.
   * 
   * The block version decomposes the input matrices into one or several blocks of
   * uniformly scaled matrices and multiplies large blocks via fmpz_mat_mul. It
   * also invokes _arb_mat_addmul_rad_mag_fast() for the radius matrix
   * multiplications.
   * 
   * The threaded version performs classical multiplication but splits the
   * computation over the number of threads returned by flint_get_num_threads().
   * </pre>
   * 
   * The {@link arblib#arb_mat_mul(RealMatrix, RealMatrix, RealMatrix, int)}
   * function chooses an algorithm automatically.
   * 
   * @param that
   * @param bits   precision
   * @param result
   * @return result set to this*that
   */
  public RealMatrix mul(RealMatrix that, int bits, RealMatrix result)
  {
    assert getNumCols() == that.getNumRows() : String.format("this matrix col count does %d not match right matrix row count %d",
                                                             getNumCols(),
                                                             that.getNumRows());
    assert getNumRows() == result.getNumRows() : String.format("Result matrix row count does %d not match left matrix row count %d",
                                                               getNumRows(),
                                                               result.getNumRows());
    assert that.getNumCols() == result.getNumCols() : String.format("this matrix col count does %d not match right matrix row count %d",
                                                                    that.getNumCols(),
                                                                    result.getNumCols());

    arb_mat_mul(result, this, that, bits);
    return result;
  }

  @Override
  public void close()
  { 
      clear();
      swigCMemOwn = false;
      swigCPtr = 0;
  }
  
  public RealMatrix init(int rows, int cols)
  {
    arb_mat_init(this, rows, cols);
    return this;
  } 

  /**
   * Computes the LU factorization of this {@link RealMatrix} using Gaussian
   * elimination with partial pivoting. <br><br>
   * The input and result output matrices can be the same, thus providing for
   * in-place factorization.<br><br>
   * 
   * LU decomposition, n. (of a square matrix A) a factorization A = LU where L
   * and U are respectively lower- and upper-triangular. <br><br>
   * 
   * Although not every square matrix has an LU decomposition, one may always
   * write A = PLU, where P is a permutation matrix, L is nonsingular and
   * lower-triangular, and U is upper-triangular. <br><br>
   * 
   * A non-singular square matrix has an LU decomposition if and only if all its
   * leading principal minors are nonzero. <br><br>
   * 
   * If A is nonsingular and has an LU decomposition, then A = L'DU', where all of
   * the main diagonal entries of the lower triangular matrix L' are equal to 1,
   * U' is upper triangular, and each of the main diagonal entries of the diagonal
   * matrix D is equal to the corresponding leading principal minor of A; the
   * factors L', D, and U' are unique. <br><br>
   * 
   * If the return value is null then one of 3 things could be the reason:<br>
   * 
   * <ul>
   * <li>the matrix is singular</li>
   * <li>the input matrix was computed to insufficient precision</li>
   * <li>the LU factorization was attempted at insufficient precision</li>
   * </ul>
   * 
   * Currently only the default version which chooses an algorithm automatically
   * is wrapped
   * 
   * @param permutation row index in the input matrix corresponding to row in the
   *                    output matrix
   * @param bits        number of bits of precision with which to perform the
   *                    calculations
   * @param result      is populated with the LU factorization of this matrix if
   *                    non-zero and thus invertible pivots can be found, thus
   *                    guaranteeing that this matrix is invertible. If invertible
   *                    pivot elements cannot be found then null is returned and
   *                    the permutations entries are unmodified.
   * 
   * @return result if this matrix is invertible otherwise null
   */
  public RealMatrix computeLowerUpperFactorization(LongBuffer permutation, int bits, RealMatrix result)
  {
    if (arblib.arb_mat_lu(permutation, result, this, bits) != 0)
    {
      result.name = "lu_" + (name != null ? name : "");
      result.initRows();
      return result;
    }
    else
    {
      return null;
    }
  }
  
 /**
   * Calls
   * this{@link #computeLowerUpperFactorization(int, RealMatrix, RealMatrix)} but
   * applies a sequence of this{@link #swapRows(LongBuffer, int, int)} operations
   * to put the matrix back into its natural order that was modified by arb_mat_lu
   * before returning
   * 
   * @param bits
   * @param lowerFactor the {@link RealMatrix} to be set to the lower factor
   * @param upperFactor the {@link RealMatrix} to be set to the upper factor
   * @return this
   */
  public RealMatrix computeLowerUpperFactorization(int bits, RealMatrix lowerFactor, RealMatrix upperFactor)
  {
    assert lowerFactor.getNumRows() == upperFactor.getNumRows() : format("lowerFactor.numRows = %d != upperFactor.numRows = %d\n",
                                                                         lowerFactor.getNumRows(),
                                                                         upperFactor.getNumCols());
    assert lowerFactor.getNumCols() == upperFactor.getNumCols() : format("lowerFactor.numRows = %d != upperFactor.numRows = %d\n",
                                                                         lowerFactor.getNumRows(),
                                                                         upperFactor.getNumCols());
    final int  n             = lowerFactor.getNumRows();

    LongBuffer permutation   = ByteBuffer.allocateDirect(n * Long.BYTES)
                                         .order(ByteOrder.nativeOrder())
                                         .asLongBuffer();

    RealMatrix factorization = computeLowerUpperFactorization(permutation, bits, upperFactor);

    factorization.extractUpperAndLowerTriangularMatrices(lowerFactor, upperFactor);

    lowerFactor.permute(permutation);
    upperFactor.permute(permutation);

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

  private Real diagonal = null;

  public Real diag()
  {
    assert isSquare() : "diag() is not well-defined for non-square matrices";
    if (diagonal == null || diagonal.size() != getNumRows())
    {
      if (diagonal != null)
      {
        diagonal.close();
      }
      diagonal = Real.newVector(getNumRows());
      IntStream.range(0, getNumCols()).forEach(i -> diagonal.set(i,get(i, i)));
    }
    return diagonal;
  }

  /**
   * Extracts the upper and lower triangular matrices from this square matrix.
   * <p>
   * This method fills the provided matrices L (lower triangular) and U (upper triangular)
   * with the corresponding elements from this matrix. The diagonal elements of L are set to 1,
   * and the rest of the elements in L and U are filled based on their position relative to the diagonal.
   * The method asserts that this matrix is square.
   * </p>
   *
   * @param L The matrix to be filled with the lower triangular part of this matrix.
   * @param U The matrix to be filled with the upper triangular part of this matrix.
   * @return this
   * @throws AssertionError If this matrix is not square.
   */    
  public RealMatrix extractUpperAndLowerTriangularMatrices(  RealMatrix L, RealMatrix U )
  {
    assert isSquare() : "matrix must be square";
    int n = getNumRows();

    L.setName("L_" + name );
    U.setName("U_" + name );  

    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < n; j++)
      {
        if (i > j)
        {
          L.set(i, j, get(i, j));
          U.set(i, j, 0);
        }
        else if (i == j)
        {
          L.set(i, j, 1);
          U.set(i, j, get(i, j));
        }
        else
        {
          L.set(i, j, 0);
          U.set(i, j, get(i, j));
        }
      }
    }
    
    return this;
  }        
  
  /**
   * Sets result to the Frobenius norm (i.e. the square root of the sum of squares
   * of entries) of A. See
   * {@link arblib#arb_mat_frobenius_norm(Real, RealMatrix, int)}
   * 
   * @param bits   of precision
   * @param result the Frobenius norm of this matrix
   * @return the result after it has been assigned the value of the Frobenius norm
   *         of this matrix
   */
  public Real frobeniusNorm(int bits, Real normResult)
  {
    arblib.arb_mat_frobenius_norm(normResult, this, bits);
    return normResult;
  }  
  
  @Override
  public int
         dim()
  {
    return 1;
  }  
%};





