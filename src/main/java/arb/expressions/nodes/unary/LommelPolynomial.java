package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.System.out;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.RationalFunction;
import arb.Real;
import arb.expressions.Compiler;
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
  public Node<D, C, F>  order;
  public Node<D, C, F>  index;
  public final Class<?> sequenceClass = LommelPolynomialSequence.class;
  public String         seqFieldName;
  public String         elementFieldName;

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

//    expression.registerInitializer(mv ->
//    {
//      initializeSequence(expression, mv);
//
//    });
  }

  public void initializeSequence(Expression<D, C, F> expression, MethodVisitor mv)
  {
    Compiler.loadThisOntoStack(mv);
    expression.loadFieldOntoStack(mv, seqFieldName, sequenceClass );
    expression.loadFieldOntoStack(mv, "v", Real.class);
    out.format("generating " + order );
    order.generate(mv, Real.class);

    Compiler.invokeMethod(mv, Real.class, "set", Real.class, false, Real.class);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    initializeSequence(expression, mv);
    // TODO: if thios is called from the initialize() method intead of the evalute() method then the 3rd local variable is not going to be the bits parameter

    loadThisOntoStack(mv);
    expression.loadFieldOntoStack(mv, elementFieldName, RationalFunction.class);

    // Evaluate the argument
    arg.generate(mv, resultType);

    // Load the output variable
    loadOutputVariableOntoStack(mv, resultType);

    // Call evaluate on the RationalFunction
    invokeMethod(mv, RationalFunction.class, "evaluate", resultType, false, resultType, resultType);

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