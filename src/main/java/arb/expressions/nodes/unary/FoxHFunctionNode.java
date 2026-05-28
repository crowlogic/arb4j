package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static org.objectweb.asm.Opcodes.POP;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Complex;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.complex.FoxHFunction;

/**
 * AST node for the Fox H-function call
 *
 * <pre>
 *   FoxH( m, n, a, A, b, B; z )
 * </pre>
 *
 * where {@code m} and {@code n} are any expressions evaluating to
 * {@link Integer}, {@code a} and {@code b} are any expressions evaluating
 * to {@link Complex} vectors, {@code A} and {@code B} are any expressions
 * evaluating to {@link Real} vectors, and {@code z} is any expression
 * evaluating to {@link Complex}.
 *
 * <p>Modeled on {@link HypergeometricFunctionNode}: seven resolved sub-nodes,
 * an intermediate field of type {@link FoxHFunction}, and an
 * {@code init(\u2026).evaluate(\u2026)} emission pattern.</p>
 *
 * @author Stephen Crowley \u00a92025-2026
 * @see BusinessSourceLicenseVersionOnePointOne \u00a9 terms of the
 *      {@link TheArb4jLibrary}
 */
public class FoxHFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              FunctionNode<D, R, F> implements
                              Initializable
{

  public Node<D, R, F> m, n;
  public Node<D, R, F> a, A;
  public Node<D, R, F> b, B;

  public String        elementFieldName;

  public FoxHFunctionNode(Expression<D, R, F> expression)
  {
    this(expression, true);
  }

  public FoxHFunctionNode(Expression<D, R, F> expression, boolean parseAndInitialize)
  {
    super("FoxH", null, expression);
    if (parseAndInitialize)
    {
      parse();
      initialize();
    }
  }

  public void parse()
  {
    m   = expression.resolve();
    n   = expression.require(',').resolve();
    a   = expression.require(',').resolve();
    A   = expression.require(',').resolve();
    b   = expression.require(',').resolve();
    B   = expression.require(',').resolve();
    arg = expression.require(',', ';').resolve();
    expression.require(')');
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(m, n, a, A, b, B, arg);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return super.dependsOn(variable)
        || m.dependsOn(variable) || n.dependsOn(variable)
        || a.dependsOn(variable) || A.dependsOn(variable)
        || b.dependsOn(variable) || B.dependsOn(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    var newNode = new FoxHFunctionNode<E, S, G>(newExpression, false);
    newNode.elementFieldName     = elementFieldName;
    newNode.fieldName            = fieldName;
    newNode.functionName         = functionName;
    newNode.m                    = m.spliceInto(newExpression);
    newNode.n                    = n.spliceInto(newExpression);
    newNode.a                    = a.spliceInto(newExpression);
    newNode.A                    = A.spliceInto(newExpression);
    newNode.b                    = b.spliceInto(newExpression);
    newNode.B                    = B.spliceInto(newExpression);
    newNode.arg                  = arg.spliceInto(newExpression);
    newNode.initialize();
    return newNode;
  }

  @Override
  public String getFieldName()
  {
    return elementFieldName;
  }

  @Override
  public String toString()
  {
    return String.format("FoxH(%s,%s,%s,%s,%s,%s;%s)", m, n, a, A, b, B, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("H^{%s,%s}_{%s,%s}\\!\\left(%s\\,\\Big|\\,\\begin{matrix}(%s,%s)\\\\(%s,%s)\\end{matrix}\\right)",
                         n.typeset(), m.typeset(), a.dim(), b.dim(),
                         arg.typeset(),
                         a.typeset(), A.typeset(),
                         b.typeset(), B.typeset());
  }

  public boolean parametersDependOnInput()
  {
    var v = expression.getIndependentVariable();
    return m.dependsOn(v) || n.dependsOn(v)
        || a.dependsOn(v) || A.dependsOn(v)
        || b.dependsOn(v) || B.dependsOn(v);
  }

  @Override
  public void initialize()
  {
    fieldName        = expression.newIntermediateVariable("foxh", FoxHFunction.class, true);
    elementFieldName = expression.newIntermediateVariable("element", Complex.class);

    if (!parametersDependOnInput())
    {
      expression.registerInitializer(this::generateFoxHFunctionInitializer);
    }
  }

  public void generateFoxHFunctionInitializer(MethodVisitor mv)
  {
    expression.generationContext = GenerationContext.Initialization;

    loadFoxHFunctionOntoStack(mv);
    generateInitCall(mv);
    mv.visitInsn(POP);

    expression.generationContext = GenerationContext.Evaluation;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.generationContext = GenerationContext.Evaluation;

    if (parametersDependOnInput())
    {
      loadFoxHFunctionOntoStack(mv);
      generateInitCall(mv);
      mv.visitInsn(POP);
    }

    // Evaluate: foxh.evaluate(z, 1, bits, element)
    loadFoxHFunctionOntoStack(mv);
    arg.generate(mv, Complex.class);   // evaluates the arg sub-expression, leaves Complex z on stack
    mv.visitLdcInsn(1);
    loadBitsOntoStack(mv);
    loadOutputOntoStack(mv, resultType);
    generateEvaluateMethodInvocation(mv);
    cast(mv, resultType);
    return mv;
  }

  protected void generateInitCall(MethodVisitor mv)
  {
    m.generate(mv, Integer.class);
    n.generate(mv, Integer.class);
    a.generate(mv, Complex.class);
    A.generate(mv, Real.class);
    b.generate(mv, Complex.class);
    B.generate(mv, Real.class);

    generateVirtualMethodInvocation(mv,
                                    FoxHFunction.class,
                                    "init",
                                    FoxHFunction.class,
                                    Integer.class, Integer.class,
                                    Complex.class, Real.class,
                                    Complex.class, Real.class);
  }

  public MethodVisitor generateEvaluateMethodInvocation(MethodVisitor mv)
  {
    return generateVirtualMethodInvocation(mv, FoxHFunction.class,
                                           "evaluate",
                                           Complex.class,
                                           Complex.class, int.class, int.class, Complex.class);
  }

  protected void loadFoxHFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisAndFieldOntoStack(mv, fieldName, FoxHFunction.class);
  }

  protected void loadOutputOntoStack(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;
    if (isRootNode)
    {
      cast(loadResultParameter(mv), resultType);
    }
    else
    {
      expression.allocateIntermediateVariable(mv, resultType);
    }
  }
}
