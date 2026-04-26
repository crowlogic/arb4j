package arb.expressions.nodes.binary;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Field;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * A reusable binary boolean combinator — one class for both conjunction
 * ({@code ∧}) and disjunction ({@code ∨}), selected by an {@link Operator}
 * enum carried in the constructor.
 *
 * <p>
 * Operands must be predicate-typed — i.e. their {@link Node#type()} must
 * report {@code int.class}, the convention adopted by
 * {@link ComparisonNode} and by this class itself. The constructor enforces
 * this and throws {@link CompilerException} immediately on any other operand
 * combination, making misuse impossible to defer until generation time.
 *
 * <p>
 * The result of a combinator is again a JVM {@code int} 0 or 1 left on the
 * operand stack — the same representation used by every other predicate node.
 * Generation uses short-circuit semantics: for {@code ∧} the right operand is
 * only evaluated if the left is true; for {@code ∨} it is only evaluated if
 * the left is false. This matches the natural mathematical reading and avoids
 * unnecessary work, which becomes important once the right-hand operand is a
 * compound predicate involving Arb-precision arithmetic.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class BooleanCombinatorNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                  BinaryOperationNode<D, R, F>
{

  /**
   * The two binary boolean connectives. {@code AND}'s short-circuit identity
   * is "if left is false, the answer is false"; {@code OR}'s is "if left is
   * true, the answer is true." {@link #shortCircuitOpcode} is the JVM jump
   * opcode that fires the short-circuit branch when the left operand has
   * just been evaluated and lies on top of the stack:
   * {@code IFEQ}/0-jumps for AND, {@code IFNE}/1-jumps for OR.
   * {@link #shortCircuitResult} is the constant pushed when the short-
   * circuit branch fires (0 for AND because false-AND-anything is false,
   * 1 for OR because true-OR-anything is true).
   */
  public enum Operator
  {
    AND("∧", "\\land", "and", Opcodes.IFEQ, 0),
    OR("∨", "\\lor", "or", Opcodes.IFNE, 1);

    public final String symbol;
    public final String latex;
    public final String operation;
    public final int    shortCircuitOpcode;
    public final int    shortCircuitResult;

    Operator(String symbol, String latex, String operation, int shortCircuitOpcode, int shortCircuitResult)
    {
      this.symbol             = symbol;
      this.latex              = latex;
      this.operation          = operation;
      this.shortCircuitOpcode = shortCircuitOpcode;
      this.shortCircuitResult = shortCircuitResult;
    }
  }

  public final Operator operator;

  /**
   * Construct a boolean combinator, validating that both operands are
   * predicate-typed (their {@link Node#type()} returns {@code int.class}).
   * Anything else is a {@link CompilerException} at construction time.
   * Predicate operands today are {@link ComparisonNode}s, other
   * {@link BooleanCombinatorNode}s, and
   * {@link arb.expressions.nodes.unary.BooleanNegationNode}s.
   */
  public BooleanCombinatorNode(Expression<D, R, F> expression,
                               Node<D, R, F> left,
                               Operator operator,
                               Node<D, R, F> right)
  {
    super(expression, left, operator.operation, right, operator.symbol);
    this.operator = operator;

    var leftType  = left.type();
    var rightType = right.type();
    if (!int.class.equals(leftType) || !int.class.equals(rightType))
    {
      throw new CompilerException(String.format("BooleanCombinatorNode operands must be predicate-typed (int.class), "
                                                + "but got %s %s %s where left is %s-typed and right is %s-typed in %s",
                                                left,
                                                operator.symbol,
                                                right,
                                                leftType == null ? "null" : leftType.getSimpleName(),
                                                rightType == null ? "null" : rightType.getSimpleName(),
                                                expression));
    }
  }

  @Override
  public Class<?> type()
  {
    return int.class;
  }

  @Override
  public boolean isCommutative()
  {
    return true;
  }

  @Override
  public boolean isAssociative()
  {
    return true;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    // Short-circuit emission. Both operators share one pattern parameterized by
    // the (opcode, short-circuit-result) pair on the operator:
    //
    //   left.generate                         -> int 0/1 on stack
    //   IF<sc> shortLabel                     -> branch on short-circuit value
    //   right.generate                        -> int 0/1 on stack
    //   GOTO endLabel
    // shortLabel:
    //   ICONST_<scResult>                     -> push the short-circuit answer
    // endLabel:
    //
    // For AND, IFEQ branches when left == 0 and shortLabel pushes 0
    // (false ∧ x = false). The right operand is only evaluated when left
    // was truthy.
    //
    // For OR, IFNE branches when left == 1 and shortLabel pushes 1
    // (true ∨ x = true). The right operand is only evaluated when left
    // was falsy.
    //
    // After the merge, exactly one int 0 or 1 is on the stack.
    left.generate(mv, int.class);

    Label shortLabel = new Label();
    Label endLabel   = new Label();

    mv.visitJumpInsn(operator.shortCircuitOpcode, shortLabel);
    right.generate(mv, int.class);
    mv.visitJumpInsn(Opcodes.GOTO, endLabel);
    Compiler.designateLabel(mv, shortLabel);
    mv.visitInsn(operator.shortCircuitResult == 0 ? Opcodes.ICONST_0 : Opcodes.ICONST_1);
    Compiler.designateLabel(mv, endLabel);

    return mv;
  }

  /**
   * Interpretive evaluation. Left operand drives the short-circuit decision
   * just as in the compiled path; the result is encoded into an
   * {@link arb.Integer} so the inherited {@link Field}-bounded contract is
   * satisfied.
   */
  @Override
  @SuppressWarnings("unchecked")
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (!Integer.class.equals(resultType))
    {
      throw new UnsupportedOperationException("BooleanCombinatorNode.evaluate is only defined when resultType=arb.Integer; got "
                                              + resultType);
    }
    if (result == null)
    {
      result = (T) Utensils.newInstance(resultType);
    }
    try ( var leftValue = (Integer) left.evaluate(Integer.class, bits, new Integer()))
    {
      int leftBit = leftValue.getSignedValue();
      int outcome;
      switch (operator)
      {
      case AND:
        if (leftBit == 0)
        {
          outcome = 0;
        }
        else
        {
          try ( var rightValue = (Integer) right.evaluate(Integer.class, bits, new Integer()))
          {
            outcome = rightValue.getSignedValue() != 0 ? 1 : 0;
          }
        }
        break;
      case OR:
        if (leftBit != 0)
        {
          outcome = 1;
        }
        else
        {
          try ( var rightValue = (Integer) right.evaluate(Integer.class, bits, new Integer()))
          {
            outcome = rightValue.getSignedValue() != 0 ? 1 : 0;
          }
        }
        break;
      default:
        throw new IllegalStateException("unknown operator " + operator);
      }
      ((Integer) result).set(outcome);
      return result;
    }
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("differentiate is undefined for the boolean-valued BooleanCombinatorNode "
                                            + this);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("integral is undefined for the boolean-valued BooleanCombinatorNode "
                                            + this);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new BooleanCombinatorNode<>(newExpression,
                                       left.spliceInto(newExpression),
                                       operator,
                                       right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return String.format("\\left(%s %s %s\\right)", left.typeset(), operator.latex, right.typeset());
  }
}
