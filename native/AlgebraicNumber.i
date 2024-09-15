%typemap(javainterfaces) qqbar_struct "AutoCloseable,NamedField<AlgebraicNumber>"
%typemap(javafinalize) qqbar_struct ""

%typemap(javaimports) qqbar_struct %{
// imports..
%}

%typemap(javaconstruct) qqbar_struct %{
  {
    this($imcall, true);
    init();
  }
%}



%typemap(javacode) qqbar_struct %{

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
  public AlgebraicNumber add(AlgebraicNumber element, int prec, AlgebraicNumber result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public int bits()
  {
    assert false : "TODO: Auto-generated method stub";
    return 128;
  }

  @Override
  public int dim()
  {
    assert false : "TODO: Auto-generated method stub";
    return 1;
  }

  @Override
  public AlgebraicNumber div(int j, int prec, AlgebraicNumber result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber div(AlgebraicNumber j, int prec, AlgebraicNumber result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber mul(int x, int prec, AlgebraicNumber result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber mul(AlgebraicNumber x, int prec, AlgebraicNumber result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber newFieldElement()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber set(AlgebraicNumber value)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public AlgebraicNumber sub(AlgebraicNumber element, int prec, AlgebraicNumber result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
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

  static
  {
    System.loadLibrary("arblib");
  }
 
 
%};
