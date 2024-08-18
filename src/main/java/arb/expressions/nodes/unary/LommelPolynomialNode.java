package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.loadThisOntoStack;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.sequences.LommelPolynomialSequence;

/**
 * Syntax: "R(v,n;z)" which corresponds to a {@link LommelPolynomialSequence}
 * with the {@link LommelPolynomialSequence#v} set and then
 * 
 * assigns {@link LommelPolynomialNode#elementFieldName} the specific
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
public class LommelPolynomialNode<D, C, F extends Function<? extends D, ? extends C>>
                                 extends
                                 FunctionCallNode<D, C, F>
{
  public Node<D, C, F>  order;
  public Node<D, C, F>  index;
  public final Class<?> sequenceClass = LommelPolynomialSequence.class;
  public String         seqFieldName;
  public String         elementFieldName;
  public Class<?>       scalarType;

  public LommelPolynomialNode(Expression<D, C, F> expression)
  {
    super("R",
          null,
          expression);
    order = expression.resolve();
    index = expression.require(',').resolve();
    arg   = expression.require(';').resolve();
    expression.require(')');
    scalarType       = Compiler.scalarType(expression.coDomainType);
    seqFieldName     = expression.newIntermediateVariable("seq", sequenceClass, true);
    elementFieldName = expression.newIntermediateVariable("element", RationalFunction.class, true);

    if (Expression.trace)
    {
      System.out.println("seqFieldName=" + seqFieldName);
      System.out.println("elementFieldName=" + elementFieldName);
    }

    expression.registerInitializer(this::generateSequenceInitializer);
  }

  public void generateSequenceInitializer(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, seqFieldName, sequenceClass);
    Compiler.getField(mv, sequenceClass, "v", Real.class);
    expression.insideInitializer = true;
    order.generate(mv, Real.class);
    Compiler.invokeMethod(mv, Real.class, "set", Real.class, false, Real.class);

    expression.loadThisFieldOntoStack(mv, seqFieldName, sequenceClass);
    index.generate(mv, Integer.class);
    mv.visitLdcInsn(0);
    mv.visitLdcInsn(128);
    expression.loadThisFieldOntoStack(mv, elementFieldName, RationalFunction.class);

    Compiler.invokeVirtualMethod(mv,
                                 sequenceClass,
                                 "evaluate",
                                 RationalFunction.class,
                                 Integer.class,
                                 int.class,
                                 int.class,
                                 RationalFunction.class);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.insideInitializer = false;
    loadThisOntoStack(mv);
    expression.loadFieldOntoStack(mv, elementFieldName, RationalFunction.class);

    // Evaluate the argument
    //expression.insideInitializer = true;
    arg.generate(mv, resultType);

    Compiler.loadOrderParameter(mv);
    Compiler.loadBitsParameterOntoStack(mv);

    // Load the output variable
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
  public Node<D, C, F> integral(Variable<D, C, F> variable)
  {
    throw new UnsupportedOperationException("Integration of Lommel polynomials is not implemented");
  }

  @Override
  public Node<D, C, F> derivative(Variable<D, C, F> variable)
  {
    throw new UnsupportedOperationException("Differentiation of Lommel polynomials is not implemented");
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(order, index, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("R_{%s, %s} (%s)", order.typeset(), index.typeset(), arg.typeset());
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
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