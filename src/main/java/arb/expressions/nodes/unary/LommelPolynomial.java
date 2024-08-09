package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadOrderParameter;
import static arb.expressions.Compiler.loadThisOntoStack;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.RationalFunction;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.functions.sequences.LommelPolynomialSequence;

public class LommelPolynomial<D, C, F extends Function<? extends D, ? extends C>>
                             extends
                             FunctionCall<D, C, F> implements
                             Cloneable
{
  public Node<D, C, F> order;
  public Node<D, C, F> index;
  public Class<?>      sequenceClass = LommelPolynomialSequence.class;
  public String        seqFieldName;
  public String        elementFieldName;

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

    // Allocate fields using newIntermediateVariable
    seqFieldName     = expression.newIntermediateVariable("seq", sequenceClass, true);       // Initialize in
                                                                                             // constructor
    elementFieldName = expression.newIntermediateVariable("element", RationalFunction.class);
  }

  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    generateEvaluateMethod(resultType, mv);
    return mv;
  }

  private void generateEvaluateMethod(Class<?> resultType, MethodVisitor mv)
  {
    // ... (initializer lambda remains the same)

    // In the evaluate method
    // Load the 'element' field
    loadThisOntoStack(mv);
    expression.loadFieldOntoStack(mv, elementFieldName, RationalFunction.class);

    // Evaluate the argument
    arg.generate(resultType, mv);

    // Load order and bits
    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);

    // Load the output variable
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

    // No need to load 'this' again, the result is already on the stack
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
    return String.format("R_{%s, %s} (%s)", order.typeset(), index.typeset(), arg.typeset());
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
    newVar.arg   = (Node<E, S, G>) arg.clone();
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