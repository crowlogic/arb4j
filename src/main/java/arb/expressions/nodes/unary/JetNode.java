package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.*;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Abstract base for jet-backed special function nodes. A {@link JetNode} sits
 * in the expression tree at every position where a jet-backed special function
 * appears. It reads a single Taylor coefficient from a shared polynomial jet
 * buffer computed once per {@code evaluate()} call via an evaluation stamp.
 * 
 * <p>
 * When {@link #differentiate} is called, it returns a new {@link JetNode} of
 * the same concrete subclass with {@code coefficientIndex + 1}, sharing the
 * same {@link JetState}. The series routine already computes all the
 * derivatives; differentiation just advances the read index.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class JetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionNode<D, C, F>
{
  protected int      coefficientIndex;
  protected JetState sharedState;

  /**
   * Parsing constructor — creates a new jet node with coefficientIndex=0 and a
   * fresh {@link JetState}.
   */
  protected JetNode(String functionName, Expression<D, C, F> expression)
  {
    super(functionName,
          expression.resolve(),
          expression.require(')'));
    this.coefficientIndex = 0;
    this.sharedState      = new JetState(functionName,
                                         arg.toString(),
                                         Complex.class.equals(scalarType(expression.coDomainType)));
  }

  /**
   * Differentiation/splice constructor — creates a jet node sharing an existing
   * {@link JetState} at the specified coefficient index.
   */
  protected JetNode(String functionName, Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                    JetState sharedState)
  {
    super(functionName,
          arg,
          expression);
    this.coefficientIndex = coefficientIndex;
    this.sharedState      = sharedState;
    sharedState.updateMax(coefficientIndex);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    // This node is the Taylor coefficient f⁽ᵏ⁾(g(v))/k! at index k of the
    // series jet, so by the chain rule
    //
    // d/dv [f⁽ᵏ⁾(g(v))/k!] = (k+1)·[f⁽ᵏ⁺¹⁾(g(v))/(k+1)!]·g'(v)
    //
    // — the next coefficient scaled by (k+1) and by the derivative of the
    // argument. If g does not depend on the differentiation variable then
    // g'(v) = 0 and so is the product.
    if (!arg.dependsOn(variable))
    {
      return zero();
    }
    var next = newInstance(expression, arg, coefficientIndex + 1, sharedState);
    sharedState.updateMax(coefficientIndex + 1);
    Node<D, C, F> scaled = coefficientIndex == 0 ? next
                                                 : next.mul(new LiteralConstantNode<>(expression,
                                                                                      String.valueOf(coefficientIndex + 1)));
    Node<D, C, F> argDerivative = arg.differentiate(variable);
    return scaled.mul(argDerivative);
  }

  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    if (coefficientIndex > 0)
    {
      return newInstance(expression, arg, coefficientIndex - 1, sharedState);
    }
    return super.integral(variable);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    final Class<?> scalarType = scalarType(resultType);
    final boolean  isComplex  = Complex.class.equals(scalarType);
    final Class<?> polyClass  = isComplex ? ComplexPolynomial.class : RealPolynomial.class;

    String         internalName  = expression.internalName();

    // --- Ensure intermediate variables are registered ---
    if (!expression.hasIntermediateVariable(sharedState.jetFieldName))
    {
      expression.registerIntermediateVariable(sharedState.jetFieldName, polyClass, true);
    }
    if (!expression.hasIntermediateVariable(sharedState.argFieldName))
    {
      expression.registerIntermediateVariable(sharedState.argFieldName, polyClass, true);
    }

    // --- Stamp check: if (this.jetStamp_X != this.evalStamp) { computeJet(); }
    // ---
    Label skipCompute = new Label();

    // Load this.jetStamp_X
    loadThisOntoStack(mv);
    mv.visitFieldInsn(Opcodes.GETFIELD, internalName, sharedState.stampFieldName, "I");

    // Load this.evalStamp
    Compiler.getFieldFromThis(mv, internalName, "evalStamp", "I");

    // If equal, skip computation
    Compiler.jumpToIfEqual(mv, skipCompute);
    
    // --- Compute jet ---
    emitJetComputation(mv, scalarType, isComplex, polyClass, internalName);

    // Update stamp: this.jetStamp_X = this.evalStamp
    loadThisOntoStack(mv);
    Compiler.getFieldFromThis(mv, internalName, "evalStamp", "I" );
    Compiler.putField(mv, internalName, sharedState.stampFieldName, "I" );
   
    Compiler.designateLabel(mv, skipCompute);

    if (isRootNode && coefficientIndex == 0)
    {
      // Series mode: copy all `order` coefficients from the jet polynomial
      // into the result vector, matching the series contract.
      // for (int i = 0; i < order; i++) result.get(i).set(jetPoly.get(i))
      emitSeriesCopyLoop(mv, scalarType, polyClass, internalName);
    }
    else
    {
      // Scalar mode: read a single coefficient from the jet polynomial.
      loadOutputVariableOntoStack(mv, scalarType);

      expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                    sharedState.jetFieldName,
                                    polyClass.descriptorString());

      mv.visitLdcInsn(coefficientIndex);
      generateVirtualMethodInvocation(mv, polyClass, "get", scalarType, int.class);

      generateVirtualMethodInvocation(mv, scalarType, "set", scalarType, scalarType);
    }

    generatedType = scalarType;
    return mv;
  }

  /**
   * Emit bytecode for the jet computation block:
   * <ol>
   * <li>Set argPoly length to required = max(order, maxCoefficientNeeded+1)</li>
   * <li>argPoly.get(0).set(t)</li>
   * <li>argPoly.get(1).one()</li>
   * <li>Set jetPoly length to required</li>
   * <li>Call the series function</li>
   * </ol>
   */
  private void emitJetComputation(MethodVisitor mv, Class<?> scalarType, boolean isComplex, Class<?> polyClass,
                                  String internalName)
  {
    int maxCoeff = sharedState.getMaxCoefficientNeeded();
    // Minimum series length is 2: index 0 for the constant term (the point
    // value) and index 1 for the linear term (set to 1 as the jet seed).
    int minRequired = Math.max(maxCoeff + 1, 2);

    // Compute required = Math.max(order, minRequired)
    // Push order parameter
    loadOrderParameter(mv);
    // Push compile-time constant
    mv.visitLdcInsn(minRequired);
    // Math.max
    mv.visitMethodInsn(Opcodes.INVOKESTATIC, "java/lang/Math", "max", "(II)I", false);
    // Store required in a local
    int requiredSlot = expression.allocateLocalVariableSlot();
    mv.visitVarInsn(Opcodes.ISTORE, requiredSlot);

    // --- argPoly.fitLength(required) ---
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.argFieldName,
                                  polyClass.descriptorString());
    mv.visitVarInsn(Opcodes.ILOAD, requiredSlot);
    generateVirtualMethodInvocation(mv, polyClass, "fitLength", polyClass, int.class);
    pop(mv);

    // --- argPoly.setLength(required) ---
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.argFieldName,
                                  polyClass.descriptorString());
    mv.visitVarInsn(Opcodes.ILOAD, requiredSlot);
    generateVirtualMethodInvocation(mv, polyClass, "setLength", void.class, int.class);

    // --- argPoly.get(0).set(arg) ---
    // Generate the argument expression (e.g. ½+I*t) which evaluates to the
    // scalar type matching the polynomial element type, avoiding a raw cast
    // from the domain type (which may differ, e.g. Real→Complex).
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.argFieldName,
                                  polyClass.descriptorString());
    mv.visitInsn(Opcodes.ICONST_0);
    generateVirtualMethodInvocation(mv, polyClass, "get", scalarType, int.class);
    arg.generate(mv, scalarType);
    generateVirtualMethodInvocation(mv, scalarType, "set", scalarType, scalarType);
    pop(mv);

    // --- argPoly.get(1).one() ---
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.argFieldName,
                                  polyClass.descriptorString());
    mv.visitInsn(Opcodes.ICONST_1);
    generateVirtualMethodInvocation(mv, polyClass, "get", scalarType, int.class);
    generateVirtualMethodInvocation(mv, scalarType, "one", scalarType);
    pop(mv);

    // --- jetPoly.fitLength(required) ---
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.jetFieldName,
                                  polyClass.descriptorString());
    mv.visitVarInsn(Opcodes.ILOAD, requiredSlot);
    generateVirtualMethodInvocation(mv, polyClass, "fitLength", polyClass, int.class);
    pop(mv);

    // --- jetPoly.setLength(required) ---
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.jetFieldName,
                                  polyClass.descriptorString());
    mv.visitVarInsn(Opcodes.ILOAD, requiredSlot);
    generateVirtualMethodInvocation(mv, polyClass, "setLength", void.class, int.class);

    // --- Call series function: seriesFunction(jetPoly, argPoly, required, bits)
    // ---
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.jetFieldName,
                                  polyClass.descriptorString());
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.argFieldName,
                                  polyClass.descriptorString());
    mv.visitVarInsn(Opcodes.ILOAD, requiredSlot);
    loadBitsParameterOntoStack(mv);

    emitSeriesCall(mv, scalarType, isComplex);
  }

  /**
   * Emit a loop that copies all {@code order} coefficients from the jet
   * polynomial into the result vector:
   * <pre>
   * for (int i = 0; i < order; i++)
   *   result.get(i).set(jetPoly.get(i));
   * </pre>
   * This matches the series contract needed by callers like
   * {@code HardyThetaInversion.buildTaylorSeries}.
   */
  private void emitSeriesCopyLoop(MethodVisitor mv, Class<?> scalarType, Class<?> polyClass, String internalName)
  {
    int iSlot = expression.allocateLocalVariableSlot();

    Label loopStart = new Label();
    Label loopEnd   = new Label();

    // int i = 0
    mv.visitInsn(Opcodes.ICONST_0);
    mv.visitVarInsn(Opcodes.ISTORE, iSlot);

    // loop condition: i < order
    mv.visitLabel(loopStart);
    mv.visitVarInsn(Opcodes.ILOAD, iSlot);
    loadOrderParameter(mv);
    mv.visitJumpInsn(Opcodes.IF_ICMPGE, loopEnd);

    // result.get(i).set(jetPoly.get(i))
    loadResultParameter(mv);
    Compiler.cast(mv, scalarType);
    mv.visitVarInsn(Opcodes.ILOAD, iSlot);
    generateVirtualMethodInvocation(mv, scalarType, "get", scalarType, int.class);

    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  sharedState.jetFieldName,
                                  polyClass.descriptorString());
    mv.visitVarInsn(Opcodes.ILOAD, iSlot);
    generateVirtualMethodInvocation(mv, polyClass, "get", scalarType, int.class);

    generateVirtualMethodInvocation(mv, scalarType, "set", scalarType, scalarType);
    pop(mv);

    // i++
    mv.visitIincInsn(iSlot, 1);
    mv.visitJumpInsn(Opcodes.GOTO, loopStart);

    mv.visitLabel(loopEnd);

    // Leave result on the stack for the caller
    loadResultParameter(mv);
    Compiler.cast(mv, scalarType);
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> visitor)
  {
    if (arg != null)
    {
      arg.accept(visitor);
    }
    visitor.accept(this);
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return arg == null ? List.of() : List.of(arg);
  }

  /**
   * Emit the static method call for the series evaluation (e.g.,
   * {@code arb_poly_riemann_siegel_theta_series}). The stack already has
   * (jetPoly, argPoly, required, bits) when this is called.
   */
  protected abstract void emitSeriesCall(MethodVisitor mv, Class<?> scalarType, boolean isComplex);

  /**
   * Create a new instance of this concrete subclass with the given coefficient
   * index and shared state.
   */
  protected abstract JetNode<D, C, F> newInstance(Expression<D, C, F> expression, Node<D, C, F> arg,
                                                  int coefficientIndex, JetState sharedState);

  public int getCoefficientIndex()
  {
    return coefficientIndex;
  }

  public JetState getSharedState()
  {
    return sharedState;
  }

  public void setSharedState(JetState state)
  {
    this.sharedState = state;
  }

  public String structuralKey()
  {
    return sharedState.structuralKey;
  }

  @Override
  public boolean isEquivalentTo(Node<D, C, F> other)
  {
    if (!(other instanceof JetNode<D, C, F> o))
    {
      return false;
    }
    return sharedState == o.sharedState && coefficientIndex == o.coefficientIndex;
  }
}
