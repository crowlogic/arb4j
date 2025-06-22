package arb.expressions.nodes;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.getFieldFromThis;
import static arb.expressions.Compiler.getMethodDescriptor;
import static arb.expressions.Compiler.invokeBinaryOperationMethod;
import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Parser.transformToJavaAcceptableCharacters;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Complex;
import arb.Quaternion;
import arb.Real;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.VariableReference;
import arb.functions.Function;

public class NewIntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends Node<D, C, F>
{
  public int bits = 128;

  // NAryOperationNode-style fields - extract integrand as STRING, create Expression later
  String integrandExpressionString;
  String integrationVariableName;
  Expression<D, C, F> integrand;
  String integrandFunctionFieldName;
  FunctionMapping<D, C, F> integrandMapping;

  // Limit nodes parsed inline like NAryOperationNode
  Node<D, C, F> lowerLimitNode;
  Node<D, C, F> upperLimitNode;
  VariableNode<D, C, F> integrationVariableNode;

  // Integral computation fields
  String integralFunctionFieldName;
  String lowerIntegralValueFieldName;
  String upperIntegralValueFieldName;
  Expression<Object, Object, Function<?, ?>> integralExpression;
  Node<Object, Object, Function<?, ?>> integralNode;
  FunctionMapping<?, ?, ?> integralMapping;

  // For FunctionEvaluationNode integration path
  Node<D, C, F> integrandNode;

  String SYNTAXMSG = "the format is g(x)=∫x➔f(x)dx∈(a,b) for definite integrals and " +
                     "g(x)=∫x➔f(x)dx for indefinite integrals, int(f(x),x) or int(f(x),x,a,b) for function form, " +
                     "or int(f(x),x=a..b) for interval form";

  public NewIntegralNode(Expression<D, C, F> expression)
  {
    this(expression, false);
  }

  public NewIntegralNode(Expression<D, C, F> expression, boolean functionForm)
  {
    super(expression);
    
    if (!functionForm)
    {
      integrandExpressionString = parseStandardForm();
    }
    else
    {
      integrandExpressionString = parseFunctionForm();
    }
    
    assignFieldNames(type());
  }

  public NewIntegralNode(Expression<D, C, F> expression, Node<D, C, F> functionEvaluationNode, VariableNode<D, C, F> variable)
  {
    super(expression);
    integrandNode = functionEvaluationNode;
    integrationVariableNode = variable;
    assignFieldNames(type());
  }

  // NAryOperationNode-style parsing - extract integrand STRING like parseFactorExpression()
  protected String parseStandardForm()
  {
    String stringExpression = expression.expression;
    int startPos = expression.position;
    int arrowIndex = stringExpression.indexOf('➔', startPos);
    
    if (arrowIndex != -1)
    {
      integrationVariableName = stringExpression.substring(startPos, arrowIndex).trim();
    }
    else
    {
      throw new RuntimeException("No integration variable specified");
    }

    String lookingFor = "d" + integrationVariableName;
    int dPosition = stringExpression.indexOf(lookingFor, arrowIndex);
    if (dPosition == -1)
    {
      expression.throwUnexpectedCharacterException("didn't find '" + lookingFor + "' remaining=" + expression.remaining());
    }

    String integrandExpression = stringExpression.substring(arrowIndex + 1, dPosition).trim();
    
    // Advance position like NAryOperationNode does - VERIFIED advancement
    expression.character = expression.expression.charAt(expression.position += integrandExpression.length() + integrationVariableName.length() + 1);
    
    // NOW verify and consume 'd' and variable name
    expression.require('d');
    String consumedVar = expression.parseName();
    assert consumedVar.equals(integrationVariableName) : "Variable mismatch: expected " + integrationVariableName + " but got " + consumedVar;

    // Check for limits specification
    if (expression.nextCharacterIs('∈'))
    {
      expression.require('(');
      lowerLimitNode = expression.evaluate(); // Use evaluate() like NAryOperationNode
      expression.require(',', '…');
      upperLimitNode = expression.evaluate(); // Use evaluate() like NAryOperationNode  
      expression.require(')');
    }

    return integrandExpression;
  }

