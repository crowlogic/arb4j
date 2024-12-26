%typemap(javainterfaces) qqbar_struct "AutoCloseable,NamedField<AlgebraicNumber>"
%typemap(javafinalize) qqbar_struct ""

%typemap(javaimports) qqbar_struct %{
import arb.Integer;

/*
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */%}

%typemap(javaconstruct) qqbar_struct %{
  {
    this($imcall, true);
    init();
  }
%}



%typemap(javacode) qqbar_struct %{

  public SymbolicExpression getSymbolicRepresentation(SymbolicExpression result)
  {
    arblib.qqbar_get_fexpr_repr(result, this);
    return result;
  }

  public SymbolicExpression getSymbolicFormula(SymbolicExpression result, FormulaGenerationMethod... methods)
  {
    long flags = 0;
    for (FormulaGenerationMethod method : methods)
    {
      flags = flags | method.value();
    }
    return getSymbolicFormula(result, flags);
  }

  protected SymbolicExpression getSymbolicFormula(SymbolicExpression result, long flags)
  {
    arblib.qqbar_get_fexpr_formula(result, this, flags);
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
  public NamedRing<AlgebraicNumber> set(Fraction val)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }



  @Override
  public <N extends Named> N setName(String name)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String getName()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
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
    assert false : "TODO: Auto-generated method stub";
    return null;
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
