package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadInputParameter;

import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.objectweb.asm.*;

import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.functions.Function;

/**
 * The {@link WhenNode} class represents a {@link Node} that the
 * {@link Expression#resolveFunction()} method creates when the 'when' keyword
 * is encountered. It's syntax is like this:
 * 
 * <pre>
 * when(condition1,value1,condition2,value2,..,else,valueOtherwise)
 * </pre>
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
@SuppressWarnings(
{ "unused" })
public class WhenNode<D, R, F extends Function<? extends D, ? extends R>> extends
                     UnaryOperationNode<D, R, F>
{

  private static final String INTEGER_CLASS_INTERNAL_NAME = Type.getInternalName(Integer.class);
  private static final String INT_METHOD_DESCRIPTOR       = Compiler.getMethodDescriptor(int.class);

  public static <D, R, F extends Function<? extends D, ? extends R>> Node<D, R, F> evaluateDefaultCase(Expression<D, R, F> expression)
  {
    expression.require(',');
    var defaultValue = expression.resolve();
    if (expression.character != ')')
    {
      throw new CompilerException(String.format("expected closing ) of when statement after else at position=%d expression=%s",
                                                expression.position,
                                                expression));
    }
    return defaultValue;
  }

  public TreeMap<Integer, Node<D, R, F>> cases;

  private Label                          defaultLabel = new Label();
  private Label                          endSwitch    = new Label();
  private Label[]                        labels       = null;
  private VariableNode<D, R, F>          switchVariable;

  public WhenNode(Expression<D, R, F> expression)
  {
    super(expression,
          null);

    cases = new TreeMap<>();

    do
    {
      evaluateCase();
    }
    while (expression.nextCharacterIs(','));
    expression.require(')');
    if (arg == null)
    {
      throw new CompilerException("default value of when function not specified with else keyword at position="
                                  + expression.position
                                  + " of expression="
                                  + expression);
    }
  }

  public <E, S, G extends Function<? extends E, ? extends S>> WhenNode(Expression<D, R, F> expression,
                                                                       Node<D, R, F> defaultNode,
                                                                       TreeMap<Integer, Node<E, S, G>> sourceCases)
  {
    super(expression,
          defaultNode);
    this.cases = new TreeMap<>();

    for (var entry : sourceCases.entrySet())
    {
      var value = entry.getValue().spliceInto(expression);
      this.cases.put(entry.getKey(), value);
    }
  }

  public <E, S, G extends Function<? extends E, ? extends S>> WhenNode(Expression<D, R, F> expression,
                                                                       Node<D, R, F> defaultNode,
                                                                       TreeMap<Integer, Node<E, S, G>> sourceCases,
                                                                       VariableNode<D, R, F> switchVariable)
  {
    super(expression,
          defaultNode);
    this.switchVariable = switchVariable;
    this.cases          = new TreeMap<>();

    for (var entry : sourceCases.entrySet())
    {
      var value = entry.getValue().spliceInto(expression);
      this.cases.put(entry.getKey(), value);
    }
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    cases.forEach((id, branch) -> branch.accept(t));
    arg.accept(t);
    t.accept(this);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    TreeMap<Integer, Node<D, R, F>> differentiatedCases = new TreeMap<>();
    for (var entry : cases.entrySet())
    {
      differentiatedCases.put(entry.getKey(), entry.getValue().differentiate(variable));
    }

    Node<D, R, F>     differentiatedDefault = arg.differentiate(variable);

    WhenNode<D, R, F> result                = new WhenNode<>(expression,
                                                             differentiatedDefault,
                                                             differentiatedCases,
                                                             switchVariable);
    return result;
  }

  private boolean isIndependentVariableOfThisOrAncestorExpression(VariableNode<D, R, F> variable)
  {
    Expression<?, ?, ?> expr = expression;
    while (expr != null)
    {
      if (expr.getIndependentVariable() != null && variable.reference.equals(expr.getIndependentVariable().reference))
      {
        return true;
      }
      expr = expr.upstreamExpression;
    }
    return false;
  }

  void evaluateCase(TreeMap<Integer, Node<D, R, F>> cases, VariableNode<D, R, F> variable)
  {
    if (!isIndependentVariableOfThisOrAncestorExpression(variable))
    {
      throw new CompilerException("condition of when statement must be the equality of an independent variable "
                                  + "of this or an enclosing expression, but got "
                                  + variable
                                  + " which is not an independent variable of "
                                  + expression
                                  + " or any of its ancestors");
    }

    if (switchVariable == null)
    {
      switchVariable = variable;
    }
    else if (!switchVariable.reference.equals(variable.reference))
    {
      throw new CompilerException("all cases in a when statement must switch on the same variable, got " + variable + " but expected " + switchVariable);
    }

    expression.require('=');

    var constant = evaluateCondition();
    var value    = expression.resolve();
    cases.put(new Integer(constant.stringValue), value);
  }

  public void evaluateCase()
  {
    Node<D, R, F> node = expression.resolve();
    if (node instanceof ElseNode)
    {
      arg = evaluateDefaultCase(expression);
    }
    else if (node instanceof VariableNode<D, R, F> variable)
    {
      evaluateCase(cases, variable);
    }
    else
    {
      throw new CompilerException("the cases of the when statement must be either an else statement or a VariableNode but it was a "
                                  + node.getClass()
                                  + " expr="
                                  + expression
                                  + "' with remaining='"
                                  + expression.remaining()
                                  + "'");
    }
  }

  public LiteralConstantNode<D, R, F> evaluateCondition()
  {
    Node<D, R, F> condition = expression.resolve();
    if (!condition.isLiteralConstant())
    {
      throw new CompilerException("condition of when statement must be the equality of the input variable to an "
                                  + "Integer LiteralConstant type, but got "
                                  + condition);
    }
    var constant = condition.asLiteralConstant();
    expression.require(',');
    return constant;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert expression.coDomainType.equals(resultType) : String.format("expression.coDomainType = %s != resultType = %s", expression.coDomainType, resultType);

    labels = new Label[cases.size()];

    cases.forEach((id, val) -> val.isRootNode = isRootNode);
    arg.isRootNode = isRootNode;

    generateIndex(mv);

    for (int i = 0; i < labels.length; i++)
    {
      labels[i] = new Label();
    }

    mv.visitTableSwitchInsn(0, cases.size() - 1, defaultLabel, labels);
    var branches = cases.values().stream().toList();

    for (int i = 0; i < labels.length; i++)
    {
      Compiler.designateLabel(mv, labels[i]);

      var ithBranch     = branches.get(i);
      var ithBranchType = ithBranch.type();

      ithBranch.generate(mv, ithBranchType);
      Compiler.jumpTo(mv, endSwitch);
    }
    Compiler.designateLabel(mv, defaultLabel);

    super.generate(mv, resultType);
    Compiler.designateLabel(mv, endSwitch);

    return mv;
  }

  public void generateIndex(MethodVisitor mv)
  {
    if (switchVariable != null && !switchVariable.reference.equals(expression.getIndependentVariable().reference))
    {
      switchVariable.generate(mv, Integer.class);
    }
    else
    {
      cast(loadInputParameter(mv), expression.domainType);
    }
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL, INTEGER_CLASS_INTERNAL_NAME, "getSignedValue", INT_METHOD_DESCRIPTOR, false);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return Stream.concat(cases.values().stream(), Stream.of(arg)).toList();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    TreeMap<Integer, Node<D, R, F>> integratedCases = new TreeMap<>();
    for (var entry : cases.entrySet())
    {
      integratedCases.put(entry.getKey(), entry.getValue().integral(variable));
    }

    Node<D, R, F>     integratedDefault = arg.integral(variable);

    WhenNode<D, R, F> result            = new WhenNode<>(expression,
                                                         integratedDefault,
                                                         integratedCases,
                                                         switchVariable);
    return result;
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return arg.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new WhenNode<E, S, G>(newExpression,
                                 arg.spliceInto(newExpression),
                                 cases,
                                 switchVariable != null ? switchVariable.spliceInto(newExpression) : null);
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    cases.entrySet().forEach(event -> cases.put(event.getKey(), event.getValue().substitute(variable, arg)));
    return this;
  }

  @Override
  public char symbol()
  {
    return '≡';
  }

  @Override
  public String toString()
  {
    String switchVar  = switchVariable != null ? switchVariable.toString() : expression.getIndependentVariable().toString();
    String caseString = cases.entrySet().stream().map(node -> formatCase(node, switchVar)).collect(Collectors.joining(","));
    return String.format("when(%s,else,%s)", caseString, arg);
  }

  protected String formatCase(Entry<Integer, Node<D, R, F>> node, String switchVar)
  {
    return String.format("%s=%s,%s", switchVar, node.getKey(), node.getValue());
  }

  protected String formatCase(Entry<Integer, Node<D, R, F>> node)
  {
    return formatCase(node, switchVariable != null ? switchVariable.toString() : expression.getIndependentVariable().toString());
  }

  @Override
  public Class<?> type()
  {
    return expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    String        switchVar = switchVariable != null ? switchVariable.typeset() : expression.getIndependentVariable().typeset();
    StringBuilder sb        = new StringBuilder();
    sb.append("\\\\left\\\\{\\\\begin{array}{ll}\\n");

    for (var entry : cases.entrySet())
    {
      sb.append(entry.getValue().typeset());
      sb.append(" & \\\\text{if } ");
      sb.append(switchVar);
      sb.append(" = ");
      sb.append(entry.getKey());
      sb.append("\\\\\\\\\\n");
    }

    sb.append(arg.typeset());
    sb.append(" & \\\\text{otherwise}");
    sb.append("\\n\\\\end{array}\\\\right.");

    return sb.toString();
  }
}
