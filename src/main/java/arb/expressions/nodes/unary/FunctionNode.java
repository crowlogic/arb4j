package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.*;
import java.util.function.Consumer;

import org.objectweb.asm.*;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.Context;
import arb.expressions.nodes.*;
import arb.functions.Function;

/**
 * {@link FunctionNode} is a {@link Node} in the {@link Expression} that
 * represents a call to either a builtin or a contextual function, a contextual
 * function call being one that has been constructed by passing a
 * {@link Context} to
 * {@link arb.functions.Function#express(Class, Class, String)} or calling
 * {@link Context#registerFunctionMapping(String, Function, Class, Class)}. A
 * built-in function is one that is a member of the type of the domain or
 * codomain of the function, such as {@link Real#tanh(int, Real)}. <br>
 * <br>
 * A contextual function is one that is shared thru a mutual {@link Context} by
 * constructing one and passing it to the
 * {@link Function#express(Class, Class, String, Context)} function or one of
 * the other variations of the express function that accepts a {@link Context}
 * argument. <br>
 * <br>
 * For the function to be callable from another function via a shared
 * {@link Context} either the
 * {@link Function#express(Class, Class, String, String, Context)} or
 * {@link Function#express(Class, Class, String, String, Context)} methods that
 * accepts another {@link String} argument specifying the name of the function
 * should be used or you can prepend the expression "x->x^2" with "F:x->x^2" so
 * that the functions name as it is known by in the {@link Context} <br>
 * <br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         UnaryOperationNode<D, R, F>
{

  @Override
  public boolean isSquareRoot()
  {
    return "sqrt".equals(functionName);
  }

  @Override
  public Node<D, R, F> getSquareRootArg()
  {
    assert isSquareRoot() : this + " is not a square root";
    return arg;
  }

  @Override
  public Node<D, R, F> simplify()
  {
    if (arg != null)
    {
      arg = arg.simplify();
    }
    if ("sqrt".equals(functionName))
    {
      return arg.pow(expression.newLiteralConstant("½"));
    }
    else
    {
      return this;
    }
  }

  public FunctionNode(Expression<D, R, F> expression,
                      FunctionMapping<?, ?, ?> newIntegralFunctionMapping,
                      Node<D, R, F> arg)
  {
    this(newIntegralFunctionMapping.functionName,
         arg,
         expression);
    this.mapping = newIntegralFunctionMapping;
  }

  @Override
  public int hashCode()
  {
    final int prime  = 31337;
    int       result = super.hashCode();
    result = prime * result + Objects.hash(functionName);
    return result;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    FunctionNode<?, ?, ?> other = (FunctionNode<?, ?, ?>) obj;
    return super.equals(obj) && Objects.equals(functionName, other.functionName);
  }

  static final HashSet<String>  bitlessFunctions                   = new HashSet<>();

  public static HashSet<String> complexFunctionsWithComplexResults =
                                                                   new HashSet<>(Arrays.asList("log",
                                                                                               "logΓ",
                                                                                               "ζ"));

  public static HashSet<String> complexFunctionsWithRealResults    =
                                                                new HashSet<>(Arrays.asList("arg",
                                                                                            "re",
                                                                                            "im",
                                                                                            "real",
                                                                                            "imag"));

  public static HashSet<String> integerFunctionsWithRealResults    =
                                                                new HashSet<>(Arrays.asList("sqrt",
                                                                                            "tanh",
                                                                                            "log"));

  static
  {
    bitlessFunctions.add("neg");
    bitlessFunctions.add("sign");
  }

  public boolean                  contextual = false;

  public String                   functionName;

  public FunctionMapping<?, ?, ?> mapping;

  @SuppressWarnings("unchecked")
  public FunctionNode(String functionName, Node<D, R, F> argument, Expression<D, R, F> expression)
  {
    super(expression,
          argument);
    this.functionName = functionName;
    assignFunctionName();
    if (this.expression.context != null)
    {
      mapping    =
              (FunctionMapping<D, R, F>) this.expression.context.functions.map.get(functionName);
      contextual = mapping != null;
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, mapping);
        generatedType = mapping.coDomain;
      }
    }
    else
    {
      generatedType = resultTypeFor(this.functionName);
    }
    if (functionName.equals(expression.functionName))
    {
      designateAsRecursiveFunction(type());
    }

  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    if (arg != null)
    {
      arg.accept(t);
    }
    t.accept(this);
  }

  private void assignFunctionName()
  {
    functionName = switch (Parser.transformToJavaAcceptableCharacters(functionName))
    {
    case "ln":
      yield "log";
    case "√":
      yield "sqrt";
    case "gamma":
      yield "Γ";
    case "zeta":
      yield "ζ";      
    default:
      yield functionName;
    };
  }

  public boolean checkForArgumentConversionNeed(FunctionMapping<D, R, F> functionMapping,
                                                boolean isNullaryFunction)
  {
    return arg != null && !arg.getGeneratedType().equals(functionMapping.domain)
                  && !isNullaryFunction;
  }

  private void checkForUndefinedReferenced(FunctionMapping<D, R, F> mapping)
  {
    if (mapping.instance == null && mapping.functionClass == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s",
                                                       mapping));
    }
  }

  private void designateAsRecursiveFunction(Class<?> resultType)
  {
    contextual = true;
    mapping    = new FunctionMapping<>();
    if (generatedType == null)
    {
      generatedType = resultType;
    }
    mapping.coDomain     = generatedType;
    mapping.domain       = getDomainType();
    mapping.functionName = functionName;
    expression.recursive = true;
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    var argDerivative      = arg.differentiate(variable);
    var functionDerivative = differentiateFunction();
    return functionDerivative.mul(argDerivative);
  }

  /**
   * Handles differentiation for built-in functions.
   */
  private Node<D, R, F> differentiateBuiltinFunction()
  {

    switch (functionName)
    {
    case "sqrt":
      return one().div(mul(2));
    case "arctan":
      return one().div(one().add(arg.pow(2)));
    case "arcsin":
      return arcsinDerivative();
    case "arccos":
      return arcsinDerivative().neg();
    case "sin":
      return arg.cos();
    case "cos":
      return arg.sin().neg();
    case "sinh":
      return arg.cosh();
    case "cosh":
      return arg.sinh();
    case "exp":
      return this;
    case "log":
      return one().div(arg);
    case "cot":
      return negativeOne().sub(pow(2));
    case "tan":
      return one().add(arg.tan().pow(2));
    case "tanh":
      return one().sub(arg.tanh().pow(2));
    case "sec":
      return mul(arg.tan());
    case "csc":
      return neg().mul(arg.cot());
    case "Γ":
    case "gamma":
      return mul(arg.digamma());
    default:
      throw new UnsupportedOperationException("Derivative not implemented for function: "
                                              + functionName);
    }
  }

  public Node<D, R, F> arcsinDerivative()
  {
    return one().div(one().sub(arg.pow(2)).sqrt());
  }

  private Node<D, R, F> differentiateContextualFunction()
  {
    var functionMapping = expression.context.getFunctionMapping(functionName);

    if (functionMapping == null)
    {
      throw new CompilerException(String.format("function named %s was not found in context.functions",
                                                functionName));
    }
    var instance = functionMapping.instance;
    if (instance == null)
    {
      throw new CompilerException(String.format("Instance for function %s was not present in %s",
                                                functionName,
                                                functionMapping));
    }

    var derivative                   = instance.derivative();

    var newDerivativeFunctionMapping =
                                     expression.context.registerFunctionMapping("diff"
                                                                                + functionName,
                                                                                derivative,
                                                                                derivative.domainType(),
                                                                                derivative.coDomainType());

    return new FunctionNode<D, R, F>(expression,
                                     newDerivativeFunctionMapping,
                                     arg);

  }

  private Node<D, R, F> integrateContextualFunction()
  {
    var functionMapping = expression.context.getFunctionMapping(functionName);

    if (functionMapping == null)
    {
      throw new CompilerException(String.format("function named %s was not found in context.functions",
                                                functionName));
    }
    var instance = functionMapping.instance;
    if (instance == null)
    {
      throw new CompilerException(String.format("Instance for function %s was not present in %s",
                                                functionName,
                                                functionMapping));
    }

    var integral                   = instance.integral();
    var newIntegralFunctionMapping =
                                   expression.context.registerFunctionMapping("int" + functionName,
                                                                              integral,
                                                                              functionMapping.domain,
                                                                              functionMapping.coDomain);
    return new FunctionNode<D, R, F>(expression,
                                     newIntegralFunctionMapping,
                                     arg);

  }

  /**
   * Returns the node representing the derivative of the function. This will vary
   * based on whether the function is built-in or contextual.
   */
  private Node<D, R, F> differentiateFunction()
  {
    if (isBuiltin())
    {
      return differentiateBuiltinFunction();
    }
    else if (contextual)
    {
      return differentiateContextualFunction();
    }
    else
    {
      throw new UnsupportedOperationException("Cannot differentiate function: " + functionName);
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    if (Expression.trace)
    {
      System.out.format("FunctionCall.generate: this=%s resultType=%s\n\n", this, resultType);
    }

    if (contextual)
    {
      generateContextualFunctionCall(mv, resultType);
    }
    else
    {
      generateBuiltinFunctionCall(mv, resultType, isBitless());
    }

    assert getGeneratedType().equals(resultType) : String.format("%s: generatedType=%s != resultType = %s, this=%s\n",
                                                                 getClass(),
                                                                 getGeneratedType(),
                                                                 resultType,
                                                                 this);
    return mv;
  }

  @SuppressWarnings("unchecked")
  public void generateArgument(MethodVisitor mv, FunctionMapping<D, R, F> functionMapping)
  {
    boolean isNullaryFunction = Object.class.equals(functionMapping.domain);

    generateParameter(mv, (Class<? extends R>) functionMapping.domain, isNullaryFunction);

    if (checkForArgumentConversionNeed(functionMapping, isNullaryFunction))
    {
      arg.generateCastTo(mv, functionMapping.domain);
    }
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor,
                                                   Class<?> requisiteResultType,
                                                   boolean bitless)
  {
    Class<?> argType = getArgType();
    arg.generate(methodVisitor, argType);
    if (!bitless)
    {
      loadBitsParameterOntoStack(methodVisitor);
    }

    loadOutputVariableOntoStack(methodVisitor, requisiteResultType);
    var    domainType         = getDomainType();
    var    coDomainType       = requisiteResultType;

    String functionDescriptor = bitless ? Compiler.getMethodDescriptor(coDomainType, coDomainType)
                                        : Compiler.getMethodDescriptor(coDomainType,
                                                                       int.class,
                                                                       coDomainType);

    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  functionDescriptor,
                                  false);

    generatedType = requisiteResultType;
    return methodVisitor;
  }

  public MethodVisitor generateContextualFunctionCall(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = type();
    var functionMapping = getFunctionMapping();
    checkForUndefinedReferenced(functionMapping);
    loadFunctionReferenceOntoStack(mv, functionMapping);
    generateArgument(mv, functionMapping);
    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);
    loadOutputVariableOntoStack(mv, generatedType);
    return functionMapping.call(mv, generatedType);
  }

  private void
          generateParameter(MethodVisitor mv, Class<? extends R> argType, boolean isNullaryFunction)
  {
    if (isNullaryFunction)
    {
      mv.visitInsn(Opcodes.ACONST_NULL);
    }
    else
    {
      arg.generate(mv, argType);
    }
  }

  public Class<?> getArgType()
  {
    return arg.type();
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return arg == null ? Collections.emptyList() : List.of(arg);
  }

  public Class<?> getDomainType()
  {
    return arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
  }

  public FunctionMapping<D, R, F> getFunctionMapping()
  {
    FunctionMapping<D, R, F> mapping = expression.context.functions.get(functionName);
    if (isSelfReferential(mapping))
    {
      mapping = registerSelfReferrentialFunctionMapping();
    }

    assert mapping != null : "FunctionMapping for " + functionName + " missing";
    return mapping;
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    var functionIntegral = integrateFunction();
    var argDerivative    = arg.differentiate(variable);
    return functionIntegral.div(argDerivative);
  }

  public Node<D, R, F> integrateFunction()
  {
    if (isBuiltin())
    {
      return integrateBuiltinFunction();
    }
    else if (contextual)
    {
      return integrateContextualFunction();
    }
    throw new UnsupportedOperationException("Cannot integrate function: " + functionName);
  }

  private Node<D, R, F> integrateBuiltinFunction()
  {
    switch (functionName)
    {
    case "sqrt":
      return two().div(three()).mul(arg.pow(three().div(two())));
    case "sin":
      return arg.cos().neg();
    case "cos":
      return arg.sin();
    case "exp":
      return this;
    case "tan":
      return arg.cos().log().neg();
    case "sec":
      return arg.sec().add(arg.tan()).log();
    case "arcsin":
      return arg.mul(arg.arcsin()).sub(one().sub(arg.pow(2)).sqrt());
    case "arctan":
      return arg.mul(arg.arctan()).sub(one().div(2).mul(one().add(arg.pow(2)).log()));
    default:
      throw new UnsupportedOperationException("Integration not implemented for: " + functionName);
    }
  }

  public LiteralConstantNode<D, R, F> three()
  {
    return expression.newLiteralConstant(3);
  }

  public LiteralConstantNode<D, R, F> two()
  {
    return expression.newLiteralConstant(2);
  }

  public boolean isBitless()
  {
    return bitlessFunctions.contains(functionName);
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return arg.isScalar();
  }

  public boolean isSelfReferential(FunctionMapping<D, R, F> mapping)
  {
    return mapping == null && functionName != null && expression.context != null;
  }

  private void loadFunctionReferenceOntoStack(MethodVisitor mv, FunctionMapping<D, R, F> mapping)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  functionName,
                                  mapping.functionFieldDescriptor());
  }

  public FunctionMapping<D, R, F> registerSelfReferrentialFunctionMapping()
  {
    var mapping = expression.context.registerFunctionMapping(functionName,
                                                             null,
                                                             expression.domainType,
                                                             expression.coDomainType,
                                                             expression.functionClass,
                                                             false,
                                                             expression,
                                                             expression.expression);
    expression.referencedFunctions.put(functionName, mapping);
    return mapping;
  }

  /**
   * This could use some refactoring to seperate the concerns
   * 
   * @param functionName
   * @return
   */
  public Class<?> resultTypeFor(String functionName)
  {
    if (arg == null)
    {
      return Object.class;
    }
    Class<? extends Object> argType       = arg.type();

    Class<?>                scalarArgType = Compiler.scalarType(arg.type());
    switch (functionName)
    {
    case "gamma":
    case "Γ":
    case "lnΓ":
      return scalarArgType;
    case "sqrt":
      return Integer.class.equals(expression.coDomainType) ? Real.class
                                                           : Compiler.scalarType(expression.coDomainType);
    case "arg":
      return Real.class;
    case "ζ":
      return Complex.class;
//    case "log":
//      return Real.class;
    case "exp":
      return scalarArgType;
//      System.err.println( "exp scalarArgType=" + scalarArgType );
//      if ( scalarArgType.equals( Complex.class ))
//      {
//        Class<?> scalarCodomainType = Compiler.scalarType(expression.coDomainType);
//        System.err.println( "  scalarCodomainType=" + scalarCodomainType );
//        return scalarCodomainType;
//      }
    }

    if (argType == null)
    {
      return expression.coDomainType;
    }
    else if (((argType.equals(Integer.class) || argType.equals(Fraction.class))
                  && integerFunctionsWithRealResults.contains(functionName))
                  || (argType.equals(Complex.class)
                                && complexFunctionsWithRealResults.contains(functionName)))
    {
      return Compiler.scalarType(expression.coDomainType);
    }
    else if (Complex.class.equals(expression.domainType)
                  && complexFunctionsWithComplexResults.contains(functionName))
    {
      return Complex.class;
    }
    else if (mapping != null && mapping.functionName.equals(functionName))
    {
      return mapping.coDomain;
    }
    else
    {
      return expression.coDomainType;
    }
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new FunctionNode<E, S, G>(functionName,
                                     arg.spliceInto(newExpression),
                                     newExpression);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> transformation)
  {
    arg = arg.substitute(variable, transformation);
    return this;
  }

  @Override
  public char symbol()
  {
    return "sqrt".equals(functionName) ? '√' : "exp".equals(functionName) ? 'e' : 'f';
  }

  @Override
  public String toString()
  {
    return String.format("%s(%s)", functionName, arg == null ? "" : arg).replace("sqrt", "√");
  }

  @Override
  public Class<?> type()
  {
    return isBuiltin() ? resultTypeFor(functionName) : mapping.coDomain;
  }

  @Override
  public String typeset()
  {
    if ("abs".equals(functionName))
    {
      return String.format("|%s|", arg.typeset());
    }

    String name = functionName.replaceAll("√", "sqrt")
                              .replaceAll("J0", "J_0")
                              .replaceAll("ζ", "zeta");
    return format(name.equals("sqrt") ? "\\%s{%s}" : "\\%s(%s)",
                  name,
                  arg == null ? "" : arg.typeset());
  }

}