  protected String parseFunctionForm()
  {
    String stringExpression = expression.expression;
    int startPos = expression.position;
    
    // Find first comma like NAryOperationNode looks for specific delimiters - NO bracket matching
    int firstComma = stringExpression.indexOf(',', startPos);
    if (firstComma == -1)
    {
      expression.throwUnexpectedCharacterException("Expected comma after integrand");
    }

    String integrandExpression = stringExpression.substring(startPos, firstComma).trim();
    
    // Advance position like NAryOperationNode - VERIFIED advancement
    expression.character = expression.expression.charAt(expression.position += integrandExpression.length());
    
    // NOW verify and consume comma and variable name
    integrationVariableName = expression.require(',').parseName();
    
    // Parse limits using verified methods
    if (expression.nextCharacterIs('='))
    {
      lowerLimitNode = expression.evaluate(); // Use evaluate() like NAryOperationNode
      expression.require(',', '…');
      upperLimitNode = expression.evaluate(); // Use evaluate() like NAryOperationNode
    }
    else if (expression.nextCharacterIs(','))
    {
      lowerLimitNode = expression.evaluate(); // Use evaluate() like NAryOperationNode
      if (expression.nextCharacterIs(','))
      {
        upperLimitNode = expression.evaluate(); // Use evaluate() like NAryOperationNode
      }
    }
    expression.require(')');

    return integrandExpression;
  }

  protected void assignFieldNames(Class<?> resultType)
  {
    integralFunctionFieldName = expression.getNextIntermediateVariableFieldName("integral", resultType);
    lowerIntegralValueFieldName = expression.newIntermediateVariable("lowerValue", resultType);
    upperIntegralValueFieldName = expression.newIntermediateVariable("upperValue", resultType);
    
    if (integrandExpressionString != null)
    {
      integrandFunctionFieldName = expression.getNextIntermediateVariableFieldName("integrand", resultType);
    }
  }

  // Create integrand Expression like NAryOperationNode.parseFactorExpression(Class<?>)
  @SuppressWarnings("unchecked")
  protected void parseIntegrandExpression(Class<?> resultType)
  {
    if (integrand == null && integrandExpressionString != null)
    {
      String expr = integrandExpressionString;
      
      // Create NEW Expression like NAryOperationNode does for factors
      integrand = Function.parse(integrandFunctionFieldName,
                               expr,
                               expression.context,
                               expression.domainType,
                               expression.coDomainType,
                               expression.functionClass,
                               integrandFunctionFieldName,
                               expression);

      // Register like NAryOperationNode.registerFactor()
      registerIntegrand(expr, integrand);
    }
  }

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

