package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.loadInputParameter;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.F_SAME;
import static org.objectweb.asm.Opcodes.GOTO;

import java.util.List;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.Else;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * The {@link When} class represents a {@link Node} in the {@link Expression}
 * that is generated by the {@link When#evaluate(Expression, int)} function when
 * the 'when' "function" is encountered. It's syntax is like this:
 * <code>Function&lt;Integer,Real> f = Function.express(Real.class,Integer.class,"when(n=0,1,n=1,tanh(ln(x)),else,-1)", context);</code>
 * <br>
 * <br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class When<D, R, F extends Function<D, R>> extends
                 UnaryOperation<D, R, F>
{

  private static final String INTEGER_CLASS_INTERNAL_NAME = Type.getInternalName(Integer.class);
  private static final String INT_METHOD_DESCRIPTOR       = Type.getMethodDescriptor(Type.getType(int.class));

  private static <D, F extends Function<D, R>, R> void evaluateCase(Expression<D, R, F> expression,
                                                                    TreeMap<Integer, Node<D, R, F>> cases,
                                                                    Variable<D, R, F> variable)
  {
    if (!variable.reference.equals(expression.inputNode.reference))
    {
      throw new ExpressionCompilerException("condition of when statement must be the equality of the input variable which is "
                    + expression.inputNode + " not " + variable);
    }

    if (!expression.nextCharacterIs('='))
    {
      throw new ExpressionCompilerException(format("= expected in condition of when function at pos=%d expression=%s but got ch=%c and lastCh=%c",
                                                   expression.position,
                                                   expression,
                                                   expression.character,
                                                   expression.previousCharacter));
    }

    LiteralConstant<D, R, F> constant = evaluateCondition(expression);
    Node<D, R, F>            value    = expression.resolveArithmetic();
    cases.put(new Integer(constant.value), value);
  }

  private static <R, F extends Function<D, R>, D>
          LiteralConstant<D, R, F>
          evaluateCondition(Expression<D, R, F> expression)
  {
    Node<D, R, F> condition = expression.evaluate();
    if (!(condition instanceof LiteralConstant))
    {
      throw new ExpressionCompilerException("condition of when statement must be the equality of the input variable to an "
                    + "Integer LiteralConstant type, but got " + condition);
    }
    LiteralConstant<D, R, F> constant = (LiteralConstant<D, R, F>) condition;
    if (!expression.nextCharacterIs(','))
    {
      throw new ExpressionCompilerException(", expected after condition of when function at pos="
                    + expression.position);
    }
    return constant;
  }

  private static <D, R, F extends Function<D, R>> Node<D, R, F> evaluateDefaultCase(Expression<D, R, F> expression)
  {
    Node<D, R, F> defaultValue;
    if (!expression.nextCharacterIs(','))
    {
      throw new ExpressionCompilerException(", expected after else condition");
    }
    defaultValue = expression.resolveArithmetic();

    if (expression.character != ')')
    {
      throw new ExpressionCompilerException(format("expected closing ) of when statement after else at position=%d expression=%s",
                                                   expression.position,
                                                   expression));
    }
    return defaultValue;
  }

  public TreeMap<Integer, Node<D, R, F>> cases;
  private Label                          defaultLabel = new Label();
  private Label                          endSwitch    = new Label();

  private Label[]                        labels       = null;

  public When(Expression<D, R, F> expression)
  {
    super(null,
          expression);
    cases = new TreeMap<>();

    do
    {
      evaluateCases();
    }
    while (expression.nextCharacterIs(','));
    if (!expression.nextCharacterIs(')'))
    {
      throw new ExpressionCompilerException("Closing parenthesis expected at position=" + expression.position
                    + " of expression=" + expression);
    }
    if (arg == null)
    {
      throw new ExpressionCompilerException("default value of when function not specified with else keyword at position="
                    + expression.position + " of expression=" + expression);
    }
  }

  public When(Node<D, R, F> node, Expression<D, R, F> expression, int depth)
  {
    super(node,
          expression);
  }

  public void evaluateCases()
  {
    Node<D, R, F> node = expression.evaluate();
    if ((node instanceof Else))
    {
      arg = evaluateDefaultCase(expression);
    }
    else
    {
      Variable<D, R, F> variable = (Variable<D, R, F>) node;
      evaluateCase(expression, cases, variable);
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert expression.rangeType.equals(resultType) : String.format("expression.domain = %s != Integer, the only type supported presently\n",
                                                                   expression.domainType);
    try
    {
      mv.visitCode();

      labels = new Label[cases.size()];

      cases.values().forEach(val -> val.isResult = isResult);
      arg.isResult = isResult;

      generateIndex(mv);

      for (int i = 0; i < labels.length; i++)
      {
        labels[i] = new Label();
      }

      mv.visitTableSwitchInsn(0, cases.size() - 1, defaultLabel, labels);
      var branches = cases.values().stream().collect(Collectors.toList());

      for (int i = 0; i < labels.length; i++)
      {
        mv.visitLabel(labels[i]);
        mv.visitFrame(F_SAME, 0, null, 0, null);

        branches.get(i).generate(mv, resultType);
        mv.visitJumpInsn(GOTO, endSwitch);
      }

      mv.visitLabel(defaultLabel);
      mv.visitFrame(F_SAME, 0, null, 0, null);

      super.generate(mv, resultType);
      mv.visitLabel(endSwitch);
      mv.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { Type.getInternalName(resultType) });
    }
    finally
    {
      mv.visitEnd();
    }

    return mv;
  }

  private void generateIndex(MethodVisitor mv)
  {
    checkClassCast(loadInputParameter(mv), expression.domainType);
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       INTEGER_CLASS_INTERNAL_NAME,
                       "getSignedValue",
                       INT_METHOD_DESCRIPTOR,
                       false);
  }

  @Override
  public String toString()
  {
    return String.format("When[cases=%s,default=%s]",
                         cases.entrySet()
                              .stream()
                              .map(node -> node.getKey() + "=" + node.getValue().typeset())
                              .collect(Collectors.toList()),
                         arg.typeset());
  }

  @Override
  public Class<?> type()
  {
    return expression.rangeType;
  }

  @Override
  public String typeset()
  {
    return cases.entrySet().stream().map(entry -> entry.getValue().typeset()).collect(Collectors.joining(", "))
                  + " \text{otherwise} " + arg.typeset();
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return false;
  }

  @Override
  public List<Node<?, ?, ?>> getBranches()
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
