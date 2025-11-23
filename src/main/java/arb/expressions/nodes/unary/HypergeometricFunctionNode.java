package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static org.objectweb.asm.Opcodes.ACONST_NULL;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.functions.Function;
import arb.functions.rational.*;

/**
 * https://github.com/crowlogic/arb4j/issues/527
 * 
 * <pre>
 * Refactor the current hypergeometric function implementation to use function
 * references for arguments. Current Approach
 * 
 * Perform substitution on the hypergeometric function argument. Traverse and
 * replace expression references. Rename variables as necessary.
 * 
 * Proposed Refactor
 * 
 * Use a function reference in the hypergeometric function definition. Compile
 * the function statically. Pass function references for instances, avoiding
 * substitutions and recompilations.
 * 
 * This change aims to improve performance and maintainability.
 * 
 * The numerator α and the denominator β parameters can be specified via the
 * {@link VectorNode} syntax like <code>F([1,n,1+n],[1],x)</code> or symbolically like
 * F(α,β,x) where α and β are {@link Real}s or {@link RealPolynomial}s for
 * instance where if they are {@link RealPolynomial}s then the coeffecients of
 * the polynomial are regarded as the parameters of the numerator or denominator
 * </pre>
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class HypergeometricFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                       FunctionNode<D, R, F> implements
                                       Initializable
{

  @Override
  public Node<D, R, F> fold()
  {
    return this;
  }

  @Override
  public String getFieldName()
  {
    return elementFieldName;
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(α, β, arg);
  }

  public String debugString()
  {
    return String.format("HypergeometricFunctionNode[α=%s, β=%s, hypergeometricFunctionClass=%s, dependsOnInput=%s, hypergeometricFunctionFieldName=%s, elementFieldName=%s, isFunctional=%s, isRational=%s, isReal=%s, isComplex=%s, scalarType=%s, nullaryFunctionClass=%s, isNullaryFunctionOrHasScalarCodomain=%s, hasScalarCodomain=%s, elementType=%s, expression.coDomainType=%s]",
                         α,
                         β,
                         hypergeometricFunctionClass,
                         dependsOnInput,
                         fieldName,
                         elementFieldName,
                         isFunctional,
                         isRational,
                         isReal,
                         isComplex,
                         scalarType,
                         nullaryFunctionClass,
                         isNullaryFunctionOrHasScalarCodomain,
                         hasScalarCodomain,
                         elementType,
                         expression.coDomainType);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return super.dependsOn(variable) || α.dependsOn(variable) || β.dependsOn(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var newNode = new HypergeometricFunctionNode<E, S, G>(newExpression,
                                                          false);
    newNode.elementFieldName = elementFieldName;
    newNode.fieldName        = fieldName;
    newNode.functionName     = functionName;
    newNode.arg              = arg.spliceInto(newExpression);
    newNode.α                = α.spliceInto(newExpression);
    newNode.β                = β.spliceInto(newExpression);
    newNode.initialize();
    return newNode;
  }

  @Override
  public String toString()
  {
    return String.format("pFq(%s,%s;%s)", α, β, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("{_%sF_%s}\\left(%s, %s ; %s\\right)",
                         α.dim(),
                         β.dim(),
                         α.typeset(),
                         β.typeset(),
                         arg.typeset());
  }

  public Node<D, R, F> α;

  public Node<D, R, F> β;

  public Class<?>      hypergeometricFunctionClass;

  public boolean       dependsOnInput;

  public String        elementFieldName;

  public boolean       isRational;

  public boolean       isReal;

  public boolean       isComplex;

  public Class<?>      scalarType;

  public Class<?>      nullaryFunctionClass;

  public boolean       isNullaryFunctionOrHasScalarCodomain;

  public boolean       hasScalarCodomain;

  private Class<?>     elementType;

  private boolean      isFunctional;

  public HypergeometricFunctionNode(Expression<D, R, F> expression)
  {
    this(expression,
         true);
  }

  public HypergeometricFunctionNode(Expression<D, R, F> expression, boolean parseAndInitialize)
  {
    super("pFq",
          null,
          expression);
    if (expression.coDomainType.equals(RealPolynomial.class))
    {
      throw new UnsupportedOperationException("polynomial functionals are not implemented since rational functionals are available");
    }
    if (parseAndInitialize)
    {
      parse();
      initialize();
    }

  }

  public void parse()
  {
    α   = expression.resolve();
    β   = expression.require(',').resolve();
    arg = expression.require(',', ';').resolve();
    expression.require(')');
  }

  public void initialize()
  {
    scalarType                           = Compiler.scalarType(expression.coDomainType);
    isFunctional                         = Function.class.isAssignableFrom(expression.coDomainType)
                  && expression.coDomainType.isInterface();
    isRational                           =
               RationalFunction.class.isAssignableFrom(expression.coDomainType)
                             || ComplexRationalFunction.class.isAssignableFrom(expression.coDomainType);

    isReal                               = Real.class.equals(scalarType)
                  || Fraction.class.equals(scalarType) || Integer.class.equals(scalarType);

    isComplex                            =
              Complex.class.equals(scalarType) || ComplexFraction.class.equals(scalarType);

    hasScalarCodomain                    =
                      expression.hasScalarCodomain() || (expression.isFunctional());

    isNullaryFunctionOrHasScalarCodomain = expression.isNullaryFunction() || hasScalarCodomain;

    var rationalClass = isReal ? RationalHypergeometricFunction.class
                               : isComplex ? ComplexRationalHypergeometricFunction.class : null;

    hypergeometricFunctionClass = rationalClass;

    var rationalNullaryClass = isReal ? RationalNullaryFunction.class
                                      : isComplex ? ComplexRationalNullaryFunction.class : null;

    nullaryFunctionClass = rationalNullaryClass;

    fieldName            =
              expression.newIntermediateVariable("hyp", hypergeometricFunctionClass, true);

    dependsOnInput       = α.dependsOn(expression.independentVariable)
                  || α.dependsOn(expression.indeterminantVariable)
                  || β.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.indeterminantVariable);

    if (isNullaryFunctionOrHasScalarCodomain)
    {
      elementType = expression.coDomainType;
      if (nullaryFunctionClass.equals(RationalNullaryFunction.class))
      {
        elementType = RationalFunction.class;
      }
      if (nullaryFunctionClass.equals(ComplexRationalNullaryFunction.class))
      {
        elementType = ComplexRationalFunction.class;
      }

      elementFieldName = expression.newIntermediateVariable("element", elementType);
      if (Expression.trace)
      {
        logger.debug(String.format("elementFieldName=%s of type %s",
                                   elementFieldName,
                                   elementType));

      }
    }
    else
    {
      elementFieldName = null;
      assert !isFunctional : "TODO: functional " + debugString();
    }

    if (!dependsOnInput)
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }
  }

  public void generateHypergeometricFunctionInitializer(MethodVisitor mv)
  {
    var previousInsideInitializerValue = expression.insideInitializer;
    assert previousInsideInitializerValue : "tried to generate initializer when not inside one";
    loadOutputVariableOntoStack(mv, type());
    initializeHypergeometricFunction(mv);
    if (isNullaryFunctionOrHasScalarCodomain)
    {
      loadOutputVariableOntoStack(mv, type());
      mv.visitInsn(ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);

      invokeVirtualMethod(mv,
                          hypergeometricFunctionClass,
                          "evaluate",
                          Object.class,
                          Object.class,
                          int.class,
                          int.class,
                          Object.class);

    }
    expression.insideInitializer = previousInsideInitializerValue;

  }

  /**
   * FIXME: use a function reference instead of variable substitution and compile
   * the expression in the static intializer
   * 
   * 
   * HOW: See {@link LommelPolynomialNode} for an example
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    if (Expression.trace)
    {
      logger.debug(String.format("pFq.generate(insideInitializer=%s, fieldName=%s, resultType=%s dependsOnInput=%s resultType=%s type()=%s hypergeometricFunctionClass=%s)\n",
                                 expression.insideInitializer,
                                 fieldName,
                                 resultType,
                                 dependsOnInput,
                                 resultType,
                                 type(),
                                 hypergeometricFunctionClass));
    }

    boolean loadedHypergeometricFunction = false;

    if (dependsOnInput)
    {
      loadedHypergeometricFunction = true;
      loadOutputVariableOntoStack(mv, resultType);
      initializeHypergeometricFunction(mv);
    }

    if (!isNullaryFunctionOrHasScalarCodomain)
    {
      if (!loadedHypergeometricFunction)
      {
        loadOutputVariableOntoStack(mv, resultType);
      }

      mv.visitInsn(ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      loadOutputVariableOntoStack(mv, resultType);
      invokeVirtualMethod(mv,
                          hypergeometricFunctionClass,
                          "evaluate",
                          Object.class,
                          Object.class,
                          int.class,
                          int.class,
                          Object.class);
      cast(mv, resultType);

    }
    else
    {
      if (resultType.equals(elementType))
      {
        loadOutputVariableOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);

        Compiler.invokeSetMethod(mv, resultType, resultType);
      }
      else
      {
        assert resultType.equals(expression.coDomainType) : String.format("TODO: handle resultType = %s != expression.coDomainType = %s",
                                                                          resultType,
                                                                          expression.coDomainType);
        loadOutputVariableOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        cast(mv, elementType);
        loadInputParameter(mv);
        cast(mv, expression.domainType);
        loadOrderParameter(mv);
        loadBitsOntoStack(mv);
        loadOutputVariableOntoStack(mv, resultType);
        invokeVirtualMethod(mv,
                            elementType,
                            "evaluate",
                            resultType,
                            expression.domainType,
                            int.class,
                            int.class,
                            expression.coDomainType);
        cast(mv, resultType);

      }

    }
    return mv;
  }

  protected MethodVisitor initializeHypergeometricFunction(MethodVisitor mv)
  {
    if (Expression.trace)
    {
      logger.debug(String.format("initializeHypergeometricFunction(alpha=%s, beta=%s, arg=%s)\n",
                                 α,
                                 β,
                                 arg));
    }
    α.generate(mv, scalarType);
    β.generate(mv, scalarType);
    mv.visitLdcInsn(arg.toString());
    invokeArgumentParsingMethod(mv);
    invokeHypergeometricFunctionInitializationMethod(mv);
    return mv;
  }

  protected void invokeArgumentParsingMethod(MethodVisitor mv)
  {
    invokeStaticMethod(mv, nullaryFunctionClass, "parse", Expression.class, String.class);
  }

  protected void invokeHypergeometricFunctionInitializationMethod(MethodVisitor mv)
  {
    invokeVirtualMethod(mv,
                        hypergeometricFunctionClass,
                        "init",
                        hypergeometricFunctionClass,
                        scalarType,
                        scalarType,
                        Expression.class);
  }

}
