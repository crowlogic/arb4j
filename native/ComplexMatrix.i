%typemap(javaimports) acb_mat_struct %{
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
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}

%typemap(javafinalize) acb_mat_struct ""
%typemap(javainterfaces) acb_mat_struct "AutoCloseable, Iterable<Complex>, Ring<ComplexMatrix>, Becomable<ComplexMatrix>"


%typemap(javacode) acb_mat_struct %{

  static { System.loadLibrary("arblib"); }

  public ComplexMatrix set(int i, int j, Integer l) {
    get(i, j).set(l);
    return this;
  }

  public ComplexMatrix set(Integer integer) {
    if (getNumRows() != 1 || getNumCols() != 1) {
      become(ComplexMatrix.newMatrix(1, 1));
    }
    return set(0, 0, integer);
  }

  public ComplexMatrix set(ComplexMatrix that) {
    if (getNumRows() != that.getNumRows() || getNumCols() != that.getNumCols()) {
      become(ComplexMatrix.newMatrix(that.getNumRows(), that.getNumCols()));
    }
    arblib.acb_mat_set(this, that);
    return this;
  }
    
  @Override
  public ComplexMatrix become(ComplexMatrix that) {
    close();
    this.rows = that.rows;
    this.rowPointers = that.rowPointers;
    this.printPrecision = that.printPrecision;
    this.diagonal = that.diagonal;
    swigCPtr = that.swigCPtr;
    swigCMemOwn = that.swigCMemOwn;
    name = that.name;
    that.swigCMemOwn = false;
    return this;
  }

  public ComplexMatrix add(Integer operand, int prec, ComplexMatrix result) {
    for (Complex row : rows) {
      row.add(operand, prec);
    }
    return this;
  }
  
  public ComplexMatrix solve(ComplexMatrix that, int bits, ComplexMatrix result) {
    arblib.acb_mat_solve(result, this, that, bits);
    return result;
  }
  
  @Override
  public ComplexMatrix div(ComplexMatrix j, int prec, ComplexMatrix result) {
    assert false : "todo: division";
    return null;
  }
  
  @SuppressWarnings("unchecked")
  public ComplexMatrix setName(String string) {
    this.name = string;
    return this;
  }

  public Complex getRow(int i) {
    if (rows == null) {
      initRows();
    }
    return rows[i];
  }  

  public long getRowPointer(int i) {
    return rows[i].swigCPtr;
  }      
  
  private void initRows() {
    assert rowPointers != null : "rowPointers is null";
    if (rows == null) {
      rows = new Complex[getNumRows()];
    }
    
    for (int i = 0; i < getNumRows(); i++) {
      if (rows[i] == null) {
        rows[i] = new Complex(rowPointers.get(i), false);
      } else {                                   
        rows[i].swigCPtr = rowPointers.get(i);
      }
      rows[i].elements = new Complex[rows[i].dim = getNumCols()];
    }
  }

  public ComplexMatrix permute(LongBuffer permutation) {
    final int n = permutation.capacity();
    assert n == getNumRows() : String.format("length of permutation array = %d != numRows = %d\n", n, getNumRows());
    for (int i = 0; i < n; i++) {
      int j = (int) permutation.get(i);
      assert j >= 0 && j < n : String.format("permutation[%d]=%d out of range, this.numRows=%d", j, n);
      swapRows(permutation, i, j);
    }
    return this;
  }
    
  LongBuffer rowPointers;

  public ComplexMatrix mul(Complex scalar, int bits, ComplexMatrix result) {
    assert getNumRows() == result.getNumRows() : String.format("this.numRows=%d != that.numRows = %d\n", getNumRows(), result.getNumRows());
    assert getNumCols() == result.getNumCols() : String.format("this.numCols=%d != that.numCols = %d\n", getNumCols(), result.getNumCols());

    arblib.acb_mat_scalar_mul_acb(result, this, scalar, bits);
    return result;
  }

  public ComplexMatrix add(ComplexMatrix that, int bits, ComplexMatrix result) {
    assert getNumRows() == that.getNumRows() : String.format("this.numRows=%d != that.numRows = %d\n", getNumRows(), that.getNumRows());
    assert getNumCols() == that.getNumCols() : String.format("this.numCols=%d != that.numCols = %d\n", getNumCols(), that.getNumCols());

    arblib.acb_mat_add(result, this, that, bits);
    return result;
  }
  
  public ComplexMatrix sub(ComplexMatrix that, int bits, ComplexMatrix result) {
    assert getNumRows() == that.getNumRows() : String.format("this.numRows=%d != that.numRows = %d\n", getNumRows(), that.getNumRows());
    assert getNumCols() == that.getNumCols() : String.format("this.numCols=%d != that.numCols = %d\n", getNumCols(), that.getNumCols());

    arblib.acb_mat_sub(result, this, that, bits);
    return result;
  }
  
  public Complex copyCol(int j, Complex result) {
    assert result.dim == getNumRows();
    for (int i = 0; i < getNumRows(); i++) {
      result.get(i).set(get(i, j));
    }
    return result;   
  }
    
  @Override
  public Iterator<Complex> iterator() {
    final int rowCount = getNumRows();

    return new Iterator<Complex>() {
      int i = 0;

      @Override
      public boolean hasNext() {
        return i < rowCount;
      }

      @Override
      public Complex next() {
        return ComplexMatrix.this.getRow(i++);
      }
    };
  }
  
  public Complex determinant(int bits, Complex result) {
    acb_mat_det(result, this, bits);
    return result;
  }
  
  public ComplexMatrix zero() {
    acb_mat_zero(this);
    return this;
  }

  public ComplexMatrix identity() {
    acb_mat_one(this);
    return this;
  }

  public boolean overlaps(ComplexMatrix other) {
    return acb_mat_overlaps(this, other) != 0;
  }

  public boolean contains(ComplexMatrix other) {
    return acb_mat_contains(this, other) != 0;
  }

  @Override
  public boolean equals(Object obj) {
    if (!(obj instanceof ComplexMatrix)) {
      return false;
    }
    ComplexMatrix other = (ComplexMatrix)obj;
    return acb_mat_eq(this, other) != 0;    
  }

  public ComplexMatrix set(int i, int j, Complex complex) {
    get(i, j).set(complex);
    return this;    
  }

  public ComplexMatrix set(int i, int j, long l) {
    get(i, j).set(l);
    return this;
  }
  
  public Complex get(int i, int j) {
    return getRow(i).get(j);
  }

  public String name;
  boolean printPrecision = false;
  
  @Override
  public String toString() {
    int rowCount = Math.min(100, getNumRows());
    int colCount = Math.min(100, getNumCols());
    Object[][] strings = new String[rowCount][colCount];
    int maxLength = 0;
    
    for (int i = 0; i < rowCount; ++i) {
      for (int j = 0; j < colCount; ++j) {
        Complex x = get(i, j);
        String string = printPrecision ? x.toString() : x.toString();
        if (string.length() > maxLength) {
          maxLength = string.length();
        }
        strings[i][j] = string;
      }
    }
    
    maxLength += 2;
    IntFunction<String> func = k -> "" + k;
    TextTable table = new TextTable(IntStream.rangeClosed(1, getNumCols())
                                            .mapToObj(func)
                                            .collect(Collectors.toList())
                                            .stream()
                                            .toArray(size -> new String[size]),
                                    strings);
    ByteArrayOutputStream os = new ByteArrayOutputStream();
    PrintStream ps = new PrintStream(os);
    
    table.setAddRowNumbering(true);
    table.printTable(ps, 0);
    ps.flush();
    String string = (name != null ? name + "=\n" : "") + os.toString();
    return string;
  }  
    
  Complex[] rows;
  
  public static ComplexMatrix newMatrix(int rows, int cols) {
    ComplexMatrix m = new ComplexMatrix();
    m.init(rows, cols);
    m.rows = new Complex[rows];
    m.initRowPointers();
    m.initRows();
    return m;
  }

  public ComplexMatrix initRowPointers() {
    MemorySegment ms = MemorySegment.ofAddress(getRowPointers()).reinterpret(Long.BYTES * rows.length);
    rowPointers = ms.asByteBuffer().order(ByteOrder.nativeOrder()).asLongBuffer();
    return this;
  }
  
  public ComplexMatrix inverse(int prec, ComplexMatrix result) {
    if (acb_mat_inv(result, this, prec) == 0) {
      return null;
    } else {
      result.name = "inv" + (name != null ? name : "");
      return result;
    }
  }
  
  public ComplexMatrix transpose(ComplexMatrix transposed) {
    assert getNumRows() == transposed.getNumCols() : String.format("this.numRows = %d != transposed.numCols = %d\n", this.getNumRows(), transposed.getNumCols());
    assert getNumCols() == transposed.getNumRows() : String.format("this.numCols = %d != transposed.numRows = %d\n", this.getNumCols(), transposed.getNumRows());

    acb_mat_transpose(transposed, this);
    return transposed;
  }
  
  public ComplexMatrix swapRows(LongBuffer permutations, int r, int s) {
    int numRows = getNumRows();
    assert r >= 0 && r < numRows : "Row index r (" + r + ") is out of bounds. Valid range: [0, " + (numRows - 1) + "].";
    assert s >= 0 && s < numRows : "Row index s (" + s + ") is out of bounds. Valid range: [0, " + (numRows - 1) + "].";
    assert permutations == null || permutations.capacity() >= numRows : "Permutations buffer size (" + (permutations != null ? permutations.capacity() : "null") + ") is smaller than the number of rows (" + numRows + ").";
    
    Complex rPtr = rows[r];
    rows[r] = rows[s];
    rows[s] = rPtr;
    arblib.acb_mat_swap_rows(this, permutations, r, s);
    return this;
  }

  public ComplexMatrix mul(ComplexMatrix that, int bits, ComplexMatrix result) {
    assert getNumCols() == that.getNumRows() : String.format("this matrix col count %d does not match right matrix row count %d", getNumCols(), that.getNumRows());
    assert getNumRows() == result.getNumRows() : String.format("Result matrix row count %d does not match left matrix row count %d", result.getNumRows(), getNumRows());
    assert that.getNumCols() == result.getNumCols() : String.format("Right matrix col count %d does not match result matrix col count %d", that.getNumCols(), result.getNumCols());

    acb_mat_mul(result, this, that, bits);
    return result;
  }

  public ComplexMatrix computeLowerUpperFactorization(LongBuffer permutation, int bits, ComplexMatrix result) {
    if (arblib.acb_mat_lu(permutation, result, this, bits) != 0) {
      result.name = "lu_" + (name != null ? name : "");
      result.initRows();
      return result;
    } else {
      return null;
    }
  }
  
  public ComplexMatrix extractUpperAndLowerTriangularMatrices(ComplexMatrix L, ComplexMatrix U)
  {
    assert isSquare() : "matrix must be square";
    int n = getNumRows();

    L.setName("L_" + name);
    U.setName("U_" + name);

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

  public boolean isSquare() {
    return getNumRows() == getNumCols();
  }

  private Complex diagonal = null;

  public Complex diag() {
    assert isSquare() : "diag() is not well-defined for non-square matrices";
    if (diagonal == null || diagonal.size() != getNumRows()) {
      if (diagonal != null) {
        diagonal.close();
      }
      diagonal = Complex.newVector(getNumRows());
      IntStream.range(0, getNumCols()).forEach(i -> diagonal.set(i, get(i, i)));
    }
    return diagonal;
  }     
  
  public Real frobeniusNorm(int bits, Real normResult) {
    arblib.acb_mat_frobenius_norm(normResult, this, bits);
    return normResult;
  }  
  
  @Override
  public int dim() {
    return 1;
  }  

  /**
   * Calls {@link arb#acb_mat_clear(ComplexMatrix)}
   * @return this
   */
  public ComplexMatrix clear() {
    if (swigCMemOwn) {      
      acb_mat_clear(this);
    }
    return this;
  }

  @Override
  public void close() { 
    clear();
    swigCMemOwn = false;
  }    
  
  public ComplexMatrix init(int rows, int cols) {
    acb_mat_init(this, rows, cols);
    return this;
  } 
  
%};


