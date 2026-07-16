package arb.expressions.nodes;

import java.util.function.Consumer;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.GenerationContext;
import arb.functions.Function;
import arb.functions.NumericalComplexFunctionIntegral;
import arb.functions.NumericalRealFunctionIntegral;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

/**
 * A numerical (trapezoid-rule) definite integral, parsed by the function-form
 * keyword {@code nint}. Its existence is a deliberate user choice: unlike
 * {@link IntegralNode}, which attempts to find a symbolic antiderivative,
 * {@code nint} commits at parse time to a numerical evaluation strategy and
 * never falls back to symbolic integration.
 *
 * <pre>
 * nint(t➔f(t), t=a…b)            // default discretization N=1024
 * nint(t➔f(t), t=a…b, N=4096)    // explicit panel count
 * nint(t➔f(t), t=a…b, dt=0.001)  // explicit panel width
 * </pre>
 *
 * Exactly one of {@code N=} or {@code dt=} may be supplied. A different name
 * for the step (e.g. {@code dx=}, {@code du=}) matching the integration
 * variable letter is also accepted; the parser only requires a {@code d}
 * prefix.
 *
 * <p>The runtime is a {@link NumericalRealFunctionIntegral} or
 * {@link NumericalComplexFunctionIntegral} held as a generated-class field. Its
 * cumulative-trapezoid cache is shared across every evaluation of the enclosing
 * function, so repeated calls at increasing upper limit do only the tail work
 * since the previously-reached limit. This is the property that motivates
 * choosing the trapezoid rule over arblib's adaptive integrator: the cumulative
 * cache amortizes work across an outer parameter sweep.
 *
 * <p>The trapezoid rule's discretization is decoupled from the {@code bits}
 * parameter. {@code bits} controls the per-sample arithmetic precision, not the
 * quadrature error. The trapezoid error is {@code O((b-a)^3 * ||f''|| / N^2)};
 * matching it to {@code bits}-precision in finite memory is infeasible
 * (would require {@code N ~ 2^(bits/2)}), so {@code N} is an explicit caller
 * choice.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NumericalIntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                  IntegralNode<D, C, F>
{
  /** Default panel count when neither N= nor d&lt;var&gt;= is supplied. */
  public static final int DEFAULT_N         = 1024;

  /**
   * Per-sample arithmetic precision used at trapezoid-cache initialization
   * time. The {@code initialize()} method has no {@code bits} parameter, so a
   * fixed default is used to seed the cumulative cache. Subsequent
   * {@code evaluate()} calls run at the caller-supplied bits.
   */
  public static final int DEFAULT_INIT_BITS = 128;

  /** Generated-class field name holding the integrator instance. */
  public String                                          integratorFieldName;

  /** Mapping for the integrand sub-expression; declares its outer-class field. */
  protected FunctionMapping<?, ?, ? extends Function<?, ?>> integrandMapping;

  /** Resolved discretization: either N (panel count) or {@link Double#NaN}. */
  Node<D, C, F>           panelCountNode;

  /** Resolved discretization: either dt (panel width) or null. */
  Node<D, C, F>           panelWidthNode;

  public NumericalIntegralNode(Expression<D, C, F> expression)
  {
    super(expression,
          true);
    finishParsing();
  }

  /**
   * After {@link IntegralNode#parseFunctionForm} consumes the integrand and
   * the {@code var=lower…upper} range, the parser is positioned just before
   * the closing {@code )}. The standard form has already required and
   * consumed it; we cannot retroactively read a 4th argument from there.
   *
   * To support the optional 4th-argument syntax we override the function-form
   * parsing path: after the integrand subexpression is consumed via
   * {@link #parseIntegrandViaSubExpression(String)} and the range via
   * {@code var=lower…upper}, we look for {@code ,name=expr} before
   * {@code )}. This is implemented by intercepting in
   * {@link #parseFunctionForm(Expression)} via a custom override.
   *
   * Implementation note: the parent class consumed {@code )} already. We do
   * not re-enter the parser here; instead, the optional fourth argument must
   * be parsed by {@link #parseFunctionForm} itself. See override below.
   */
  protected void finishParsing()
  {
    if (!isDefiniteIntegral())
    {
      throw new CompilerException("nint(...) requires a definite integration range "
                                  + "(use the form nint(t➔f(t), t=a…b)): "
                                  + this);
    }

    Class<?> resultType = expression.coDomainType;
    Class<?> integratorType;
    if (Real.class.equals(resultType))
    {
      integratorType = NumericalRealFunctionIntegral.class;
    }
    else if (Complex.class.equals(resultType))
    {
      integratorType = NumericalComplexFunctionIntegral.class;
    }
    else
    {
      throw new CompilerException("nint(...) is only supported for codomains Real or Complex; "
                                  + "got " + resultType);
    }

    this.integratorFieldName = expression.newIntermediateVariable("nint", integratorType, true);

    // Give the integrand sub-expression a unique class name so it does not
    // collide with the enclosing outer expression's class name (the parent
    // IntegralNode does the same trick for its indefinite-integral expression).
    integrandExpression.setClassName("nintIntegrand_" + integrandExpression.className());
    // Bind the integrand to the outer expression's context so its compiled
    // class is loaded by the same ExpressionClassLoader as the outer class.
    // Without this, the integrand goes into a fresh ClassLoader, and the
    // outer's bytecode-generated PUTFIELD on the integrand's protected
    // `context` field is rejected at runtime as a cross-ClassLoader
    // protected-access violation (this is the same propagation pattern
    // SumNode uses for its operandExpression).
    integrandExpression.setContext(expression.getContext());
    integrandExpression.compile();

    // Register the integrand sub-expression so its function instance is
    // declared and instantiated as a field on the generated outer class.
    @SuppressWarnings({ "unchecked", "rawtypes" })
    FunctionMapping<?, ?, ? extends Function<?, ?>> mapping =
        (FunctionMapping) expression.registerSubexpression(integrandExpression);
    this.integrandMapping = mapping;
    expression.registerReferencedFunction(mapping.functionName, mapping);

    // Do NOT register the integrator init() as an initialize()-time hook.
    // The integrand may reference free variables from the outer expression's
    // scope (e.g. ν, x). Those are propagated to the integrand's instance
    // fields by the standard upstream-input-variable propagation, which
    // runs at evaluate() time, not at initialize() time. Calling init()
    // during initialize() would pre-sample the trapezoid grid before the
    // integrand's free-variable fields are wired, producing NPE on first
    // sample. Instead, init() is emitted at the head of generate() — see
    // generate() — so the cumulative cache is seeded once per evaluate()
    // call, after all free variables have been wired.
  }

  /**
   * Override the parent's function-form parser to additionally accept an
   * optional {@code , N=expr} or {@code , d<var>=expr} 4th argument before
   * the closing {@code )}.
   */
  @Override
  protected VariableNode<D, C, F> parseFunctionForm(Expression<D, C, F> expression)
  {
    String arrowVar = expression.parseExplicitInputVariableIfPresent();

    parseIntegrandViaSubExpression(arrowVar);

    var reference = expression.require(',').parseVariableReference();
    integrationVariableName = reference.name;

    VariableNode<D, C, F> inputVariableNode = integrandExpression.newVariableNode(reference);
    integrandExpression.assignInputVariable(inputVariableNode);
    integrandNode.resolveVariables();

    if (expression.nextCharacterIs('='))
    {
      lowerLimitNode = expression.resolve();
      upperLimitNode = expression.require('…').resolve();
    }

    if (expression.nextCharacterIs(','))
    {
      String keyword = expression.parseName();
      expression.require('=');
      Node<D, C, F> value = expression.resolve();

      if ("N".equals(keyword))
      {
        panelCountNode = value;
      }
      else if (keyword.length() >= 2 && keyword.charAt(0) == 'd')
      {
        panelWidthNode = value;
      }
      else
      {
        throw new CompilerException("expected 'N=' or 'd<var>=' as the 4th argument of nint(...) "
                                    + "but got '" + keyword + "='");
      }
    }
    expression.require(')');

    return inputVariableNode;
  }

  /**
   * Emit the bytecode that runs at the head of {@code evaluate()} on the
   * generated outer class. Calls
   * {@code this.<nintField>.init(this.<integrandField>, lower, dt, bits)}
   * which seeds the cumulative cache at j=0 and binds the integrand.
   *
   * <p>This must run at evaluate() time, not initialize() time: the
   * integrand may close over outer-scope free variables (e.g. ν, x), and
   * those instance fields on the integrand are wired by the standard
   * upstream-input-variable propagation only at evaluate() time. Running
   * init() before that wiring would NPE on the first integrand sample.
   */
  protected void generateIntegratorInitializer(MethodVisitor mv)
  {
    Class<?> codomain      = expression.coDomainType;
    boolean  isComplex     = Complex.class.equals(codomain);
    Class<?> integratorCls = isComplex ? NumericalComplexFunctionIntegral.class
                                       : NumericalRealFunctionIntegral.class;
    Class<?> integrandCls  = isComplex ? RealToComplexFunction.class : RealFunction.class;

    // Stack: this.<integratorField>
    expression.loadThisAndFieldOntoStack(mv, integratorFieldName, integratorCls);

    // Stack: integrandFunction — emit GETFIELD with the OUTER class as the
    // owner. {@link FunctionMapping#loadReferenceOntoStack} would use the
    // integrand sub-expression's className as the GETFIELD owner (it is
    // designed for use from inside the sub-expression's own generated code),
    // which produces a verifier failure here because we are inside the outer
    // class's evaluate() method. The integrand field lives on the outer
    // class — use that classname as the GETFIELD owner instead.
    expression.loadThisAndFieldOntoStack(mv,
                                         integrandMapping.functionName,
                                         integrandMapping.functionFieldDescriptor());

    // Stack: lower (as double)
    pushDoubleFromNode(mv, lowerLimitNode);

    // Stack: dt (as double)
    pushDtAsDouble(mv);

    // Stack: bits (as int) — use the caller-supplied `bits` parameter from
    // the surrounding evaluate(…, int bits, …). This matches the precision
    // requested for the result.
    Compiler.loadBitsParameterOntoStack(mv);

    // Invoke init(source, a, dt, bits) — returns this; pop the return.
    Compiler.generateVirtualMethodInvocation(mv,
                                             integratorCls,
                                             "init",
                                             integratorCls,
                                             integrandCls,
                                             double.class,
                                             double.class,
                                             int.class);
    mv.visitInsn(org.objectweb.asm.Opcodes.POP);
  }

  /**
   * Emit evaluate-time bytecode that copies free variables referenced by
   * the integrand from the outer expression's evaluate-time scope into the
   * integrand instance's matching variable fields. Two cases:
   *
   * <ol>
   *   <li><b>The outer's independent variable.</b> Lives in the evaluate()
   *       parameter slot, not as a field on the outer class. Loaded via
   *       {@link Compiler#loadInputParameter} and {@code .set()} into the
   *       integrand's matching var field. Models on
   *       {@link arb.expressions.nodes.nary.NAryOperationNode#generateCodeToPropagateIndependentVariableToOperand}.</li>
   *   <li><b>Upstream input variables that ARE fields on the outer class.</b>
   *       Field-to-field copy by value. Models on
   *       {@link arb.expressions.nodes.nary.NAryOperationNode#generateCodeToPropagateIndependentUpstreamVariablesToOperand}.</li>
   * </ol>
   *
   * The integrand's own integration variable (e.g. {@code t}) is NOT
   * propagated here — it is bound per-sample by the integrator at each
   * trapezoid panel. Context variables are also skipped: they are
   * propagated by the standard {@code propagateContext} initializer.
   */
  protected void propagateUpstreamVariablesToIntegrand(MethodVisitor mv)
  {
    Expression<?, ?, ?>          integrand              = integrandExpression;
    String                       integrandInternalName  = integrand.internalName();
    String                       integrandFieldDesc     = integrandMapping.functionFieldDescriptor();
    String                       integrandFieldName     = integrandMapping.functionName;

    var                          outerIndependent    = expression.getIndependentVariable();
    String                       outerIndependentName =
        outerIndependent == null ? null : outerIndependent.getName();

    for (var entry : integrand.getReferencedVariables().entrySet())
    {
      String varName = entry.getKey();
      var    varNode = entry.getValue();

      // Skip the integrand's own integration variable — bound per-sample
      // by the trapezoid integrator, not by us.
      if (varNode.isIndependent)
      {
        continue;
      }

      Class<?> varType = varNode.type();
      if (varType == null || varType.equals(Object.class))
      {
        continue;
      }

      // Skip context variables — handled by the standard context
      // propagation in initialize().
      if (expression.getContext() != null && expression.getContext().getVariable(varName) != null)
      {
        continue;
      }

      String varDesc = varType.descriptorString();

      // ── Null-guarded allocate of integrand.<varName> if needed ──
      // Stack: empty
      Label fieldNotNull = new Label();
      expression.loadThisAndFieldOntoStack(mv, integrandFieldName, integrandFieldDesc);
      // Stack: integrand
      mv.visitFieldInsn(Opcodes.GETFIELD, integrandInternalName, varName, varDesc);
      // Stack: integrand.<varName>|null
      mv.visitJumpInsn(Opcodes.IFNONNULL, fieldNotNull);

      // Null branch: integrand.<varName> = new VarType()
      expression.loadThisAndFieldOntoStack(mv, integrandFieldName, integrandFieldDesc);
      Compiler.generateNewObjectInstruction(mv, varType);
      Compiler.duplicateTopOfTheStack(mv);
      Compiler.invokeDefaultConstructor(mv, varType);
      mv.visitFieldInsn(Opcodes.PUTFIELD, integrandInternalName, varName, varDesc);

      mv.visitLabel(fieldNotNull);

      // ── Copy by value: integrand.<varName>.set(<source>) ──
      // Load destination: integrand.<varName>
      expression.loadThisAndFieldOntoStack(mv, integrandFieldName, integrandFieldDesc);
      mv.visitFieldInsn(Opcodes.GETFIELD, integrandInternalName, varName, varDesc);

      // Load source — either the evaluate() input parameter (if this is
      // the outer's independent variable) or a field on the outer class.
      if (outerIndependentName != null && varName.equals(outerIndependentName))
      {
        Compiler.cast(Compiler.loadInputParameter(mv), varType);
      }
      else
      {
        expression.loadThisAndFieldOntoStack(mv, varName, varType);
      }

      Compiler.generateVirtualMethodInvocation(mv, varType, "set", varType, varType);
      mv.visitInsn(Opcodes.POP);
    }
  }

  /**
   * Push the value of a numeric Node as a primitive {@code double} on the
   * stack.
   */
  protected void pushDoubleFromNode(MethodVisitor mv, Node<D, C, F> node)
  {
    node.generate(mv, Real.class);
    Compiler.generateVirtualMethodInvocation(mv, Real.class, "getMid", arb.Float.class);
    Compiler.generateVirtualMethodInvocation(mv, arb.Float.class, "doubleValue", double.class);
  }

  /**
   * Push the trapezoid grid step {@code dt} as a primitive double on the
   * stack. If the user supplied {@code dt=}, evaluate that node; otherwise
   * compute {@code (b-a)/N} from the panel-count node, defaulting to
   * {@link #DEFAULT_N} when neither was supplied.
   */
  protected void pushDtAsDouble(MethodVisitor mv)
  {
    if (panelWidthNode != null)
    {
      pushDoubleFromNode(mv, panelWidthNode);
      return;
    }

    pushDoubleFromNode(mv, upperLimitNode);
    pushDoubleFromNode(mv, lowerLimitNode);
    mv.visitInsn(org.objectweb.asm.Opcodes.DSUB);

    if (panelCountNode != null)
    {
      pushDoubleFromNode(mv, panelCountNode);
    }
    else
    {
      mv.visitLdcInsn((double) DEFAULT_N);
    }
    mv.visitInsn(org.objectweb.asm.Opcodes.DDIV);
  }

  /**
   * Emit bytecode for {@code F(b) - F(a)} where {@code F} is the cumulative
   * trapezoid integrator field.
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.generationContext = GenerationContext.Evaluation;

    Class<?> codomain      = expression.coDomainType;
    boolean  isComplex     = Complex.class.equals(codomain);
    Class<?> integratorCls = isComplex ? NumericalComplexFunctionIntegral.class
                                       : NumericalRealFunctionIntegral.class;

    if (Expression.trace)
    {
      mv.visitLdcInsn("NINT EVAL");
      Compiler.emitLogInfo(mv, expression.internalName());
    }

    // Wire the integrand instance's free-variable fields from the outer
    // expression's evaluate-time inputs BEFORE seeding the trapezoid grid.
    // Without this, init() would pre-sample with null `this.x` (or any
    // other outer-scope variable the integrand closes over) and NPE on
    // the first sample. This is the same evaluate-time pattern that
    // NAryOperationNode.propagateInputToOperand uses for sum/product
    // operands; nint must do it explicitly because its integrand is held
    // as a long-lived field on the outer class rather than constructed
    // by generateFunctionalElement at each evaluate().
    propagateUpstreamVariablesToIntegrand(mv);

    // Seed the cumulative trapezoid cache here, at evaluate() time, AFTER
    // free-variable propagation has wired the integrand's instance fields.
    // The init() call binds (integrand, lower, dt, bits) and pre-samples
    // F[0..N]. It is idempotent for repeated evaluate() calls with the
    // same parameter values, but is re-run on every evaluate() so that a
    // change to an outer free variable like ν is reflected in the grid.
    generateIntegratorInitializer(mv);

    String tmpFieldName = expression.newIntermediateVariable("nintTmp", resultType, true);

    // tmp = integrator.evaluate(upper, 1, bits, tmp)
    expression.loadThisAndFieldOntoStack(mv, integratorFieldName, integratorCls);
    upperLimitNode.generate(mv, Real.class);
    Compiler.loadOrderParameter(mv);
    Compiler.loadBitsParameterOntoStack(mv);
    expression.loadThisAndFieldOntoStack(mv, tmpFieldName, resultType);
    Compiler.generateVirtualMethodInvocation(mv,
                                             integratorCls,
                                             "evaluate",
                                             resultType,
                                             Real.class,
                                             int.class,
                                             int.class,
                                             resultType);
    mv.visitInsn(org.objectweb.asm.Opcodes.POP); // discard the returned reference; tmp field holds the value

    // result = integrator.evaluate(lower, 1, bits, result)
    expression.loadThisAndFieldOntoStack(mv, integratorFieldName, integratorCls);
    lowerLimitNode.generate(mv, Real.class);
    Compiler.loadOrderParameter(mv);
    Compiler.loadBitsParameterOntoStack(mv);
    loadOutputVariableOntoStack(mv, resultType);
    Compiler.generateVirtualMethodInvocation(mv,
                                             integratorCls,
                                             "evaluate",
                                             resultType,
                                             Real.class,
                                             int.class,
                                             int.class,
                                             resultType);
    // Stack top: result reference (returned by evaluate at lower)

    // result = tmp - result  ⟶  loaded as: tmp.sub(result, bits, result)
    expression.loadThisAndFieldOntoStack(mv, tmpFieldName, resultType);
    loadOutputVariableOntoStack(mv, resultType);
    Compiler.loadBitsParameterOntoStack(mv);
    loadOutputVariableOntoStack(mv, resultType);
    Compiler.generateVirtualMethodInvocation(mv,
                                             resultType,
                                             "sub",
                                             resultType,
                                             resultType,
                                             int.class,
                                             resultType);

    if (Expression.trace)
    {
      mv.visitLdcInsn("NINT DONE");
      Compiler.emitLogInfo(mv, expression.internalName());
    }

    generatedType = resultType;
    return mv;
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  /**
   * The whole point of {@code nint} is that the user has explicitly chosen
   * numerical (trapezoid) evaluation. We must inhibit the symbolic
   * constant-folding optimizer ({@link Node#replaceConstantNodes()}) from
   * wrapping this node in a {@link arb.expressions.nodes.StaticNode} whose
   * value would be obtained by {@code evaluate()}-on-the-symbolic-form ahead
   * of code generation — that path bypasses our overridden {@link #generate}
   * and silently produces a (possibly wrong, possibly zero) result instead
   * of running the trapezoid integrator at runtime.
   *
   * <p>Returning {@code false} here makes constant-folding skip this node
   * entirely. We still recurse into the integrand limits so any constant
   * sub-trees there are folded normally.
   */
  @Override
  public boolean isConstant()
  {
    return false;
  }

  /**
   * The parent {@link IntegralNode#simplify()} computes a symbolic
   * antiderivative and substitutes the limits, replacing this node with
   * {@code F(b) - F(a)}. That is exactly what {@code nint} exists to
   * <em>not</em> do. Returning {@code this} keeps the numerical-integration
   * node in the tree so that {@link #generate} runs at code-generation time.
   */
  @Override
  public Node<D, C, F> simplify()
  {
    return this;
  }

  @Override
  public Node<D, C, F> replaceConstantNodes()
  {
    if (lowerLimitNode != null)
    {
      lowerLimitNode = lowerLimitNode.replaceConstantNodes();
    }
    if (upperLimitNode != null)
    {
      upperLimitNode = upperLimitNode.replaceConstantNodes();
    }
    if (panelCountNode != null)
    {
      panelCountNode = panelCountNode.replaceConstantNodes();
    }
    if (panelWidthNode != null)
    {
      panelWidthNode = panelWidthNode.replaceConstantNodes();
    }
    return this;
  }

  /**
   * Visit only the limits and panel parameters — <em>not</em> the
   * {@code integrandNode} or {@code integrationVariableNode}. Those belong to
   * the separately-compiled integrand expression ({@link #integrandExpression})
   * and its own AST is managed independently. Including them here would leak
   * the integrand's internal variable and constant nodes into the outer
   * expression's {@code nodeStream()}, causing
   * {@link Expression#replaceConstantNodes} to hoist them into
   * {@code StaticNode}s that reference the integrand's class name as the
   * field owner — producing a {@code VerifyError} in
   * {@code evaluateStaticSubexpressions} because the static-subexpression
   * method runs on the outer class, not the integrand class.
   */
  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    if (lowerLimitNode != null)
    {
      lowerLimitNode.accept(t);
    }
    if (upperLimitNode != null)
    {
      upperLimitNode.accept(t);
    }
    if (panelCountNode != null)
    {
      panelCountNode.accept(t);
    }
    if (panelWidthNode != null)
    {
      panelWidthNode.accept(t);
    }
    t.accept(this);
  }

  @Override
  public String toString()
  {
    StringBuilder sb = new StringBuilder("nint(");
    sb.append(integrandNode);
    sb.append(", ").append(integrationVariableName);
    if (lowerLimitNode != null && upperLimitNode != null)
    {
      sb.append("=").append(lowerLimitNode).append("…").append(upperLimitNode);
    }
    if (panelCountNode != null)
    {
      sb.append(", N=").append(panelCountNode);
    }
    else if (panelWidthNode != null)
    {
      sb.append(", d").append(integrationVariableName).append("=").append(panelWidthNode);
    }
    sb.append(")");
    return sb.toString();
  }

  @Override
  public String typeset()
  {
    return String.format("\\int_{%s}^{%s} %s\\,d%s",
                         lowerLimitNode == null ? "" : lowerLimitNode.typeset(),
                         upperLimitNode == null ? "" : upperLimitNode.typeset(),
                         integrandNode == null ? "" : integrandNode.typeset(),
                         integrationVariableName);
  }
}
