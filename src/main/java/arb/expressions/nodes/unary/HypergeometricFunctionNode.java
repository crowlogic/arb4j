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

  public Node<D, R, F>            α;
  public Node<D, R, F>            β;
  public Class<?>                 hypergeometricFunctionClass;
  /**
   * Whether the Pochhammer parameters α or β depend on the independent variable.
   * When true, init() must be called in generate() rather than in the class initializer.
   */
  public boolean                  αβDependsOnInput;
  /**
   * Whether the argument expression (e.g., -x² in pFq([...],[...];-x²)) depends
   * on the independent variable. When true, the arg function is Function<C,C>
   * rather than NullaryFunction.
   * 
   * For scalar codomain with argumentDependsOnInput, we use an indeterminate
   * field (polynomial representing x) as input to compute symbolically.
   */
  public boolean                  argumentDependsOnInput;
  public String                   elementFieldName;
  public String                   argFunctionFieldName;
  /**
   * Field name for the indeterminate (polynomial x) used when
   * argumentDependsOnInput && hasScalarCodomain. This allows symbolic
   * computation: argFunc(x) → z, then series(z) → element, then element(y) → result.
   */
  public String                   indeterminateFieldName;
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

    // Cases 4 & 8: argumentDependsOnInput with scalar codomain needs indeterminate
    if (argumentDependsOnInput && hasScalarCodomain)
    {
      indeterminateFieldName = expression.newIntermediateVariable("indeterminate", functionalType, true);
      expression.registerInitializer(this::generateIndeterminateInitializer);
    }

    compileArgFunction();

    // Register class initializer for Cases 1-4 (αβ constant)
    // Cases 1,2: init() + evaluate(null)
    // Case 3: init() only (evaluate in generate with domain input)
    // Case 4: init() + evaluate(indeterminate)
    if (!αβDependsOnInput)
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }
  }

  /**
   * Generate code to initialize the indeterminate field to identity polynomial.
   * Called in class initializer for Cases 4 & 8.
   */
  public void generateIndeterminateInitializer(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, indeterminateFieldName, functionalType);
    invokeVirtualMethod(mv, functionalType, "identity", functionalType);
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

  /**
   * Generate class initializer code for Cases 1-4 (αβ constant).
   * 
   * Case 1: init() + evaluate(null) → direct return
   * Case 2: init() + evaluate(null) → element populated
   * Case 3: init() only (evaluate needs domain input from caller)
   * Case 4: init() + evaluate(indeterminate) → element populated symbolically
   */
  public void generateHypergeometricFunctionInitializer(MethodVisitor mv)
  {
    expression.insideInitializer = true;
    
    // Always call init() for Cases 1-4
    loadHypergeometricFunctionOntoStack(mv);
    generateInitCall(mv);
    mv.visitInsn(POP); // Discard init() return
    
    // Call evaluate() to populate element when appropriate
    // Cases 1,2: !argumentDependsOnInput → pass null
    // Case 4: argumentDependsOnInput && hasScalarCodomain → pass indeterminate
    // Case 3: argumentDependsOnInput && !hasScalarCodomain → skip (needs domain input)
    if (isNullaryFunctionOrHasScalarCodomain)
    {
      boolean canEvaluateInInitializer = !argumentDependsOnInput 
                                         || (argumentDependsOnInput && hasScalarCodomain);
      
      if (canEvaluateInInitializer)
      {
        loadHypergeometricFunctionOntoStack(mv);
        
        if (argumentDependsOnInput)
        {
          // Case 4: pass indeterminate for symbolic computation
          expression.loadThisFieldOntoStack(mv, indeterminateFieldName, functionalType);
        }
        else
        {
          // Cases 1,2: pass null (NullaryFunction ignores input)
          mv.visitInsn(ACONST_NULL);
        }
        
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
        mv.visitInsn(POP); // Discard evaluate() return (element populated via parameter)
      }
    }
    
    expression.insideInitializer = false;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.insideInitializer = false;

    // Cases 5-8: αβDependsOnInput, must call init() here
    // Case 3: argumentDependsOnInput && !hasScalarCodomain, must call evaluate() here
    if (αβDependsOnInput)
    {
      // Cases 5-8: call init() in generate()
      loadHypergeometricFunctionOntoStack(mv);
      generateInitCall(mv);
      mv.visitInsn(POP); // Discard init() return

      if (isNullaryFunctionOrHasScalarCodomain)
      {
        // Cases 6 & 8: need to populate element
        loadHypergeometricFunctionOntoStack(mv);
        
        if (argumentDependsOnInput)
        {
          // Case 8: pass indeterminate for symbolic computation
          expression.loadThisFieldOntoStack(mv, indeterminateFieldName, functionalType);
        }
        else
        {
          // Case 6: pass null (NullaryFunction ignores input)
          mv.visitInsn(ACONST_NULL);
        }
        
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
        invokeVirtualMethod(mv,
                            hypergeometricFunctionClass,
                            "evaluate",
                            Object.class,
                            Object.class,
                            int.class,
                            int.class,
                            Object.class);
        cast(mv, resultType);
        return mv;
      }
    }
    else if (argumentDependsOnInput && !hasScalarCodomain)
    {
      // Case 3: αβ constant (init in initializer), but need evaluate() here with domain input
      loadHypergeometricFunctionOntoStack(mv);
      loadInputParameter(mv);
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
      return mv;
    }

    // Cases 1,2,4,6,8 with scalar codomain: element already populated, evaluate at scalar input
    // Cases 1,5 without scalar codomain: already handled above
    if (isNullaryFunctionOrHasScalarCodomain)
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
    else
    {
      // Cases 1,5 without scalar codomain: direct evaluate (should have been handled above)
      loadHypergeometricFunctionOntoStack(mv);
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
