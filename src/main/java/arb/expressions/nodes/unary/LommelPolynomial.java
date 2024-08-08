package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.functions.sequences.LommelPolynomialSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomial<D, C, F extends Function<? extends D, ? extends C>>
                             extends
                             FunctionCall<D, C, F> implements
                             Cloneable
{
  Node<D, C, F>    order;
  Node<D, C, F>    index;
  private Class<?> sequenceClass = LommelPolynomialSequence.class;
  private String   seqFieldName;

  public LommelPolynomial(Expression<D, C, F> expression)
  {
    super("R",
          null,
          expression);
    order = expression.resolve();
    expression.require(',');
    index = expression.resolve();
    expression.require(';');
    arg = expression.resolve();
    expression.require(')');
  }

  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    generateSequenceInitialization(mv);
    generateEvaluateMethod(resultType, mv);
    return mv;
  }

  private void generateSequenceInitialization(MethodVisitor mv)
  {
    expression.registerInitializer(methodVisitor ->
    {
      constructNewObject(methodVisitor, sequenceClass);
      duplicateTopOfTheStack(methodVisitor);

      // Generate order
      order.generate(Real.class, methodVisitor);

      // Invoke LommelPolynomialSequence constructor
      invokeConstructor(methodVisitor, sequenceClass, Real.class);

      // Store the sequence in a field
      seqFieldName = expression.newIntermediateVariable("seq", sequenceClass);
      expression.putField(methodVisitor, seqFieldName, sequenceClass);
    });
  }

  private void generateEvaluateMethod(Class<?> resultType, MethodVisitor mv)
  {
    expression.registerInitializer(methodVisitor ->
    {
      // Load the sequence
      expression.loadFieldOntoStack(methodVisitor, seqFieldName, LommelPolynomialSequence.class);

      expression.loadThisFieldOntoStack(methodVisitor, seqFieldName, sequenceClass);

      // Generate index
      index.generate(Integer.class, methodVisitor);

      // Load bits
      loadBitsParameterOntoSTack(methodVisitor);

      // Call sequence.evaluate
      invokeMethod(methodVisitor,
                   sequenceClass,
                   "evaluate",
                   RationalFunction.class,
                   false,
                   Integer.class,
                   int.class);

      // Store the result in an intermediate variable
      String resultFieldName = expression.newIntermediateVariable("result", RationalFunction.class);
      expression.putField(methodVisitor, resultFieldName, RationalFunction.class);
    });

    // Evaluate the argument
    arg.generate(resultType, mv);
    loadOrderParameter(mv);
    loadBitsParameterOntoSTack(mv);
    loadOutputVariableOntoStack(mv, resultType);

    // Call evaluate on the RationalFunction
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
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    throw new UnsupportedOperationException("Lommel polynomial is not reusable");
  }

  @Override
  public String typeset()
  {
    return String.format("$R_{%s, %s} (%s)$", order.typeset(), index.typeset(), arg.typeset());
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return false;
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

  @SuppressWarnings("unchecked")
  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    LommelPolynomial<E, S, G> newVar = new LommelPolynomial<>(newExpression);
    newVar.arg = (Node<E, S, G>) arg.clone();
    newVar.order = (Node<E, S, G>) order.clone();
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