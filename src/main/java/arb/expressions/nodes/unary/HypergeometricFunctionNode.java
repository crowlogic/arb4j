package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static org.objectweb.asm.Opcodes.ACONST_NULL;
import static org.objectweb.asm.Opcodes.POP;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.expressions.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.HypergeometricFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.*;
import arb.functions.rational.*;

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
  /**
   * Whether the Pochhammer parameters α or β depend on the independent variable.
   * When true but argumentDependsOnInput is false, we can still use evaluate(null,...)
   * because the arg function is a NullaryFunction that ignores its input.
   */
  public boolean                  αβDependsOnInput;
  /**
   * Whether the argument expression (e.g., -x² in pFq([...],[...];-x²)) depends
   * on the independent variable. When true, the arg function is Function<T,T>
   * and REQUIRES a polynomial/rational input - passing null will cause NPE,
   * and passing the scalar input will cause ClassCastException.
   * 
   * NOTE: The argumentDependsOnInput case with scalar codomain requires
   * HypergeometricFunction.evaluate() to create an identity polynomial when
   * input is null. This is not yet implemented.
   */
  public boolean                  argumentDependsOnInput;
  public String                   elementFieldName;
  public String                   argFunctionFieldName;
  public Class<?>                 argFunctionClass;
  public boolean                  isRational;
  public boolean                  isPolynomial;
  public boolean                  isReal;
  public boolean                  isComplex;
  public Class<?>                 scalarType;
  public Class<?>                 nullaryFunctionClass;
  public Class<?>                 inputDependentArgFunctionClass;
  public boolean                  isNullaryFunctionOrHasScalarCodomain;
  public boolean                  hasScalarCodomain;
  private Class<?>                elementType;
  private boolean                 isFunctional;
  public FunctionMapping<?, ?, ?> argFunctionMapping;
  public Class<?>                 functionalType;

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

    isPolynomial                         =
                 RealPolynomial.class.isAssignableFrom(expression.coDomainType)
                               || ComplexPolynomial.class.isAssignableFrom(expression.coDomainType);

    isReal                               = Real.class.equals(scalarType)
                  || Fraction.class.equals(scalarType) || Integer.class.equals(scalarType);

    isComplex                            =
              Complex.class.equals(scalarType) || ComplexFraction.class.equals(scalarType);

    hasScalarCodomain                    =
                      expression.hasScalarCodomain() || expression.isFunctional();
    isNullaryFunctionOrHasScalarCodomain = expression.isNullaryFunction() || hasScalarCodomain;

    // Determine functional type (what the arg produces)
    if (isPolynomial)
    {
      functionalType       = isReal ? RealPolynomial.class : ComplexPolynomial.class;
      nullaryFunctionClass = isReal ? RealPolynomialNullaryFunction.class
                                    : ComplexPolynomialNullaryFunction.class;
    }
    else if (isRational)
    {
      functionalType       = isReal ? RationalFunction.class : ComplexRationalFunction.class;
      nullaryFunctionClass = isReal ? RationalNullaryFunction.class
                                    : ComplexRationalNullaryFunction.class;
    }
    else
    {
      // Scalar output still uses rational function internally
      functionalType       = isReal ? RationalFunction.class : ComplexRationalFunction.class;
      nullaryFunctionClass = isReal ? RationalNullaryFunction.class
                                    : ComplexRationalNullaryFunction.class;
    }

    // Select hypergeometric class based on output type (polynomial/rational) and
    // scalar type (real/complex)
    if (isPolynomial)
    {
      hypergeometricFunctionClass = isReal ? RealHypergeometricPolynomialFunction.class
                                           : ComplexHypergeometricPolynomialFunction.class;
    }
    else
    {
      // Both rational output AND scalar output use rational hypergeometric
      // For scalar: compute rational function, then evaluate at input point
      hypergeometricFunctionClass = isReal ? RationalHypergeometricFunction.class
                                           : ComplexRationalHypergeometricFunction.class;
    }

    fieldName         =
              expression.newIntermediateVariable("hyp", hypergeometricFunctionClass, true);

    αβDependsOnInput    = α.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.independentVariable);

    argumentDependsOnInput = arg.dependsOn(expression.independentVariable);

    if (isNullaryFunctionOrHasScalarCodomain)
    {
      elementType = expression.coDomainType;
      if (isRational)
      {
        elementType = isReal ? RationalFunction.class : ComplexRationalFunction.class;
      }
      else if (isPolynomial)
      {
        elementType = isReal ? RealPolynomial.class : ComplexPolynomial.class;
      }
      else
      {
        // Scalar output: element is the rational function that will be evaluated
        elementType = isReal ? RationalFunction.class : ComplexRationalFunction.class;
      }
      elementFieldName = expression.newIntermediateVariable("element", elementType);
    }
    else
    {
      elementFieldName = null;
    }

    compileArgFunction();

    if (!αβDependsOnInput && !argumentDependsOnInput)
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }
  }

  @SuppressWarnings("unchecked")
  protected void compileArgFunction()
  {
    Class<?> argDomainType;
    Class<?> argCoDomainType;

    if (argumentDependsOnInput)
    {
      // Arg depends on input: compile as Function<FunctionalType, FunctionalType>
      argDomainType    = functionalType;
      argCoDomainType  = functionalType;
      argFunctionClass = Function.class;
    }
    else
    {
      // Arg is constant: compile as NullaryFunction returning functional type
      argDomainType    = Object.class;
      argCoDomainType  = functionalType;
      argFunctionClass = nullaryFunctionClass;
    }

    var argExpression = new Expression<>(argDomainType,
                                         argCoDomainType,
                                         (Class<Function<?, ?>>) argFunctionClass);

    argExpression.className           =
                            expression.className + "Arg" + System.identityHashCode(this);
    argExpression.context             = expression.context;
    argExpression.ascendentExpression = expression;

    var independentVar = expression.independentVariable;
    if (independentVar != null)
    {
      var splicedVar = independentVar.spliceInto(argExpression).asVariable();
      if (argumentDependsOnInput)
      {
        argExpression.independentVariable = splicedVar;
      }
      else
      {
        splicedVar.isIndeterminate = true;
        splicedVar.reference.type  = argCoDomainType;
        argExpression.indeterminateVariables.push(splicedVar);
      }
    }

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
    generateInitCall(mv);
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

    if (αβDependsOnInput || argumentDependsOnInput)
    {
      loadedHypergeometricFunction = true;
      loadHypergeometricFunctionOntoStack(mv);
      generateInitCall(mv);

      // Only populate elementFieldName when arg is NullaryFunction (doesn't need input).
      // When argumentDependsOnInput, the arg function is Function<T,T> which requires
      // a polynomial/rational input. We cannot pass:
      // - null: causes NPE in arg function
      // - scalar input: causes ClassCastException (wrong type)
      // The argumentDependsOnInput case requires HypergeometricFunction.evaluate()
      // to create an identity polynomial when input is null (not yet implemented).
      if (isNullaryFunctionOrHasScalarCodomain && !argumentDependsOnInput)
      {
        mv.visitInsn(POP); // Discard init return value
        loadHypergeometricFunctionOntoStack(mv);
        mv.visitInsn(ACONST_NULL); // NullaryFunction ignores input, null is safe
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
        mv.visitInsn(POP); // evaluate writes to elementFieldName, discard return
      }
      // When argumentDependsOnInput or !isNullaryFunctionOrHasScalarCodomain,
      // leave init return on stack for subsequent processing
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
      // For argumentDependsOnInput case, we need to POP the init return if we haven't
      if (argumentDependsOnInput && loadedHypergeometricFunction)
      {
        mv.visitInsn(POP); // Discard init return value that was left on stack
      }
      
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

  protected void generateInitCall(MethodVisitor mv)
  {
    α.generate(mv, scalarType);
    β.generate(mv, scalarType);

    Class<?> actualFieldType = argFunctionMapping.type();
    expression.loadThisFieldOntoStack(mv, argFunctionFieldName, actualFieldType);

    // Call the appropriate init overload based on arg dependency
    Class<?> argParamType = argumentDependsOnInput ? Function.class : nullaryFunctionClass;

    invokeVirtualMethod(mv,
                        hypergeometricFunctionClass,
                        "init",
                        hypergeometricFunctionClass,
                        scalarType,
                        scalarType,
                        argParamType);
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
