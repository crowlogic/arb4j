package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.invokeVirtualMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Complex;
import arb.Fraction;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.sequences.LommelPolynomial;

/**
 * Syntax: "R(v,n;z)" which corresponds to a {@link LommelPolynomial} with the
 * {@link LommelPolynomial#v} order variable set and then assigns
 * {@link LommelPolynomialNode#elementFieldName} the specific
 * {@link RationalFunctionSequence} which gets
 * {@link RationalFunctionSequence#evaluate(Integer, int, int, RationalFunction)}d
 * by passing the this{@link #index} argument which corresponds to the variable
 * n in the expression R(v,n;z)
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomialNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                 FunctionCallNode<D, C, F>
{

  public Node<D, C, F> order;
  public Node<D, C, F> index;
  public String        functionFieldName;
  public String        elementFieldName;
  public Class<?>      scalarType;
  private boolean      hasScalarCodomain;
  private boolean      isNullaryFunctionOrHasScalarCodomain;

  public LommelPolynomialNode(Expression<D, C, F> expression)
  {
    super("R",
          null,
          expression);
    index = expression.resolve();
    order = expression.require(',').resolve();
    arg   = expression.require(';').resolve();
    expression.require(')');
    scalarType                           = Compiler.scalarType(expression.coDomainType);

    hasScalarCodomain                    = expression.coDomainType.equals(Real.class)
                  || expression.coDomainType.equals(Complex.class)
                  || expression.coDomainType.equals(Fraction.class);
    isNullaryFunctionOrHasScalarCodomain = expression.domainType.equals(Object.class)
                  || hasScalarCodomain;

    functionFieldName                    =
                      expression.newIntermediateVariable("seq", LommelPolynomial.class, true);
    elementFieldName                     =
                     expression.newIntermediateVariable("element", RationalFunction.class, true);

    if (Expression.trace)
    {
      System.out.println("seqFieldName=" + functionFieldName);
      System.out.println("elementFieldName=" + elementFieldName);
    }

    expression.registerInitializer(this::generateFunctionInitializer);

  }

  public void generateFunctionInitializer(MethodVisitor mv)
  {
    expression.insideInitializer = true;
    if (isNullaryFunctionOrHasScalarCodomain)
    {
      loadFunctionOntoStack(mv);
      Compiler.getField(mv, LommelPolynomial.class, "v", Real.class);
      generateOrder(mv);
      invokeSetMethod(mv, Real.class, Real.class);

      loadFunctionOntoStack(mv);
      Compiler.getField(mv, LommelPolynomial.class, "n", Integer.class);
      index.generate(mv, Integer.class);
      assert index.getGeneratedType().equals(Integer.class);
      invokeSetMethod(mv, Integer.class, Integer.class);

      loadFunctionOntoStack(mv);
      mv.visitInsn(Opcodes.ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      expression.loadThisFieldOntoStack(mv, elementFieldName, RationalFunction.class);

      invokeVirtualMethod(mv,
                          LommelPolynomial.class,
                          "evaluate",
                          Object.class,
                          Object.class,
                          int.class,
                          int.class,
                          Object.class);

    }
    else
    {
    //  assert false : "todo?";
    }
  }

  protected void generateOrder(MethodVisitor mv)
  {
    order.generate(mv, Real.class);
    if (!Real.class.equals(order.getGeneratedType()))
    {
      if (Expression.trace)
      {
        System.err.format("generateCastTo(Real) from generatedType=%s\n",
                          Real.class,
                          generatedType);
      }
      order.generateCastTo(mv, Real.class);
    }
    assert order.getGeneratedType().equals(Real.class) : String.format("need Real.class but got %s",
                                                                       order.getGeneratedType());
  }

  private LommelPolynomialNode<D, C, F> loadFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, functionFieldName, LommelPolynomial.class);
    return this;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.insideInitializer = false;

    loadFieldOntoStack(mv, elementFieldName, RationalFunction.class);

    arg.generate(mv, resultType);

    Compiler.loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);

    loadOutputVariableOntoStack(mv, resultType);

    if (RationalFunction.class.equals(expression.coDomainType))
    {
      loadOutputVariableOntoStack(mv, resultType);
      expression.loadThisFieldOntoStack(mv, elementFieldName, RationalFunction.class);
      Compiler.invokeMethod(mv,
                            RationalFunction.class,
                            "set",
                            RationalFunction.class,
                            false,
                            RationalFunction.class);
      generatedType = RationalFunction.class;
      // assert false : "todo: just return element";
    }
    else
    {
      invokeMethod(mv,
                   RationalFunction.class,
                   "evaluate",
                   resultType,
                   false,
                   resultType,
                   int.class,
                   int.class,
                   resultType);
    }

    return mv;
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    order.accept(t);
    index.accept(t);
    arg.accept(t);
    t.accept(this);
  }

  @Override
  public boolean isScalar()
  {
    return false;
  }

  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    throw new UnsupportedOperationException("Integration of Lommel polynomials is not implemented");
  }

  @Override
  public Node<D, C, F> derivative(VariableNode<D, C, F> variable)
  {
    throw new UnsupportedOperationException("Differentiation of Lommel polynomials is not implemented");
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(order, index, arg);
  }

  @Override
  public String toString()
  {
    return String.format("R(%s,%s;%s)", order, index, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("R_{%s, %s}(%s)", order.typeset(), index.typeset(), arg.typeset());
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    order    = order.substitute(variable, arg);
    index    = index.substitute(variable, arg);
    this.arg = this.arg.substitute(variable, arg);
    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    LommelPolynomialNode<E, S, G> newVar = new LommelPolynomialNode<>(newExpression);
    newVar.arg   = arg.spliceInto(newExpression);
    newVar.order = order.spliceInto(newExpression);
    return newVar;
  }

  @Override
  public char symbol()
  {
    return 'R';
  }

  @Override
  public boolean isConstant()
  {
    return order.isConstant() && index.isConstant() && arg.isConstant();
  }

}