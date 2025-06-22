package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static arb.expressions.Parser.transformToJavaAcceptableCharacters;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.functions.Function;

/**
 * The syntax to express a definite integral is<br>
 * <br>
 * 
 * <pre>
 * g(x)=∫x➔f(x)dx∈(a,b)
 * </pre>
 * 
 * and the syntax to express an indefinite integral is<br>
 * <br>
 * 
 * <pre>
 * g(x)=∫x➔f(x)dx
 * </pre>
 * 
 * which is just as the definite case but with the limits of the integration
 * interval specification ∈(a,b) is omitted
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NewIntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                            Node<D, C, F>
{

  public int                                 bits      = 128;

  // Original fields for backward compatibility
  Node<D, C, F>                              integrandNode;
  Node<D, C, F>                              lowerLimitNode;
  Node<D, C, F>                              upperLimitNode;
  Node<D, C, F>                              integrationVariableNode;
  Function<? extends D, ? extends C>         integralFunction;
  String                                     integralFunctionFieldName;
  String                                     lowerIntegralValueFieldName;
  String                                     upperIntegralValueFieldName;
  String                                     dvar;
  Expression<Object, Object, Function<?, ?>> integralExpression;
  Node<Object, Object, Function<?, ?>>       integralNode;
  public FunctionMapping<?, ?, ?>            integralMapping;

  // NEW: String extraction fields like NAryOperationNode
  String                                     integrandExpressionString;
  String                                     lowerLimitExpressionString;
  String                                     upperLimitExpressionString;
  String                                     integrationVariableName;

  // NEW: Separate Expression objects - NO SEQUENCES, just regular functions
  Expression<D, C, F>                        integrand;
  String                                     integrandFunctionFieldName;
  FunctionMapping<D, C, F>                   integrandMapping;

  String                                     SYNTAXMSG =
                                                       "the format is g(x)=∫x➔f(x)dx∈(a,b) for definite integrals and "
                                                         + "g(x)=∫x➔f(x)dx for indefinate integrals, the variable on the left "
                                                         + "side of the arrow must match the variable on the right side of the d and "
                                                         + "before the ( but the first var was %s and the 2nd was %s\n";

  // Constructor with string extraction like
  // NAryOperationNode.parseFactorExpression()
  public NewIntegralNode(Expression<D, C, F> expression)
  {
    this(expression,
         false);
  }

  public NewIntegralNode(Expression<D, C, F> expression, boolean functionForm)
  {
    super(expression);

    if (!functionForm)
    {
      // Standard form: ∫x➔f(x)dx∈(a,b)
      this.integrandExpressionString = parseStandardForm();
    }
    else
    {
      // Function form: int(tan(x),x) or int(tan(x),x,a,b)
      this.integrandExpressionString = parseFunctionForm();
    }
    assignFieldNames(type());
  }

  // Backward compatible constructor for FunctionEvaluationNode
  public NewIntegralNode(Expression<D, C, F> expression,
                         Node<D, C, F> functionEvaluationNode,
                         Node<D, C, F> variable)
  {
    super(expression);
    integrandNode           = functionEvaluationNode;
    integrationVariableNode = variable;
    assignFieldNames(type());
  }

  /**
   * Parse standard form: ∫x➔f(x)dx∈(a,b) using string extraction
   */
  protected String parseStandardForm()
  {
    String stringExpression = expression.expression;
    int    startPos         = expression.position;
    int    arrowIndex       = stringExpression.indexOf('➔', expression.position);

    if (arrowIndex != -1)
    {
      integrationVariableName = stringExpression.substring(startPos, arrowIndex).trim();
    }
    else
    {
      // Optional var➔ prefix - infer from independent variable
      if (expression.independentVariable != null)
      {
        integrationVariableName = expression.independentVariable.getName();
      }
      else
      {
        throw new RuntimeException("No integration variable specified and no independent variable available");
      }
      arrowIndex = startPos - 1; // Adjust for no arrow case
    }

    // Find the 'd' followed by variable name
    String lookingFor = "d" + integrationVariableName;
    int    dPosition  = stringExpression.indexOf(lookingFor, arrowIndex);
    if (dPosition == -1)
    {
      expression.throwUnexpectedCharacterException("didn't find '"
                                                   + lookingFor
                                                   + "' remaining="
                                                   + expression.remaining());
    }

    // EXTRACT THE INTEGRAND SUBSTRING
    String integrandExpression = stringExpression.substring(arrowIndex + 1, dPosition).trim();

    // Skip past the 'd' and variable
    int    afterDVar           = dPosition + lookingFor.length();

    // Check for definite integral limits ∈(a,b)
    if (afterDVar < stringExpression.length() && stringExpression.charAt(afterDVar) == '∈')
    {
      int openParen  = stringExpression.indexOf('(', afterDVar);
      int comma      = stringExpression.indexOf(',', openParen);
      int closeParen = stringExpression.indexOf(')', comma);

      if (openParen != -1 && comma != -1 && closeParen != -1)
      {
        // EXTRACT LIMIT SUBSTRINGS
        lowerLimitExpressionString = stringExpression.substring(openParen + 1, comma).trim();
        upperLimitExpressionString = stringExpression.substring(comma + 1, closeParen).trim();
        expression.position        = closeParen + 1;
      }
    }
    else
    {
      expression.position = afterDVar;
    }

    // Update character
    if (expression.position < stringExpression.length())
    {
      expression.character = stringExpression.charAt(expression.position);
    }

    return integrandExpression;
  }

  /**
   * Parse function form: int(tan(x),x) using string extraction like
   * NAryOperationNode
   */
  protected String parseFunctionForm()
  {
    String stringExpression = expression.expression;
    int    startPos         = expression.position;

    // Find first comma to separate integrand from variable
    int    firstComma       = stringExpression.indexOf(',', startPos);
    if (firstComma == -1)
    {
      expression.throwUnexpectedCharacterException("Expected comma after integrand in function form");
    }

    // EXTRACT INTEGRAND SUBSTRING
    String integrandExpression = stringExpression.substring(startPos, firstComma).trim();

    // Find variable name after first comma
    int    varStart            = firstComma + 1;
    int    secondComma         = stringExpression.indexOf(',', varStart);
    int    closeParen          = stringExpression.indexOf(')', varStart);

    int    varEnd              =
                  (secondComma != -1 && secondComma < closeParen) ? secondComma : closeParen;
    integrationVariableName = stringExpression.substring(varStart, varEnd).trim();

    // Check for limits: int(f(x),x,a,b)
    if (secondComma != -1 && secondComma < closeParen)
    {
      // Has limits
      int lowerStart = secondComma + 1;
      int thirdComma = stringExpression.indexOf(',', lowerStart);
      if (thirdComma != -1 && thirdComma < closeParen)
      {
        // int(f(x),x,a,b) form
        lowerLimitExpressionString = stringExpression.substring(lowerStart, thirdComma).trim();
        upperLimitExpressionString = stringExpression.substring(thirdComma + 1, closeParen).trim();
      }
      else
      {
        // int(f(x),x,a) form - single limit?
        lowerLimitExpressionString = stringExpression.substring(lowerStart, closeParen).trim();
      }
    }

    // Update position to after closing paren
    expression.position = closeParen + 1;
    if (expression.position < stringExpression.length())
    {
      expression.character = stringExpression.charAt(expression.position);
    }

    return integrandExpression;
  }

  protected void assignFieldNames(Class<?> resultType)
  {
    integralFunctionFieldName   = expression.getNextIntermediateVariableFieldName("integral",
                                                                                  resultType);
    lowerIntegralValueFieldName = expression.newIntermediateVariable("lowerValue", resultType);
    upperIntegralValueFieldName = expression.newIntermediateVariable("upperValue", resultType);

    if (integrandExpressionString != null)
    {
      integrandFunctionFieldName = expression.getNextIntermediateVariableFieldName("integrand",
                                                                                   resultType);
    }
  }

  /**
   * Create separate Expression from extracted string EXACTLY like
   * NAryOperationNode.parseFactorExpression()
   */
  @SuppressWarnings("unchecked")
  protected void parseIntegrandExpression(Class<?> resultType)
  {
    if (integrand == null && integrandExpressionString != null)
    {
      String expr = integrandExpressionString;

      integrand = Function.parse(integrandFunctionFieldName,
                                 expr,
                                 expression.context,
                                 expression.domainType,
                                 expression.coDomainType,
                                 expression.functionClass,
                                 integrandFunctionFieldName,
                                 expression);

      registerIntegrand(expr, integrand);
    }
  }

  /**
   * Register function EXACTLY like NAryOperationNode.registerFactor()
   */
  void registerIntegrand(String expr, Expression<D, C, F> integrandExpression)
  {
    integrandMapping = expression.context.registerFunctionMapping(integrandFunctionFieldName,
                                                                  null,
                                                                  expression.domainType,
                                                                  integrandExpression.coDomainType,
                                                                  null,
                                                                  true,
                                                                  integrandExpression,
                                                                  expr);
    expression.referencedFunctions.put(integrandFunctionFieldName, integrandMapping);
  }

  void loadIntegral(MethodVisitor mv)
  {
    getFieldFromThis(mv,
                     expression.className,
                     integralFunctionFieldName,
                     "L" + integralExpression.className + ";");
  }

  static String integralEvaluateMethodSignature = Compiler.getMethodDescriptor(Object.class,
                                                                               Object.class,
                                                                               int.class,
                                                                               Object.class);

  protected void evaluateIntegral(MethodVisitor mv)
  {
    invokeMethod(mv,
                 Type.getInternalName(Function.class),
                 "evaluate",
                 integralEvaluateMethodSignature,
                 true);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;

    if (integrandExpressionString != null)
    {
      parseIntegrandExpression(resultType);
    }

    if (integralNode == null)
    {
      computeIndefiniteIntegral();
    }

    if (upperLimitNode == null && lowerLimitNode == null)
    {
      expression.merge(integralNode);
      integralNode.generate(mv, resultType);
    }
    else
    {
      evaluateIndefiniteIntegralAt(mv, upperLimitNode, resultType, lowerIntegralValueFieldName);
      evaluateIndefiniteIntegralAt(mv, lowerLimitNode, resultType, upperIntegralValueFieldName);
      loadBitsParameterOntoStack(mv);
      if (isResult)
      {
        Compiler.cast(Compiler.loadResultParameter(mv), resultType);
      }
      else
      {
        fieldName = expression.allocateIntermediateVariable(mv, "integralDifference", resultType);
      }
      Compiler.invokeBinaryOperationMethod(mv, "sub", resultType, resultType, resultType);
    }
    return mv;
  }

  @SuppressWarnings("unchecked")
  private void computeIndefiniteIntegral()
  {
    assert integralFunction == null;

    if (integrandNode == null && integrand != null)
    {

      // Use the parsed integrand expression
      integralNode = (Node<Object, Object, Function<?, ?>>) integrand.rootNode;
    }
    else
    {
    
      if (integrand == null)
      {
        System.err.println( "Compiling " + integrandExpressionString ); 
        integrand = Function.compile(expression.domainType,
                                     expression.domainType,
                                     Function.class,
                                     integrandExpressionString,
                                     expression.context);
        integrandNode = integrand.rootNode;
      }
      assert integrand.independentVariable != null : "indepVar is null for integrand=" + integrand;
      integralNode = (Node<Object,
                    Object,
                    Function<?, ?>>) integrandNode.integrate(integrand.independentVariable);
    }

    integralExpression                      = integralNode.expression.cloneExpression();
    integralExpression.instructionByteCodes = null;
    integralExpression.compiledClass        = null;
    integralExpression.domainType           = integralNode.type();
    integralExpression.coDomainType         = integralNode.type();
    integralExpression.rootNode             = integralNode.spliceInto(integralExpression);
    integralExpression.className            =
                                 transformToJavaAcceptableCharacters(integralFunctionFieldName);
    integralExpression.updateStringRepresentation();
    integralExpression.compile();

    integralMapping = expression.context.registerFunctionMapping(integralExpression.className,
                                                                 integralExpression.instantiate(),
                                                                 integralExpression.domainType,
                                                                 integralExpression.coDomainType,
                                                                 Function.class,
                                                                 false,
                                                                 integralExpression,
                                                                 null);
    expression.referencedFunctions.put(integralFunctionFieldName, integralMapping);
  }

  private void evaluateIndefiniteIntegralAt(MethodVisitor mv,
                                            Node<D, C, F> limit,
                                            Class<?> resultType,
                                            String integralValueFieldName)
  {
    loadIntegral(mv);
    limit.generate(mv, Real.class);
    loadBitsParameterOntoStack(mv);
    loadFieldFromThis(mv, integralValueFieldName, generatedType);
    evaluateIntegral(mv);
    cast(mv, resultType);
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(integrandNode != null ? integrandNode : integrand.rootNode);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public Class<? extends C> type()
  {
    return expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return lowerLimitNode == null && upperLimitNode
                  == null ? String.format("\\int %s \\,d%s",
                                          integrandNode != null ? integrandNode.typeset()
                                                                : integrandExpressionString,
                                          integrationVariableName)
                          : String.format("\\int_{%s}^{%s} %s \\,d%s",
                                          lowerLimitExpressionString,
                                          upperLimitExpressionString,
                                          integrandNode != null ? integrandNode.typeset()
                                                                : integrandExpressionString,
                                          integrationVariableName);
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    return new NewIntegralNode<>(expression,
                                 this,
                                 variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         NewIntegralNode<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    if (integrandExpressionString != null)
    {
      // String-based construction
      return new NewIntegralNode<>(newExpression); // Will re-parse from newExpression
    }
    else
    {
      // Node-based construction
      return new NewIntegralNode<>(newExpression,
                                   integrandNode.spliceInto(newExpression),
                                   integrationVariableNode.spliceInto(newExpression));
    }
  }

  /**
   * SUBSTITUTE METHOD EXACTLY like NAryOperationNode.substitute()
   */
  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> substitution)
  {
    if (substitution.toString().equals(variable))
    {
      return this;
    }

    // Clear existing parsed expressions like NAryOperationNode does
    if (integrandFunctionFieldName != null)
    {
      expression.context.functions.map.remove(this.integrandFunctionFieldName);
    }

    // Reset fields like NAryOperationNode does
    integrandFunctionFieldName = null;
    integrand                  = null;

    // Reassign field names and reparse like NAryOperationNode does
    assignFieldNames(expression.coDomainType);
    if (integrandExpressionString != null)
    {
      parseIntegrandExpression(expression.coDomainType);
      integrand                 = integrand.substitute(variable, substitution.expression);
      integrandExpressionString = integrand.toString();
    }

    // Substitute in node-based fields
    if (integrandNode != null)
    {
      integrandNode = integrandNode.substitute(variable, substitution);
    }
    if (lowerLimitNode != null)
    {
      lowerLimitNode = lowerLimitNode.substitute(variable, substitution);
    }
    if (upperLimitNode != null)
    {
      upperLimitNode = upperLimitNode.substitute(variable, substitution);
    }
    if (integrationVariableNode != null)
    {
      integrationVariableNode = integrationVariableNode.substitute(variable, substitution);
    }

    return this;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return integrandNode != null ? integrandNode : integrand.rootNode;
  }

  @Override
  public boolean isScalar()
  {
    return type().equals(Real.class) || type().equals(Complex.class)
                  || type().equals(Quaternion.class);
  }

  @Override
  public char symbol()
  {
    return '∫';
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    if (integrationVariableNode != null)
      integrationVariableNode.accept(t);
    if (integrandNode != null)
      integrandNode.accept(t);
    if (lowerLimitNode != null)
      lowerLimitNode.accept(t);
    if (upperLimitNode != null)
      upperLimitNode.accept(t);
    t.accept(this);
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(integrandNode,
                        integrationVariableNode,
                        lowerLimitNode,
                        upperLimitNode,
                        integrandExpressionString);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null || getClass() != obj.getClass())
      return false;
    NewIntegralNode<?, ?, ?> other = (NewIntegralNode<?, ?, ?>) obj;
    return Objects.equals(integrandNode, other.integrandNode)
                  && Objects.equals(integrationVariableNode, other.integrationVariableNode)
                  && Objects.equals(lowerLimitNode, other.lowerLimitNode)
                  && Objects.equals(upperLimitNode, other.upperLimitNode)
                  && Objects.equals(integrandExpressionString, other.integrandExpressionString);
  }

  @Override
  public String toString()
  {
    if (integrandExpressionString != null)
    {
      return "∫"
             + integrationVariableName
             + "➔"
             + integrandExpressionString
             + "d"
             + integrationVariableName
             + (lowerLimitExpressionString != null ? "∈("
                                                     + lowerLimitExpressionString
                                                     + ","
                                                     + upperLimitExpressionString
                                                     + ")"
                                                   : "");
    }
    else
    {
      return integralNode != null ? integralNode.toString() : "null";
    }
  }

  @Override
  public Node<D, C, F> simplify()
  {
    if (integralNode == null)
    {
      computeIndefiniteIntegral();
    }
    integralNode = integralNode.simplify();
    return this;
  }
}
