%typemap(javainterfaces) fmpz_poly_q_struct "NamedField<RationalFunction>,Function<Fraction,Fraction>,Verifiable,AutoCloseableAssignable<RationalFunction>"
%typemap(javafinalize) fmpz_poly_q_struct ""
%typemap(javaimports) fmpz_poly_q_struct %{
import arb.exceptions.ArbException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import java.util.stream.Stream;
%}

%typemap(javaconstruct) fmpz_poly_q_struct %{
  {
    this($imcall, true);
    init();
  }
%}



%typemap(javacode) fmpz_poly_q_struct %{

  public RationalFunction add(Real real, int bits)
  {
   return add(real,bits,this);
  }
  
  public RationalFunction div(Real operand, int prec, RationalFunction result)
  {
    return div(result.set(operand),prec,result);
  }
  
  public RationalFunction add(Real addend, int prec, RationalFunction result)
  {
    return add(result.set(addend),prec,result);
  }
  
  public RationalFunction mul(Real real, int prec)
  {
    return mul(real,prec,this);
  }

  public RationalFunction mul(Real real, int prec, RationalFunction realPart)
  {
    return realPart.set(real).mul(this,prec,realPart);
  }
  
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {
    try ( ComplexFraction tf = new ComplexFraction())
    {
      tf.set(t);
      evaluate(t.real, order, bits, result.real);
      evaluate(t.imag, order, bits, result.imag);
      return result;
    }
  }  
  
  @Override
  public RationalFunction inverse(RationalFunction x)
  {
    arblib.fmpz_poly_q_inv(x, this);
    return null;
  }

  /**
   * @return true if this{@link #denominator} and this{@link #numerator} are both
   *         of length 1
   */
  public boolean isFraction()
  {
    return getNumerator().getLength() == 1 && getDenominator().getLength() == 1;
  }
    
  public ComplexFraction evaluate(ComplexFraction input, int bits, ComplexFraction result)
  {
    evaluate(input.realPart, bits, result.realPart);
    evaluate(input.imaginaryPart, bits, result.imaginaryPart);
    return result;
  }  

  public RationalFunction pow(Real power, int bits, RationalFunction result)
  {
    assert power.isInteger() : "TODO: support non-integer power " + power;
    try ( var intPower = power.integerValue(new Integer()))
    {
      return pow(intPower, bits, result);
    }

  }
     
  public RationalFunction mul(Integer multiplicand, int bits, RationalFunction result)
  {
    assert swigCPtr != 0 : "this.swigCPtr is null";
    assert multiplicand.swigCPtr != 0 : "multiplicand.swigCPtr is null";
    assert result.swigCPtr != 0 : "result.swigCPtr is null";    
    arblib.fmpz_poly_q_scalar_mul_fmpz(result, this, multiplicand.swigCPtr);
    return result; 
  }
  
  public Fraction evaluate(Fraction fraction)
  {
    return evaluate(fraction, 0, new Fraction());
  }

  @SuppressWarnings("resource")    
  public RationalFunction pow(int power, int bits, RationalFunction res)
  {
    if ( checkPointers )
    {
      assertPointerConsistency();
    }
    RationalFunction thiz = this;
    if ( power < 0 )
    {
      arblib.fmpz_poly_q_inv(thiz = res, this);
    }
    arblib.fmpz_poly_q_pow(res, thiz, power );
    res.refreshPointers();
    return res;
  }
  
  public ComplexFraction evaluate(ComplexFraction t, int order, int bits, ComplexFraction result)
  {
    evaluate(t.realPart,order,bits,result.realPart);
    evaluate(t.imaginaryPart,order,bits,result.imaginaryPart );
    return result;
  }

  public RationalFunction sub(Fraction element, int prec, RationalFunction result)
  {     
      return this.sub(result.set(element), prec,result);
  }  
    
  public RationalFunction sub(Integer element, int prec, RationalFunction result)
  {
    try ( RationalFunction e = new RationalFunction())
    {
      e.set(element);
      return result.set(this).sub(e, prec);
    }
  }
  
  RealRationalFunction realVersion;

  public boolean isOne()
  {
    return arblib.fmpz_poly_q_is_one(this) != 0;
  }

  public boolean isZero()
  {
    return arblib.fmpz_poly_q_is_zero(this) != 0;
  }


  public RealFunction asRealFunction()
  {
    return (realVersion == null ? (realVersion = new RealRationalFunction()) : realVersion);
  }

  public RealFunction real()
  {
    return asRealFunction();
  }
    
  public final class RealRationalFunction implements RealFunction, AutoCloseable
  {
    @Override
    public String toString()
    {
      return RationalFunction.this.toString();
    }

    @Override
    public String typeset()
    {
      return RationalFunction.this.typeset();
    }
    
    @Override
    public void close()
    {
      x.close();
      x = null;
      y.close();
      y = null;
    }

    Fraction x = new Fraction();
    Fraction y = new Fraction();

    @Override
    public Real evaluate(Real t, int order, int bits, Real res)
    {
      x.set(t);
      RationalFunction.this.evaluate(x, order, bits, y);
      res.set(y);
      return res;
    }
  }
    
  public RationalFunction set(String string)
  {
    return RationalNullaryFunction.express(string).evaluate( bits(), this);
  }  

 @Override
  public Stream<RationalFunction>
         stream()
  {
    assert false : "TODO";
    return null;
  }
    
  @SuppressWarnings("resource")
  public static RationalFunction express(String expression)
  {
    return new RationalFunction().set(expression);
  }

  public static RationalFunction express(String expression, Context context)
  {
    return RationalNullaryFunction.express(expression, context).evaluate(128);
  }
  
  public static Expression<Fraction, Fraction, RationalFunction> compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Fraction, Fraction, RationalFunction> compile(String expression, Context context)
  {
    return Compiler.compile(expression, context, Fraction.class, Fraction.class, RationalFunction.class, null);
  }
    
  @SuppressWarnings("resource")
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if  (res == null )
    {
      res = new Real();
    }
    try ( var tmp = new Fraction())
    {
      return res.set(evaluate(tmp.set(t), order, bits, tmp));
    }
  }
    
  @Override
  public boolean verify()
  {
    if (!checkPointers)
    {
      return true;
    }
    boolean denominatorConsistent = denominator == null || denominator.swigCPtr == getDenominatorAddress();
    boolean numeratorConsistent   = numerator == null || numerator.swigCPtr == getNumeratorAddress();
    return denominatorConsistent && numeratorConsistent;
  }
  
  public static boolean checkPointers = true;
  
  @SuppressWarnings("resource")
  public RationalFunction pow(Integer power, int unused, RationalFunction res)
  {
    if ( checkPointers )
    {
      assertPointerConsistency();
    }
    assert power != null && power.swigCPtr != 0 : "null pointer or reference";
    RationalFunction thiz = this;
    if ( power.getSignedValue() < 0 )
    {
      arblib.fmpz_poly_q_inv(thiz = res, this);
    }
    arblib.fmpz_poly_q_pow(res, thiz, power.getUnsignedValue() );
    res.refreshPointers();
    return res;
  }
  
  @Override
  public Fraction evaluate(Fraction t, int order, int bits, Fraction res)
  {
    arblib.fmpz_poly_q_evaluate_fmpq(res, this, t);
    return res;
  }
  
  static
  {
    System.loadLibrary("arblib");
  }

  @SuppressWarnings("unlikely-arg-type")
  @Override
  public boolean equals(Object obj)
  {
    if (obj instanceof Fraction)
    {
      if (!isFraction())
      {
        return false;
      }
      Fraction frac = (Fraction) obj;
      return frac.equals(this);
    }
    if (!(obj instanceof RationalFunction))
    {
      return false;
    }
    RationalFunction that = (RationalFunction) obj;
    return arblib.fmpz_poly_q_equal(this, that) != 0;
  }
    
  public RationalFunction init()
  {
    arblib.fmpz_poly_q_init(this);
    refreshPointers();
    return this;    
  }
  
  public RationalFunction set(int i)
  {
    arblib.fmpz_poly_q_set_si(this, i);
    refreshPointers();    
    return this;
  }
  
  public IntegerPolynomial numerator;
 
  public IntegerPolynomial denominator;

  public IntegerPolynomial getDenominator()
  {
    if (denominator == null)
    {
      denominator = new IntegerPolynomial(getDenominatorAddress(),
                                          false);
    }
    else
    {
      denominator.swigCPtr = getDenominatorAddress();
    }
    return denominator;
  }

  public IntegerPolynomial getNumerator()
  {
    if (numerator == null)
    {
      numerator = new IntegerPolynomial(getNumeratorAddress(),
                                        false);
    }
    else
    {
      numerator.swigCPtr = getNumeratorAddress();
    }
    return numerator;
  }
    
  @Override
  public void close() 
  {
    delete();
    if ( realVersion != null ) 
    {
      realVersion.close();
      realVersion = null;
    }
  }  
  
  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
    this.name = name;
    return (N) this;
  }

  @Override
  public RationalFunction additiveIdentity()
  {
    return zero();
  }
    
  @Override
  public String toString()
  {
    return arblib.fmpz_poly_q_get_str_pretty(this, "x");
  }
  
  public RationalFunction identity()
  {
    getNumerator().set(0);
    getNumerator().set(1,1);
    getDenominator().set(1);
    return this;
  }

  @Override
  public RationalFunction multiplicativeIdentity()
  {
   return one();
  }

  public RationalFunction one()
  {
    arblib.fmpz_poly_q_one(this);
    return this;
  }
  
  @Override
  public RationalFunction add(RationalFunction element, int prec, RationalFunction result)
  {
    assertPointerConsistency();  
    arblib.fmpz_poly_q_add(result, this, element);
    refreshPointers();  
    return result;
  }

  public int bits = 128;
  
  @Override
  public int bits()
  {
    return bits;
  }

  @Override
  public int dim()
  {
    return 1;
  }

  @Override
  public RationalFunction div(RationalFunction operand, int prec, RationalFunction result)
  {
    assert operand.swigCPtr != 0 : "operand has null pointer";
    assert result.swigCPtr != 0 : "result has null pointer";
    assert this.swigCPtr != 0 : "this has null pointer";
    assert !operand.isZero() : "division by zero";  
    assertPointerConsistency();
    arblib.fmpz_poly_q_div(result, this, operand);
    refreshPointers();      
    return result;
  }

  @Override
  public RationalFunction get(int index)
  {
    assert index == 0 : "index can only be 0";
    return this;
  }

  @Override
  public String getName()
  {
    return name;
  }

  public String name;
  
  @Override
  public RationalFunction mul(int x, int prec, RationalFunction result)
  {
    assertPointerConsistency();  
    arblib.fmpz_poly_q_scalar_mul_si(result, this, x);
    refreshPointers();      
    return result;
  }

  @Override
  public RationalFunction mul(RationalFunction x, int prec, RationalFunction result)
  {
    assertPointerConsistency();
    arblib.fmpz_poly_q_mul(result, this, x);
    refreshPointers();
    return result;
  }
  
  public RationalFunction add(Integer element, int prec, RationalFunction result)
  {
    try ( RationalFunction e = new RationalFunction())
    {
      e.set(element);
      return result.set(this).add(e, prec);
    }
  }
 
  
  public RationalFunction neg( int bits, RationalFunction res )
  {
    return neg(res);
  }  

  /**
   * @throws ArbException if {@link #getNumeratorAddress()} !=
   *                      {@link #getNumerator()}{@link #swigCPtr} or
   *                      {@link #getDenominatorAddress()} !=
   *                      {@link #getDenominator()}{@link #swigCPtr}
   */
  public void assertPointerConsistency()
  {
    if (!verify())
    {
      throw new ArbException(String.format("numeratorAddress=%s\ndenominatorAddress=%s\nnumerator=%s\ndenominator=%s\n",
                                           getNumeratorAddress(),
                                           getDenominatorAddress(),
                                           numerator == null ? "null" : numerator.swigCPtr,
                                           denominator == null ? "null" : denominator.swigCPtr));
    }
  }

  /**
   * Updates the {@link IntegerPolynomial#swigCPtr} of this{@link #numerator} and
   * this{@link #denominator} if they are not null. This should be called after
   * performaning any operation that could potentially result in at least one of
   * the numerator and denominator pointers changing
   */
  public RationalFunction refreshPointers()
  {
    if (denominator != null)
    {
      denominator.swigCPtr = getDenominatorAddress();
    }
    if (numerator != null)
    {
      numerator.swigCPtr = getNumeratorAddress();
    }
    return this;
  }
  
  @Override
  public RationalFunction newFieldElement()
  {
     return new RationalFunction();
  }

  @Override
  public RationalFunction set(RationalFunction value)
  {
    arblib.fmpz_poly_q_set(this, value);
    refreshPointers();
    return this;
  }

  @Override
  public RationalFunction div(int j, int prec, RationalFunction result)
  {
    assertPointerConsistency();
    arblib.fmpz_poly_q_scalar_div_si(result, this, j);
    return result;
  }

  public RationalFunction div(Integer j, int prec, RationalFunction result)
  {
    assertPointerConsistency();
    arblib.fmpz_poly_q_scalar_div_fmpz(result, this, j.swigCPtr);
    return result;  
  }
  
  @Override
  public RationalFunction sub(RationalFunction element, int prec, RationalFunction result)
  {
    assertPointerConsistency();
    arblib.fmpz_poly_q_sub(result, this, element);
    return result;
  }

  public RationalFunction set(Real real)
  {
    assertPointerConsistency();  
    try ( Fraction tmp = new Fraction() )
    {
      tmp.set(real);
      return set(tmp);
    }
  }  
  
  @Override
  public RationalFunction zero()
  {
    arblib.fmpz_poly_q_zero(this);
    return this;
  }

  public RationalFunction add(RationalFunction x, int prec)
  {
    return add(x,prec,this);
  }
  
  public RationalFunction mul(RationalFunction x, int prec)
  {
    return mul(x,prec,this);
  }
  
  public RationalFunction set(Integer integer)
  {
   set(integer.getSignedValue());
   return this;
  }

  public RationalFunction neg(RationalFunction res)
  {
    arblib.fmpz_poly_q_neg(res, this);
    return res;
  }
  
  public RationalFunction neg()
  {
    return neg(this);
  }
  
  public RationalFunction reduce()
  {
    arblib.fmpz_poly_q_canonicalise(this);
    return this;
  }
  
  public boolean isReduced()
  {   
    return arblib.fmpz_poly_q_is_canonical(this) != 0;                
  }
  
  public RationalFunction set(Fraction fraction)
  {
    getNumerator().set(fraction.getNumerator());
    getDenominator().set(fraction.getDenominator());
    return this;
  }
  
  public RationalFunction add(Fraction element, int prec, RationalFunction result)
  {
    try ( RationalFunction e = new RationalFunction())
    {
      e.set(element);
      return result.set(this).add(e, prec);
    }
  }
    
%};
 