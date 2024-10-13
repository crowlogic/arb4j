%typemap(javafinalize) fmpz_poly_struct ""

%typemap(javaimports) fmpz_poly_struct %{
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.algebra.Ring;
import arb.functions.Function;
import arb.functions.integer.IntegerPolynomialNullaryFunction;
import arb.expressions.Context;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}
%typemap(javafinalize) fmpz_poly_struct ""
%typemap(javainterfaces) fmpz_poly_struct "Named,AutoCloseable,Ring<IntegerPolynomial>,Function<Integer,Integer>"

%typemap(javacode) fmpz_poly_struct %{
  static { System.loadLibrary( "arblib" ); }


  public IntegerPolynomial add(Real addend, int bits, IntegerPolynomial result)
  {
    assert addend.isInteger() : "addend " + addend + " must be an integer";
    try ( var intVal = addend.integerValue(new Integer()) )
    {
      return result.set(this).add(intVal, bits);
    }
  }

  public IntegerPolynomial add(Integer intVal, int bits)
  {
    return add(intVal,bits,this);
  }

  public IntegerPolynomial set(IntegerPolynomial integerPolynomial)
  {
    arblib.fmpz_poly_set(this, integerPolynomial);;
    return this;
  }
  
  public IntegerPolynomial sub(IntegerPolynomial x, int bits)
  {
    return sub(x, bits, this);
  }
  
  public IntegerPolynomial add(Integer in, int bits, IntegerPolynomial result)
  {
    assert in.swigCPtr != 0;
    assert result.swigCPtr != 0;
    assert in.swigCPtr != 0 : "input pointer is null";
    arblib.fmpz_poly_add_fmpz(result, this, in.swigCPtr);
    return result;
  }
  
  public IntegerPolynomial pow(Integer in, int bits, IntegerPolynomial result)
  {
    assert in.swigCPtr != 0;
    assert result.swigCPtr != 0;
    assert bits > 0;
    assert in.sign() >= 0 : "cannot raise " + this + " + to a negative power " + in;
    arblib.fmpz_poly_pow(result, this, in.getUnsignedValue());
    return result;
  }
  
  public IntegerPolynomial identity()
  {
    return zero().set(1, 1);
  }

  public IntegerPolynomial zero()
  {
    arblib.fmpz_poly_zero(this);
    return this;
  }

  @Override
  public Integer evaluate(Integer t, int order, int bits, Integer res)
  {
    assert res.swigCPtr != 0 : "null result pointer";
    assert t.swigCPtr != 0 : "input has null pointer";
    arblib.fmpz_poly_evaluate_fmpz(res.swigCPtr, this, t.swigCPtr);
    return res;
  }
  
  @Override
  public int
         dim()
  {
    return 1;
  }
    
  public IntegerPolynomial remainder;
  
  @Override
  public String toString()
  {
    return arblib.fmpz_poly_get_str_pretty(this, "x");
  }
  
  public String name;

  public IntegerPolynomial add(IntegerPolynomial addend, IntegerPolynomial res)
  {
    return add(addend, 0, res);
  }

  public IntegerPolynomial set(int i)
  {
    arblib.fmpz_poly_set_si(this, i);
    return this;
  }
  
  public IntegerPolynomial set(Integer i)
  {
    arblib.fmpz_poly_set_fmpz(this, i.swigCPtr);
    return this;
  }
  
  public IntegerPolynomial(String str)
  {
    this();
    set(str);
  }

  public static IntegerPolynomial express(String expression)
  {
    return express(expression,null);
  }

  public static IntegerPolynomial express(String expression, Context context)
  {
    return IntegerPolynomialNullaryFunction.express(expression, context).evaluate(128);
  }

  public IntegerPolynomial set(String str)
  {
    return IntegerPolynomialNullaryFunction.express(str).evaluate(128, this);
  }
  
  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof IntegerPolynomial))
    {
      return false;
    }
    IntegerPolynomial that = (IntegerPolynomial) obj;

    return arblib.fmpz_poly_equal(this, that) != 0;
  }
  
  public IntegerPolynomial add(IntegerPolynomial addend, int bits, IntegerPolynomial res)
  {
    arblib.fmpz_poly_add(res, this, addend);
    return res;
  }
    
  @Override
  public void close() 
  {
    delete();
  }
  
    @Override
  public IntegerPolynomial mul(IntegerPolynomial operand, int prec, IntegerPolynomial result)
  {
    arblib.fmpz_poly_mul(result, this, operand);
    return result;
  }

  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
   this.name = name;
   return (N) this;
  }

  @Override
  public String getName()
  {
    return name;
  }
  
  @Override
  public IntegerPolynomial div(IntegerPolynomial operand, int prec, IntegerPolynomial result)
  {
    arblib.fmpz_poly_div(result, this, operand);
    return result;
  }  
  
  @Override
  public IntegerPolynomial sub(IntegerPolynomial subtrahend, int bits, IntegerPolynomial res)
  {
    arblib.fmpz_poly_sub(res, this, subtrahend);
    return res;
  }

  Integer[] coeffs;

  public Integer get(int idx)
  {
    final int length = getLength();
    assert 0 <= idx && idx < length : String.format("index %d out of bounds, this.length=%d", idx, length);
    if (coeffs == null)
    {
      long coeffsNative = getCoeffsNative();
      coeffs = new Integer[length];
      for (int i = 0; i < getLength(); i++)
      {
        coeffs[i] = new Integer(coeffsNative + Long.BYTES * i,
                                false);
      }
    }

    return coeffs[idx];
  }
  
  public IntegerPolynomial div(IntegerPolynomial operand, IntegerPolynomial result)
  {
    return div(operand,0, result);
  }
  
  public IntegerPolynomial mul(IntegerPolynomial operand, IntegerPolynomial result)
  {
    return mul(operand, 0, result);
  }  
  
  public IntegerPolynomial set(int i, int j)
  {
    arblib.fmpz_poly_set_coeff_si(this, i, j);
    return this;
  }  
%}
