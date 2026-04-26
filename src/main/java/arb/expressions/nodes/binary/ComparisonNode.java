package arb.expressions.nodes.binary;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

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
 * A reusable binary comparison node — one class for the six relational
 * operators selected by an {@link Operator} enum carried in the constructor.
 *
 * <p>
 * Currently only {@code Integer×Integer → int} comparisons are admitted. The
 * constructor enforces this by inspecting {@code left.type()} and
 * {@code right.type()} and throwing a {@link CompilerException} if either
 * operand is not {@link arb.Integer}-typed. Real, Complex, and Fraction
 * comparisons are deliberately tabled — the dispatch table for those primitives
 * is not yet wired up. When that work lands the type-check below is the single
 * point that needs to relax.
 *
 * <p>
 * The result of a comparison is a JVM {@code int} 0 or 1 left on the operand
 * stack — there is no boxed {@code arb.Boolean} type in arb4j. Code paths that
 * consume a comparison (the planned boolean combinator nodes, {@link arb.expressions.nodes.unary.WhenNode}
 * predicates) read the 0/1 directly with {@code IFEQ}/{@code IFNE}.
 *
 * <p>
 * For the rare interpretive (non-compiled) evaluation path, {@link #evaluate}
 * is overridden to write a 0 or 1 into an {@link arb.Integer} result so the
 * inherited {@code <T extends Field<T>> T evaluate(Class<T>, int, T)} contract
 * is honored — {@code arb.Integer} is itself a {@link arb.Field}.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ComparisonNode<D, R, F extends Function<? extends D, ? extends R>> extends
                           BinaryOperationNode<D, R, F>
{

  /**
   * The six relational operators. Each carries the Unicode rendering used in
   * source and {@code typeset}, the LaTeX form, the {@code BinaryOperationNode}
   * operation tag, and the JVM bytecode opcode that branches when the
   * comparison-of-{@code compareTo}-result-against-zero is satisfied. The
   * opcode is applied with the comparison's signed result on top of the operand
   * stack and {@code 0} just below it (see {@link #generate}).
   */
  public enum Operator
  {
    LT("<", "<", "lt", Opcodes.IFLT),
    LE("≤", "\\leq", "le", Opcodes.IFLE),
    GT(">", ">", "gt", Opcodes.IFGT),
    GE("≥", "\\geq", "ge", Opcodes.IFGE),
    EQ("=", "=", "eq", Opcodes.IFEQ),
    NE("≠", "\\neq", "ne", Opcodes.IFNE);

    public final String symbol;
    public final String latex;
    public final String operation;
    public final int    opcode;

    Operator(String symbol, String latex, String operation, int opcode)
    {
      this.symbol    = symbol;
      this.latex     = latex;
      this.operation = operation;
      this.opcode    = opcode;
    }

    public boolean isCommutative()
    {
      return this == EQ || this == NE;
    }
  }

  private static final String INTEGER_INTERNAL_NAME       = Type.getInternalName(Integer.class);
  private static final String INTEGER_DESCRIPTOR          = Type.getDescriptor(Integer.class);
  private static final String COMPARE_TO_METHOD_DESCRIPTOR = "(" + INTEGER_DESCRIPTOR + ")I";

  public final Operator       operator;

  /**
   * Construct a comparison node, validating the operand types in the process.
   * Both operands must currently resolve to {@link arb.Integer}; anything else
   * is a {@link CompilerException} at construction time, which is the earliest
   * point at which the violation can be detected and is the user-mandated
   * place for the check.
   */
  public ComparisonNode(Expression<D, R, F> expression,
                        Node<D, R, F> left,
                        Operator operator,
                        Node<D, R, F> right)
  {
    super(expression, left, operator.operation, right, operator.symbol);
    this.operator = operator;

    var leftType  = left.type();
    var rightType = right.type();
    if (!Integer.class.equals(leftType) || !Integer.class.equals(rightType))
    {
      throw new CompilerException(String.format("ComparisonNode currently only supports Integer×Integer operands, "
                                                + "but got %s %s %s where left is %s-valued and right is %s-valued in %s",
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
    // The result of a comparison is a JVM int (0 or 1). Returning int.class
    // here lets nested predicates and the {@code WhenNode} general-path
    // generator recognize comparison results without consulting a typeMap
    // entry. Comparisons do not participate in the standard arithmetic
    // promotion lattice in {@link BinaryOperationNode#typeMap}; the
    // generator emits the result directly as a primitive and consumers
    // branch on it with {@code IFEQ}/{@code IFNE}.
    return int.class;
  }

  @Override
  public boolean isCommutative()
  {
    return operator.isCommutative();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    // Emit:
    //   left.generate              -> arb.Integer on stack
    //   right.generate             -> arb.Integer on stack
    //   INVOKEVIRTUAL Integer.compareTo(Integer)I    -> int (sign of difference) on stack
    //   IF<op> Ltrue                -> branch when the sign of (left - right) satisfies the relation
    //   ICONST_0; GOTO Lend
    // Ltrue:
    //   ICONST_1
    // Lend:
    //
    // The IF<op> opcodes (IFLT/IFLE/IFGT/IFGE/IFEQ/IFNE) consume the int on
    // top of the stack and branch when it satisfies the relation against
    // zero. Since {@code arb.Integer.compareTo} returns the sign of
    // (this - other), each opcode encodes the corresponding comparison of
    // the original operands.
    left.generate(mv, Integer.class);
    right.generate(mv, Integer.class);
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       INTEGER_INTERNAL_NAME,
                       "compareTo",
                       COMPARE_TO_METHOD_DESCRIPTOR,
                       false);

    Label trueLabel = new Label();
    Label endLabel  = new Label();

    mv.visitJumpInsn(operator.opcode, trueLabel);
    mv.visitInsn(Opcodes.ICONST_0);
    mv.visitJumpInsn(Opcodes.GOTO, endLabel);
    Compiler.designateLabel(mv, trueLabel);
    mv.visitInsn(Opcodes.ICONST_1);
    Compiler.designateLabel(mv, endLabel);

    return mv;
  }

  /**
   * Interpretive evaluation. The inherited contract requires
   * {@code <T extends Field<T>> T evaluate(Class<T>, int, T)} to return a
   * {@link Field}-valued result; {@link arb.Integer} satisfies that bound and
   * the natural way to encode a JVM-style boolean inside the existing field
   * machinery is to set the result {@code Integer} to 0 or 1. Callers in the
   * compiled path do not invoke this method — it exists so symbolic
   * simplification and constant folding can fire on comparison sub-trees of
   * literal-only operands without descending to bytecode.
   */
  @Override
  @SuppressWarnings("unchecked")
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (!Integer.class.equals(resultType))
    {
      throw new UnsupportedOperationException("ComparisonNode.evaluate is only defined when resultType=arb.Integer; got "
                                              + resultType);
    }
    if (result == null)
    {
      result = (T) Utensils.newInstance(resultType);
    }
    try ( var leftValue  = (Integer) left.evaluate(Integer.class, bits, new Integer());
          var rightValue = (Integer) right.evaluate(Integer.class, bits, new Integer()))
    {
      int sign = leftValue.compareTo(rightValue);
      int outcome = switch (operator)
      {
        case LT -> sign <  0 ? 1 : 0;
        case LE -> sign <= 0 ? 1 : 0;
        case GT -> sign >  0 ? 1 : 0;
        case GE -> sign >= 0 ? 1 : 0;
        case EQ -> sign == 0 ? 1 : 0;
        case NE -> sign != 0 ? 1 : 0;
      };
      ((Integer) result).set(outcome);
      return result;
    }
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("differentiate is undefined for the boolean-valued ComparisonNode "
                                            + this);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("integral is undefined for the boolean-valued ComparisonNode "
                                            + this);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new ComparisonNode<>(newExpression,
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
