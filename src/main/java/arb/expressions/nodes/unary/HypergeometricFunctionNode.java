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
    newNode.elementFieldName       = elementFieldName;
    newNode.fieldName              = fieldName;
    newNode.functionName           = functionName;
    newNode.argFunctionFieldName   = argFunctionFieldName;
    newNode.indeterminateFieldName = indeterminateFieldName;
    newNode.arg                    = arg.spliceInto(newExpression);
    newNode.α                      = α.spliceInto(newExpression);
    newNode.β                      = β.spliceInto(newExpression);
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

  public Class<?> hypergeometricFunctionClass()
  {
    return isPolynomial() ? (isReal() ? RealHypergeometricPolynomialFunction.class
                                   : isComplex() ? ComplexHypergeometricPolynomialFunction.class
                                   : null)
                          : (isReal() ? RationalHypergeometricFunction.class
                                   : isComplex() ? ComplexRationalHypergeometricFunction.class
                                   : null);
  }

  public boolean αβDependsOnInput()
  {
    return α.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.independentVariable);
  }

  public boolean  argumentDependsOnInput;

  public String   elementFieldName;

  public String   argFunctionFieldName;

  String          indeterminateFieldName;

  public Class<?> argFunctionClass;

  public boolean isRational()
  {
    return RationalFunction.class.isAssignableFrom(expression.coDomainType)
                  || ComplexRationalFunction.class.isAssignableFrom(expression.coDomainType);
  }

  public boolean isPolynomial()
  {
    return RealPolynomial.class.isAssignableFrom(expression.coDomainType)
                  || ComplexPolynomial.class.isAssignableFrom(expression.coDomainType);
  }

  public boolean isReal()
  {
    return Real.class.equals(scalarType()) || Fraction.class.equals(scalarType())
                  || Integer.class.equals(scalarType());
  }

  public boolean isComplex()
  {
    return Complex.class.equals(scalarType()) || ComplexFraction.class.equals(scalarType());
  }

  public Class<?> scalarType()
  {
    return Compiler.scalarType(expression.coDomainType);
  }

  public Class<?> nullaryFunctionClass()
  {
    return isPolynomial() ? isReal() ? RealPolynomialNullaryFunction.class
                                     : ComplexPolynomialNullaryFunction.class
                       : isReal() ? RationalNullaryFunction.class
                       : ComplexRationalNullaryFunction.class;
  }

  public Class<?> inputDependentArgFunctionClass;

  public boolean isNullaryFunctionOrHasScalarCodomain()
  {
    return expression.isNullaryFunction() || hasScalarCodomain();
  }

  public boolean hasScalarCodomain()
  {
    return expression.hasScalarCodomain() || expression.isFunctional();
  }

  private Class<?>                elementType;

  public FunctionMapping<?, ?, ?> argFunctionMapping;

  public Class<?> functionalType()
  {
    return isPolynomial() ? isReal() ? RealPolynomial.class : ComplexPolynomial.class
                       : isReal() ? RationalFunction.class : ComplexRationalFunction.class;
  }

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

    var isReal    = isReal();
    var isComplex = isComplex();

    fieldName              =
              expression.newIntermediateVariable("hyp", hypergeometricFunctionClass(), true);

    argumentDependsOnInput = arg.dependsOn(expression.independentVariable);

    if (isNullaryFunctionOrHasScalarCodomain())
    {
      elementType = expression.coDomainType;
      if (isRational())
      {
        elementType = isReal ? RationalFunction.class : isComplex ? ComplexRationalFunction.class
                             : null;
      }
      else if (isPolynomial())
      {
        elementType = isReal ? RealPolynomial.class : isComplex ? ComplexPolynomial.class : null;
      }
      else
      {
        // Scalar output: element is the rational function that will be evaluated
        elementType = isReal ? RationalFunction.class : isComplex ? ComplexRationalFunction.class
                             : null;
      }
      elementFieldName = expression.newIntermediateVariable("element", elementType);
    }
    else
    {
      elementFieldName = null;
    }

    if (argumentDependsOnInput && hasScalarCodomain())
    {
      indeterminateFieldName = expression.newIntermediateVariable("indeterminate",
                                                                  functionalType(),
                                                                  true);
      expression.registerInitializer(this::generateIndeterminateInitializer);
    }

    compileArgFunction();

    if (!αβDependsOnInput())
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }
  }

  public void generateIndeterminateInitializer(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, indeterminateFieldName, functionalType());
    generateVirtualMethodInvocation(mv, functionalType(), "identity", functionalType());
    mv.visitInsn(POP); // identity() returns this, discard
  }

  @SuppressWarnings("unchecked")
  protected void compileArgFunction()
  {
    Class<?> argDomainType;
    Class<?> argCoDomainType;

    if (argumentDependsOnInput)
    {
      // Arg depends on input: compile as Function<FunctionalType, FunctionalType>
      argDomainType    = functionalType();
      argCoDomainType  = functionalType();
      argFunctionClass = Function.class;
    }
    else
    {
      // Arg is constant: compile as NullaryFunction returning functional type
      argDomainType    = Object.class;
      argCoDomainType  = functionalType();
      argFunctionClass = nullaryFunctionClass();
    }

    var argExpression = new Expression<>(argDomainType,
                                         argCoDomainType,
                                         (Class<Function<?, ?>>) argFunctionClass);

    argExpression.className          = expression.className + "Arg" + System.identityHashCode(this);
    argExpression.context            = expression.context;
    argExpression.upstreamExpression = expression;

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
        argExpression.pushIndeterminateVariable(splicedVar);
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
    expression.insideInitializerOrConstructor = true;

    loadHypergeometricFunctionOntoStack(mv);
    generateInitCall(mv);
    mv.visitInsn(POP);

    if (isNullaryFunctionOrHasScalarCodomain())
    {
      boolean canEvaluateInInitializer = !argumentDependsOnInput
                    || (argumentDependsOnInput && hasScalarCodomain());

      if (canEvaluateInInitializer)
      {
        loadHypergeometricFunctionOntoStack(mv);

        if (argumentDependsOnInput)
        {
          expression.loadThisFieldOntoStack(mv, indeterminateFieldName, functionalType());
        }
        else
        {
          mv.visitInsn(ACONST_NULL);
        }

        mv.visitLdcInsn(1);
        loadBitsOntoStack(mv);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);

        generateEvaluateMethodInvocation(mv);
        mv.visitInsn(POP); // Discard evaluate() return (element populated via parameter)
      }
    }

    expression.insideInitializerOrConstructor = false;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.insideInitializerOrConstructor = false;

    if (αβDependsOnInput())
    {
      loadHypergeometricFunctionOntoStack(mv);
      generateInitCall(mv);
      mv.visitInsn(POP); // Discard init() return

      if (isNullaryFunctionOrHasScalarCodomain())
      {
        loadHypergeometricFunctionOntoStack(mv);

        if (argumentDependsOnInput)
        {
          expression.loadThisFieldOntoStack(mv, indeterminateFieldName, functionalType());
        }
        else
        {
          mv.visitInsn(ACONST_NULL);
        }

        mv.visitLdcInsn(1);
        loadBitsOntoStack(mv);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        generateEvaluateMethodInvocation(mv);
        mv.visitInsn(POP); // Discard evaluate() return
      }
      else
      {
        // Cases 5 & 7: evaluate directly to result
        loadHypergeometricFunctionOntoStack(mv);

        if (argumentDependsOnInput)
        {
          // Case 7: domain is C, pass actual input
          loadInputParameter(mv);
        }
        else
        {
          // Case 5: pass null
          mv.visitInsn(ACONST_NULL);
        }

        mv.visitLdcInsn(1);
        loadBitsOntoStack(mv);
        loadOutputOntoStack(mv, resultType);
        generateEvaluateMethodInvocation(mv);
        cast(mv, resultType);
        return mv;
      }
    }
    else if (argumentDependsOnInput && !hasScalarCodomain())
    {
      loadHypergeometricFunctionOntoStack(mv);
      loadInputParameter(mv);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      loadOutputOntoStack(mv, resultType);
      generateEvaluateMethodInvocation(mv);
      cast(mv, resultType);
      return mv;
    }

    if (isNullaryFunctionOrHasScalarCodomain())
    {
      if (resultType.equals(elementType))
      {
        // Result type matches element type, just copy
        loadOutputOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        Compiler.invokeSetMethod(mv, resultType, resultType);
      }
      else
      {
        // Scalar output: evaluate element at scalar input point
        loadOutputOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        cast(mv, elementType);
        loadInputParameter(mv);
        cast(mv, expression.domainType);
        loadOrderParameter(mv);
        loadBitsOntoStack(mv);
        loadOutputOntoStack(mv, resultType);
        generateEvaluateMethodInvocation(mv,
                                         resultType,
                                         expression.domainType,
                                         expression.coDomainType);
        cast(mv, resultType);
      }
    }
    else
    {
      // Cases 1,5 without scalar codomain: direct evaluate (should have been handled
      // above)
      loadHypergeometricFunctionOntoStack(mv);
      mv.visitInsn(ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      loadOutputOntoStack(mv, resultType);
      generateEvaluateMethodInvocation(mv);
      cast(mv, resultType);
    }

    return mv;
  }

  public void generateEvaluateMethodInvocation(MethodVisitor mv,
                                               Class<?> resultType,
                                               Class<? extends D> domain,
                                               Class<? extends R> coDomainType)
  {
    generateVirtualMethodInvocation(mv,
                        elementType,
                        "evaluate",
                        resultType,
                        domain,
                        int.class,
                        int.class,
                        coDomainType);
  }

  public MethodVisitor generateEvaluateMethodInvocation(MethodVisitor mv)
  {
    return generateEvaluateMethodInvocation(mv, hypergeometricFunctionClass());
  }

  public MethodVisitor generateEvaluateMethodInvocation(MethodVisitor mv, Class<?> type)
  {
    return generateVirtualMethodInvocation(mv,
                               type,
                               "evaluate",
                               Object.class,
                               Object.class,
                               int.class,
                               int.class,
                               Object.class);
  }

  protected void generateInitCall(MethodVisitor mv)
  {
    var scalarType = scalarType();
    α.generate(mv, scalarType);
    β.generate(mv, scalarType);

    Class<?> actualFieldType = argFunctionMapping.type();
    expression.loadThisFieldOntoStack(mv, argFunctionFieldName, actualFieldType);

    // Call the appropriate init overload based on arg dependency
    Class<?> argParamType = argumentDependsOnInput ? Function.class : nullaryFunctionClass();

    generateVirtualMethodInvocation(mv,
                        hypergeometricFunctionClass(),
                        "init",
                        hypergeometricFunctionClass(),
                        scalarType,
                        scalarType,
                        argParamType);
  }

  protected void loadHypergeometricFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, fieldName, hypergeometricFunctionClass());
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
