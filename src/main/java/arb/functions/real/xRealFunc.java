package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

/**
 * <pre>
parseRoot x➔∂a*x+b*x²+c*x³/∂x of Expression(#1383524016)

Variable(#1686100174).resolveReference(reference=a) expression=x➔∂a*x+b*x²+c*x³/∂x

Declaring a as a contextual variable of type class arb.Real

Variable(#1846406218).resolveReference(reference=b) expression=x➔∂a*x+b*x²+c*x³/∂x

Declaring b as a contextual variable of type class arb.Real

Variable(#2081191879).resolveReference(reference=c) expression=x➔∂a*x+b*x²+c*x³/∂x

Declaring c as a contextual variable of type class arb.Real

Instantiating (a+(b*(2*(x^(2-1)))))+(c*(3*(x^(3-1))))

Expression(#1383524016).defineClass(expression=x➔∂a*x+b*x²+c*x³/∂x
,className=x-∂a*x+b*x²+c*x³⁄∂x
, context=Context(#1559122513)[functions=[],variables=Variables(#1128096251)[[arb.Real:a=0, arb.Real:b=0, arb.Real:c=0]]])

Expression(#1383524016).generate() className=x-∂a*x+b*x²+c*x³⁄∂x

Expression(#1383524016) Generating x➔∂a*x+b*x²+c*x³/∂x

generate (a+(b*(2*(x^(2-1)))))+(c*(3*(x^(3-1))))
BinaryOperation.generate( this=(a+(b*(2*(x^(2-1)))))+(c*(3*(x^(3-1)))),
                          left=a+(b*(2*(x^(2-1))))(AdditionNode),
                          left.type=interface arb.functions.real.RealFunction,
                          operation=add,
                          right=c*(3*(x^(3-1)))(MultiplicationNode),
                          right.type=interface arb.functions.real.RealFunction,
                          resultType=interface arb.functions.real.RealFunction )


BinaryOperation.generate( this=a+(b*(2*(x^(2-1)))),
                          left=a(VariableNode),
                          left.type=class arb.Real,
                          operation=add,
                          right=b*(2*(x^(2-1)))(MultiplicationNode),
                          right.type=interface arb.functions.real.RealFunction,
                          resultType=interface arb.functions.real.RealFunction )


Variable(#1686100174).generate( this=a, resultType=class arb.Real)

BinaryOperation.generate( this=b*(2*(x^(2-1))),
                          left=b(VariableNode),
                          left.type=class arb.Real,
                          operation=mul,
                          right=2*(x^(2-1))(MultiplicationNode),
                          right.type=interface arb.functions.real.RealFunction,
                          resultType=interface arb.functions.real.RealFunction )


Variable(#1846406218).generate( this=b, resultType=class arb.Real)

BinaryOperation.generate( this=2*(x^(2-1)),
                          left=2(LiteralConstantNode),
                          left.type=class arb.Integer,
                          operation=mul,
                          right=x^(2-1)(ExponentiationNode),
                          right.type=interface arb.functions.real.RealFunction,
                          resultType=interface arb.functions.real.RealFunction )


BinaryOperation.generate( this=x^(2-1),
                          left=x(VariableNode),
                          left.type=interface arb.functions.real.RealFunction,
                          operation=pow,
                          right=2-1(SubtractionNode),
                          right.type=class arb.Integer,
                          resultType=interface arb.functions.real.RealFunction )


Variable(#153245266).generate( this=x, resultType=interface arb.functions.real.RealFunction)
 * </pre>
 * 
 */
public class xRealFunc implements
                       RealFunctional<Object, RealFunction>,
                       Typesettable,
                       AutoCloseable,
                       Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ2      = new Integer("3");
  public final Integer cℤ1      = new Integer("2");
  public final Integer cℤ4      = new Integer("1");
  public final Integer cℤ3      = new Integer("0");
  public Real          a;
  public Real          b;
  public Real          c;
  public RealFunction  ifuncℝ4  = new RealFunction();
  public RealFunction  ifuncℝ5  = new RealFunction();
  public RealFunction  ifuncℝ6  = new RealFunction();
  public Integer       iℤ2      = new Integer();
  public Integer       iℤ1      = new Integer();
  public RealFunction  ifuncℝ7  = new RealFunction();
  public RealFunction  ifuncℝ1  = new RealFunction();
  public RealFunction  ifuncℝ2  = new RealFunction();
  public RealFunction  ifuncℝ3  = new RealFunction();
  public RealFunction  ifuncℝ10 = new RealFunction();
  public RealFunction  ifuncℝ8  = new RealFunction();
  public RealFunction  ifuncℝ9  = new RealFunction();

  @Override
  public Class<RealFunction> coDomainType()
  {
    return RealFunction.class;
  }

  @Override
  public RealFunction evaluate(Object in, int order, int bits, RealFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return a.add(b.mul(cℤ1.mul(ifuncℝ1.identity().pow(cℤ1.sub(cℤ4, bits, iℤ1), bits, ifuncℝ2), bits, ifuncℝ3),
                       bits,
                       ifuncℝ4),
                 bits,
                 ifuncℝ5)
            .add(c.mul(cℤ2.mul(ifuncℝ6.identity().pow(cℤ2.sub(cℤ4, bits, iℤ2), bits, ifuncℝ7), bits, ifuncℝ8),
                       bits,
                       ifuncℝ9),
                 bits,
                 ifuncℝ10);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (a == null)
    {
      throw new AssertionError("x-∂a*x+b*x²+c*x³⁄∂x.a is null");
    }
    else if (b == null)
    {
      throw new AssertionError("x-∂a*x+b*x²+c*x³⁄∂x.b is null");
    }
    else if (c == null)
    {
      throw new AssertionError("x-∂a*x+b*x²+c*x³⁄∂x.c is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ4.close();
    cℤ3.close();
    ifuncℝ4.close();
    ifuncℝ5.close();
    ifuncℝ6.close();
    iℤ2.close();
    iℤ1.close();
    ifuncℝ7.close();
    ifuncℝ1.close();
    ifuncℝ2.close();
    ifuncℝ3.close();
    ifuncℝ10.close();
    ifuncℝ8.close();
    ifuncℝ9.close();
  }

  @Override
  public String toString()
  {
    return "x➔∂a*x+b*x²+c*x³/∂x";
  }

  @Override
  public String typeset()
  {
    return "a + b \\cdot 2 \\cdot {x}^{(\\left(2-1\\right))} + c \\cdot 3 \\cdot {x}^{(\\left(3-1\\right))}";
  }
}
