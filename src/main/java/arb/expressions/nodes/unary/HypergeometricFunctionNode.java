package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static org.objectweb.asm.Opcodes.ACONST_NULL;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.expressions.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.rational.*;
import arb.functions.real.RealFunction;

public class HypergeometricFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                       FunctionNode<D, R, F> implements
                                       Initializable
{

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
    newNode.elementFieldName     = elementFieldName;
    newNode.fieldName            = fieldName;
    newNode.functionName         = functionName;
    newNode.argFunctionFieldName = argFunctionFieldName;
    newNode.arg                  = arg.spliceInto(newExpression);
    newNode.α                    = α.spliceInto(newExpression);
    newNode.β                    = β.spliceInto(newExpression);
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

  public Node<D, R, F>            α;
  public Node<D, R, F>            β;
  public Class<?>                 hypergeometricFunctionClass;
  public boolean                  dependsOnInput;
  public boolean                  argDependsOnInput;
  public String                   elementFieldName;
  public String                   argFunctionFieldName;
  public Class<?>                 argFunctionClass;
  public boolean                  isRational;
  public boolean                  isReal;
  public boolean                  isComplex;
  public Class<?>                 scalarType;
  public Class<?>                 nullaryFunctionClass;
  public boolean                  isNullaryFunctionOrHasScalarCodomain;
  public boolean                  hasScalarCodomain;
  private Class<?>                elementType;
  private boolean                 isFunctional;
  public FunctionMapping<?, ?, ?> argFunctionMapping;

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
      throw new UnsupportedOperationException("polynomial functionals are not implemented");
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
                      expression.hasScalarCodomain() || expression.isFunctional();
    isNullaryFunctionOrHasScalarCodomain = expression.isNullaryFunction() || hasScalarCodomain;

    hypergeometricFunctionClass          =
                                isReal ? RationalHypergeometricFunction.class
                                       : isComplex ? ComplexRationalHypergeometricFunction.class
                                       : null;

    nullaryFunctionClass                 =
                         isReal ? RationalNullaryFunction.class
                                : isComplex ? ComplexRationalNullaryFunction.class : null;

    fieldName                            =
              expression.newIntermediateVariable("hyp", hypergeometricFunctionClass, true);

    dependsOnInput                       = α.dependsOn(expression.independentVariable)
                  || α.dependsOn(expression.getIndeterminateVariable())
                  || β.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.getIndeterminateVariable());

    argDependsOnInput                    = arg.dependsOn(expression.independentVariable)
                  || arg.dependsOn(expression.getIndeterminateVariable());

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
    }
    else
    {
      elementFieldName = null;
    }

    compileArgFunction();

    if (!dependsOnInput)
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }
  }

  @SuppressWarnings("unchecked")
  protected void compileArgFunction()
  {
    Class<?> argDomainType;
    Class<?> argCoDomainType;

    if (argDependsOnInput)
    {
      argFunctionClass = isReal ? RealFunction.class : isComplex ? ComplexFunction.class : null;
      argDomainType    = scalarType;
      argCoDomainType  = scalarType;
    }
    else
    {
      argFunctionClass = nullaryFunctionClass;
      argDomainType    = Object.class;
      argCoDomainType  = isReal ? RationalFunction.class : isComplex ? ComplexRationalFunction.class
                                : null;
    }

    var argExpression = new Expression<>(argDomainType,
                                         argCoDomainType,
                                         (Class<Function<?, ?>>) argFunctionClass);

    argExpression.className           =
                            expression.className + "Arg" + System.identityHashCode(this);
    argExpression.context             = expression.context;
    argExpression.ascendentExpression = expression;

    if (argDependsOnInput && expression.independentVariable != null)
    {
      argExpression.independentVariable = expression.independentVariable.spliceInto(argExpression)
                                                                        .asVariable();
    }

    // CRITICAL: Splice the already-parsed AST node directly - NO STRING CONVERSION
    argExpression.rootNode          = arg.spliceInto(argExpression);
    argExpression.rootNode.isResult = true;
    argExpression.updateStringRepresentation();
    argExpression.generate();

    argFunctionMapping   = expression.registerSubexpression(argExpression);
    argFunctionFieldName = argFunctionMapping.functionName;
    expression.referencedFunctions.put(argFunctionFieldName, argFunctionMapping);
  }

  public void generateHypergeometricFunctionInitializer(MethodVisitor mv)
  {
    expression.insideInitializer = true;
    loadHypergeometricFunctionOntoStack(mv);
    initializeHypergeometricFunction(mv);
    if (isNullaryFunctionOrHasScalarCodomain)
    {
      loadHypergeometricFunctionOntoStack(mv);
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
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.insideInitializer = false;

    boolean loadedHypergeometricFunction = false;

    if (dependsOnInput)
    {
      loadedHypergeometricFunction = true;
      loadHypergeometricFunctionOntoStack(mv);
      initializeHypergeometricFunction(mv);
    }

    if (!isNullaryFunctionOrHasScalarCodomain)
    {
      if (!loadedHypergeometricFunction)
      {
        loadHypergeometricFunctionOntoStack(mv);
      }
      mv.visitInsn(ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      loadOutputOntoStack(mv, resultType);
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
        loadOutputOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        Compiler.invokeSetMethod(mv, resultType, resultType);
      }
      else
      {
        loadOutputOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        cast(mv, elementType);
        loadInputParameter(mv);
        cast(mv, expression.domainType);
        loadOrderParameter(mv);
        loadBitsOntoStack(mv);
        loadOutputOntoStack(mv, resultType);
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
      α.generate(mv, scalarType);
      β.generate(mv, scalarType);

      // MUST use the mapping's actual type - NOT argFunctionClass (interface)
      Class<?> actualFieldType = argFunctionMapping.type();
      expression.loadThisFieldOntoStack(mv, argFunctionFieldName, actualFieldType);

      // But for invokeVirtualMethod, use the interface that init() expects
      invokeVirtualMethod(mv,
                          hypergeometricFunctionClass,
                          "init",
                          hypergeometricFunctionClass,
                          scalarType,
                          scalarType,
                          argFunctionClass);  // interface is OK for method signature
      return mv;
  }


  protected void loadHypergeometricFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, fieldName, hypergeometricFunctionClass);
  }

  protected void loadOutputOntoStack(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;
    if (isResult)
    {
      cast(loadResultParameter(mv), resultType);
    }
    else
    {
      expression.allocateIntermediateVariable(mv, resultType);
    }
  }
}
