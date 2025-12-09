package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadInputParameter;
import static org.objectweb.asm.Opcodes.GOTO;

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
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class WhenNode<D, R, F extends Function<? extends D, ? extends R>> extends
                     UnaryOperationNode<D, R, F>
{

  private static final String INT_METHOD_DESCRIPTOR       = Compiler.getMethodDescriptor(int.class);
  private static final String INTEGER_CLASS_INTERNAL_NAME = Type.getInternalName(Integer.class);

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         evaluateDefaultCase(Expression<D, R, F> expression)
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

  public WhenNode(Expression<D, R, F> expression)
  {
    super(expression,
          null);

    if (!expression.domainType.equals(Integer.class))
    {
      throw new CompilerException("TODO: support when statements for types other than Integer such as "
                                  + expression.domainType);
    }
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

  public <E,
                S,
                G extends Function<? extends E,
                              ? extends S>> WhenNode(Expression<D, R, F> expression,
                                                     TreeMap<Integer, Node<E, S, G>> cases)
  {
    super(expression,
          null);
    cases = new TreeMap<>();

    for (var entry : cases.entrySet())
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
    assert false : "TODO";
    return null;
  }

  void evaluateCase(TreeMap<Integer, Node<D, R, F>> cases, VariableNode<D, R, F> variable)
  {
    if (!variable.reference.equals(expression.independentVariable.reference))
    {
      throw new CompilerException("condition of when statement must be the equality of the input variable which is "
                                  + expression.independentVariable
                                  + " not "
                                  + variable);
    }

    expression.require('=');

    var constant = evaluateCondition();
    var value    = expression.resolve();
    cases.put(new Integer(constant.value), value);
  }

  public void evaluateCase()
  {
    Node<D, R, F> node = expression.resolve();
    if ((node instanceof ElseNode))
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
                                  + expression.expression
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
    assert expression.coDomainType.equals(resultType) : String.format("expression.domain = %s != Integer, the only type supported presently\n",
                                                                      expression.domainType);
    try
    {
      mv.visitCode();

      labels = new Label[cases.size()];

      cases.forEach((id, val) -> val.isResult = isResult);
      arg.isResult = isResult;

      generateIndex(mv);

      for (int i = 0; i < labels.length; i++)
      {
        labels[i] = new Label();
      }

      mv.visitTableSwitchInsn(0, cases.size() - 1, defaultLabel, labels);
      var branches = cases.values().stream().toList();

      for (int i = 0; i < labels.length; i++)
      {
        mv.visitLabel(labels[i]);
        var                     ithBranch     = branches.get(i);
        Class<? extends Object> ithBranchType = ithBranch.type();

        ithBranch.generate(mv, ithBranchType);
        mv.visitJumpInsn(GOTO, endSwitch);
      }

      mv.visitLabel(defaultLabel);

      super.generate(mv, resultType);
      mv.visitLabel(endSwitch);
    }
    finally
    {
      mv.visitEnd();
    }

    return mv;
  }

  public void generateIndex(MethodVisitor mv)
  {
    cast(loadInputParameter(mv), expression.domainType);
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       INTEGER_CLASS_INTERNAL_NAME,
                       "getSignedValue",
                       INT_METHOD_DESCRIPTOR,
                       false);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    // the default branch is stored in arg
    return Stream.concat(cases.values().stream(), Stream.of(arg)).toList();
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
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

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new WhenNode<E, S, G>(newExpression,
                                 cases);
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    cases.entrySet()
         .forEach(event -> cases.put(event.getKey(), event.getValue().substitute(variable, arg)));
    return this;
  }

  @Override
  public char symbol()
  {
    return '≡';
  }

  /**
   * @return something that looks like
   *         'when(n=0,1,n=1,(C(1)*x-β+α)/2,else,(A(n)*P(n-1)-B(n)*P(n-2))/E(n))'
   */
  @Override
  public String toString()
  {
    String caseString = cases.entrySet()
                             .stream()
                             .map(node -> formatCase(node))
                             .collect(Collectors.joining(","));
    return String.format("when(%s,else,%s)", caseString, arg);
  }

  protected String formatCase(Entry<Integer, Node<D, R, F>> node)
  {
    return String.format("%s=%s,%s",
                         expression.independentVariable,
                         node.getKey(),
                         node.getValue());
  }

  @Override
  public Class<?> type()
  {
    return expression.coDomainType;
  }

  /**
   * TODO: make it generate this
   * 
   * <pre>
     $\left\{\begin{array}{ll}
      \text{val1} & \text{case1}\\
      \text{val2} & \text{case2}\\
      \text{val3} & \text{otherwise}\\}
      \end{array}\right$
   * </pre>
   */
  @Override
  public String typeset()
  {
    return cases.entrySet()
                .stream()
                .map(entry -> entry.getValue().typeset())
                .collect(Collectors.joining(", "))
           + " \text{otherwise} "
           + arg.typeset();
  }

}