  static String integralEvaluateMethodSignature = getMethodDescriptor(Object.class,
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
      evaluateIndefiniteIntegralAt(mv, upperLimitNode, resultType, upperIntegralValueFieldName);
      evaluateIndefiniteIntegralAt(mv, lowerLimitNode, resultType, lowerIntegralValueFieldName);
      
      if (isResult)
      {
        cast(loadResultParameter(mv), resultType);
      }
      else
      {
        fieldName = expression.allocateIntermediateVariable(mv, "integralDifference", resultType);
      }
      invokeBinaryOperationMethod(mv, "sub", resultType, resultType, resultType);
    }
    return mv;
  }

  @SuppressWarnings("unchecked")
  private void computeIndefiniteIntegral()
  {
    if (integrandNode != null)
    {
      // FunctionEvaluationNode path - use nodes directly
      assert integrationVariableNode != null : "integrationVariableNode is null";
      integralNode = (Node<Object, Object, Function<?, ?>>) integrandNode.integrate(integrationVariableNode);
    }
    else
    {
      // String parsing path - use Expression like NAryOperationNode
      assert integrand != null : "integrand is null integrandExpressionString=" + integrandExpressionString;
      // Create integration variable node for the integrand expression
      integrationVariableNode = new VariableNode<>(expression,
                                                   new VariableReference<>(integrationVariableName),
                                                   expression.position,
                                                   true);
      integralNode = (Node<Object, Object, Function<?, ?>>) integrand.rootNode.integrate(integrationVariableNode);
    }

    integralExpression = Function.compile(Object.class,
                                        Object.class,
                                        Function.class,
                                        integralNode.toString(),
                                        expression.context);
    
    integralExpression.className = transformToJavaAcceptableCharacters(integralFunctionFieldName);

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
    getFieldFromThis(mv, expression.className, integralValueFieldName, Type.getDescriptor(generatedType));
    evaluateIntegral(mv);
    cast(mv, resultType);
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    if (integrandNode != null)
    {
      return List.of(integrandNode);
    }
    else if (integrand != null)
    {
      return List.of(integrand.rootNode);
    }
    else
    {
      return List.of();
    }
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
    String integrandStr = integrandNode != null ? integrandNode.typeset() : integrandExpressionString;
    return lowerLimitNode == null && upperLimitNode == null 
      ? String.format("\\int %s \\,d%s", integrandStr, integrationVariableName)
      : String.format("\\int_{%s}^{%s} %s \\,d%s",
                      lowerLimitNode.typeset(), upperLimitNode.typeset(), 
                      integrandStr, integrationVariableName);
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    return new NewIntegralNode<>(expression, this, variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    if (integrandNode != null)
    {
      return new NewIntegralNode<E, S, G>(newExpression,
                                          integrandNode.spliceInto(newExpression),
                                          integrationVariableNode.spliceInto(newExpression).asVariable());
    }
    else
    {
      var integral = new NewIntegralNode<E, S, G>(newExpression, false);
      integral.integrandExpressionString = integrandExpressionString;
      integral.integrationVariableName = integrationVariableName;
      integral.assignFieldNames(newExpression.coDomainType);
      return integral;
    }
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> substitution)
  {
    if (integrand != null)
    {
      integrand = integrand.substitute(variable, substitution.expression);
    }
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
      integrationVariableNode = integrationVariableNode.substitute(variable, substitution).asVariable();
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
    return type().equals(Real.class) || type().equals(Complex.class) || type().equals(Quaternion.class);
  }

  @Override
  public char symbol()
  {
    return '∫';
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    if (integrationVariableNode != null) integrationVariableNode.accept(t);
    if (integrandNode != null) integrandNode.accept(t);
    if (integrand != null) integrand.rootNode.accept(t);
    if (lowerLimitNode != null) lowerLimitNode.accept(t);
    if (upperLimitNode != null) upperLimitNode.accept(t);
    t.accept(this);
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(integrandNode, integrandExpressionString, integrationVariableName, lowerLimitNode, upperLimitNode);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    NewIntegralNode<?, ?, ?> other = (NewIntegralNode<?, ?, ?>) obj;
    return Objects.equals(integrandNode, other.integrandNode)
           && Objects.equals(integrandExpressionString, other.integrandExpressionString)
           && Objects.equals(integrationVariableName, other.integrationVariableName)
           && Objects.equals(lowerLimitNode, other.lowerLimitNode)
           && Objects.equals(upperLimitNode, other.upperLimitNode);
  }

  @Override
  public String toString()
  {
    String integrandStr = integrandNode != null ? integrandNode.toString() : integrandExpressionString;
    return "∫" + integrationVariableName + "➔" + integrandStr + "d" + integrationVariableName +
           (lowerLimitNode != null && upperLimitNode != null ? 
            "∈(" + lowerLimitNode.toString() + "," + upperLimitNode.toString() + ")" : "");
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
