%typemap(javainterfaces) qqbar_struct "AutoCloseable,NamedField<AlgebraicNumber>,Typesettable"
%typemap(javafinalize) qqbar_struct ""

%typemap(javaimports) qqbar_struct %{
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * <p>
 * An {@link AlgebraicNumber} represents a {@link Real} or {@link Complex}
 * algebraic number (an element of ℚ̅) by its unique reduced minimal polynomial
 * in ℤ[x] and an isolating complex interval. The precision of isolating
 * intervals is maintained automatically to ensure that all operations on
 * {@link AlgebraicNumber} instances are exact.
 * </p>
 * 
 * <p>
 * This representation is useful for working with individual algebraic numbers
 * of moderate degree (up to 100, say). Arithmetic in this representation is
 * expensive: an arithmetic operation on numbers of degrees <em>m</em> and
 * <em>n</em> involves computing and then factoring an annihilating polynomial
 * of degree <em>mn</em> and potentially also performing numerical root-finding.
 * </p>
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
%}

%typemap(javaconstruct) qqbar_struct %{
  {
    this($imcall, true);
    init();
  }
%}

%typemap(javacode) qqbar_struct %{

  public AlgebraicNumber identity()
  {
    return one();
  }

  public AlgebraicNumber one()
  {
    arblib.qqbar_one(this);
    return this;
  }
  
  @SuppressWarnings("resource")
  public static AlgebraicNumber named(String string)
  {
    return new AlgebraicNumber().setName(string);
  }
  
  public boolean isReal()
  {
    return arblib.qqbar_is_real(this) != 0;
  }
  
  public boolean isRational()
  {
    return arblib.qqbar_is_rational(this) != 0;
  }
  
  public Real neg(Real result)
  {
    return result.set(this).neg();
  }
  
  
  public boolean isInteger()
  {
    return arblib.qqbar_is_integer(this) != 0;
  }

  public AlgebraicNumber(String string, int bits )
  {
    this();
    set(string);
  }
    
  public AlgebraicNumber swap(AlgebraicNumber reference)
  {
    arblib.qqbar_swap(reference, this);
    return reference;
  }
  
  @Override
  public String typeset()
  {
    try ( var blip = new SymbolicExpression())
    {
      return getSymbolicExpression(blip, FormulaGenerationMethod.All).typeset();
    }
  }

  public AlgebraicNumber div(Integer x, int prec, AlgebraicNumber result)
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_div_fmpz(result, this, x.swigCPtr);
    return result;
  }
    
  public AlgebraicNumber sqrt()
  {
    return sqrt(this);
  }
  
  public AlgebraicNumber set( int val )
  {
    arblib.qqbar_set_si(this, val);
    return this;
  }
  

  public AlgebraicNumber root(int n, AlgebraicNumber result)
  {
    arblib.qqbar_root_ui(result, this, n);
    return result;
  }
  
  @Override
  public String toString()
  {
    try ( var blip = new SymbolicExpression())
    {
      StringBuilder sb = new StringBuilder();
      sb.append(getSymbolicExpression(blip, FormulaGenerationMethod.All));
      return sb.toString();
    }
  }
 

  public Real mul(Real x, int prec, Real result)
  {
    return getReal(prec, result).mul(x,prec);
  }  

  public Real div(Real x, int prec, Real result)
  {
    return getReal(prec, result).div(x,prec);
  }  

  public Real add(Real x, int prec, Real result)
  {
    return getReal(prec, result).add(x,prec);
  }  

  public Real sub(Real x, int prec, Real result)
  {
    return getReal(prec, result).sub(x,prec);
  }  

  public Real pow(Real x, int prec, Real result)
  {
    return getReal(prec, result).pow(x,prec);
  }  

 
  public Real getReal(int bits, Real result)
  {
    if ( !isReal() )
    {
      throw new IllegalArgumentException( this + " is not Real-valued" );
    }
    arblib.qqbar_get_arb(result, this, bits);
    return result;
  }

  public AlgebraicNumber sub(Integer x, int prec, AlgebraicNumber result)
  {
    arblib.qqbar_sub_fmpz(result, this, x.swigCPtr);
    return result;
  }
  
  public Complex getComplex(int bits, Complex result)
  {
    arblib.qqbar_get_acb(result, this, bits);
    return result;
  }
  
  @Override
  public AlgebraicNumber pow(AlgebraicNumber operand, int bits, AlgebraicNumber res)
  {
    return pow(operand, res);
  }
  
 public AlgebraicNumber pow(AlgebraicNumber operand, AlgebraicNumber res)
  {
    arblib.qqbar_pow(res, this, operand);
    return res;
  }  
  
  public AlgebraicNumber pow(Fraction operand, AlgebraicNumber res)
  {
    arblib.qqbar_pow_fmpq(res, this, operand);
    return res;
  }
  
  public AlgebraicNumber inverse()
  {
    return inverse(this);
  }
  
  public AlgebraicNumber pow(Integer exp)
  {
    return pow(exp,this);
  }
  

  public Named set(String value)
  {
    NullaryFunction<AlgebraicNumber> f = Function.express(Object.class,
                                                          AlgebraicNumber.class,
                                                          NullaryFunction.class,
                                                          value);
    return set(f.evaluate());
  }
  
  public AlgebraicNumber set(SymbolicExpression expr)
  {
    arblib.qqbar_set_fexpr(this, expr);
    return this;
  }

  public SymbolicExpression getSymbolicExpression(SymbolicExpression result,
                                                  FormulaGenerationMethod... methods)
  {
    long flags = 0;
    for (FormulaGenerationMethod method : methods)
    {
      flags = flags | method.value();
    }
    return getSymbolicExpression(result, flags);
  }

  protected SymbolicExpression getSymbolicExpression(SymbolicExpression result, long flags)
  {
    arblib.qqbar_get_fexpr_formula(result, this, flags);
    return result;
  }
  
  public Complex mul(Complex x, int prec, Complex result)
  {
    return getComplex(prec, result).mul(x,prec);
  }  

  @Override
  public AlgebraicNumber inverse(AlgebraicNumber result)
  {
    arblib.qqbar_inv(result, this);
    return result;
  }

  public AlgebraicNumber add(Integer addend, int bits, AlgebraicNumber result)
  {
    assert addend != null && addend.swigCPtr != 0 : "addend is null";
    assert result != null && result.swigCPtr != 0 : "result is null";
    arblib.qqbar_add_fmpz(result, this, addend.swigCPtr);
    return result;
  }
  
  public AlgebraicNumber pow(Integer n, AlgebraicNumber result)
  {
    assert n != null && n.swigCPtr != 0 : "n is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_pow_fmpz(result, this, n.swigCPtr);
    return result;
  }

  public Real sub(AlgebraicNumber x, int prec, Real result)
  {
    try ( var a = result.borrowVariable(); var b = result.borrowVariable())
    {
      return a.set(this).sub(b.set(x), prec, result);
    }
  }
  
  @Override
  public AlgebraicNumber div(AlgebraicNumber x, int prec, AlgebraicNumber result)
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_div(result, this, x);
    return result;
  }

  @Override
  public AlgebraicNumber mul(AlgebraicNumber x, int prec, AlgebraicNumber result)
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_mul(result, this, x);
    return result;
  }
  
  
  public AlgebraicNumber set(Integer val)
  {
    assert val != null && val.swigCPtr != 0 : "val is null or has a null swigCPtr";
    arblib.qqbar_set_fmpz(this, val.swigCPtr);
    return this;
  }
  
  public AlgebraicNumber(Complex complex)
  {
    this();
    setEnclosure(complex);    
  }

 public AlgebraicNumber init()
 {
   arblib.qqbar_init(this);
   return this;
 }
 
  @Override
  public <E> E get(int i)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber set(Fraction val)
  {
    assert val != null && val.swigCPtr != 0 : "val is null or has null swigCPtr";
    arblib.qqbar_set_fmpq(this, val);
    return this;
  }
  
  String name;
  
  public RealPolynomial div(RealPolynomial x, int prec, RealPolynomial result)
  {   
      return result.set(this).div(x, prec, result);    
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
  public AlgebraicNumber additiveIdentity()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber multiplicativeIdentity()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber add(AlgebraicNumber x, int prec, AlgebraicNumber result) 
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_add(result, this, x);
    return result;
  }

  @Override
  public int bits()
  {
    return 128;
  }

  @Override
  public int dim()
  {
    return 1;
  }

  @Override
  public AlgebraicNumber div(int j, int prec, AlgebraicNumber result)
  {
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_div_si(result, this, j);
    return result;
  }

  public AlgebraicNumber mul(Fraction x, int prec, AlgebraicNumber result)
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_mul_fmpq(result, this, x);
    return result;
  }
  
  public AlgebraicNumber mul(Integer x, int prec, AlgebraicNumber result)
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_mul_fmpz(result, this, x.swigCPtr);
    return result;
  }  

  @Override
  public AlgebraicNumber mul(int x, int prec, AlgebraicNumber result)
  {
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_mul_si(result, this, x);
    return result;
  }


  @Override
  public AlgebraicNumber newFieldElement()
  {
    return new AlgebraicNumber();
  }

  @Override
  public AlgebraicNumber set(AlgebraicNumber value)
  {
    assert value != null && value.swigCPtr != 0 : "value or value.swigCPtr is null";
    arblib.qqbar_set(this, value);
    return this;
  }

  @Override
  public AlgebraicNumber sub(AlgebraicNumber x, int prec, AlgebraicNumber result) 
  {
    assert x != null && x.swigCPtr != 0 : "x is null or has null swigCPtr";
    assert result != null && result.swigCPtr != 0 : "result is null or has null swigCPtr";
    arblib.qqbar_sub(result, this, x);
    return result;
  }

  @Override
  public AlgebraicNumber zero()
  {
    arblib.qqbar_zero(this);
    return this;
  }

  @Override
  public void close()
  {
    delete();
  }

  public AlgebraicNumber sqrt(AlgebraicNumber result)
  {
    return sqrt(0, result);
  }

  public AlgebraicNumber sqrt(int bits, AlgebraicNumber result)
  {
    arblib.qqbar_sqrt(result, this);
    return result;
  }
  static
  {
    System.loadLibrary("arblib");
  }
 
 
%};
