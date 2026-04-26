package arb.expressions.nodes.unary;

import java.util.List;
import java.util.function.Consumer;

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
 * Boolean negation — flips a JVM int 0/1 predicate to its logical complement.
 *
 * <p>
 * Distinct from the arithmetic {@link NegationNode}, which negates a numeric
 * value. The two operations are unrelated mathematically (one is multiplicative
 * inversion of sign on a field; the other is logical complementation on a
 * two-valued algebra) and use different bytecode strategies, so they live in
 * separate classes despite sharing a parent.
 *
 * <p>
 * The operand must be predicate-typed — its {@link Node#type()} must report
 * {@code int.class}. The constructor enforces this and throws
 * {@link CompilerException} immediately on any other operand. Predicate
 * operands today are {@link arb.expressions.nodes.binary.ComparisonNode}s,
 * {@link arb.expressions.nodes.binary.BooleanCombinatorNode}s, or other
 * {@link BooleanNegationNode}s.
 *
 * <p>
 * The result is again a JVM {@code int} 0 or 1 on the stack.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class BooleanNegationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                UnaryOperationNode<D, R, F>
{

  /**
   * Construct a boolean negation, validating that the operand is
   * predicate-typed.
   */
  public BooleanNegationNode(Expression<D, R, F> expression, Node<D, R, F> arg)
  {
    super(expression, arg);

    var argType = arg.type();
    if (!int.class.equals(argType))
    {
      throw new CompilerException(String.format("BooleanNegationNode operand must be predicate-typed (int.class), "
                                                + "but got ¬%s where the operand is %s-typed in %s",
                                                arg,
                                                argType == null ? "null" : argType.getSimpleName(),
                                                expression));
    }
  }

  @Override
  public Class<?> type()
  {
    return int.class;
  }

  @Override
  public char symbol()
  {
    return '¬';
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    // Emit:
    //   arg.generate              -> int 0/1 on stack
    //   IFNE pushZero             -> if true, jump to push 0
    //   ICONST_1; GOTO end        -> else push 1
    // pushZero:
    //   ICONST_0
    // end:
    //
    // Equivalent to ¬x = 1 - x for x in {0,1}, but the explicit branch is the
    // clearer translation and matches the IFEQ/IFNE convention of every other
    // predicate node in this package.
    arg.generate(mv, int.class);

    Label pushZero = new Label();
    Label end      = new Label();

    mv.visitJumpInsn(Opcodes.IFNE, pushZero);
    mv.visitInsn(Opcodes.ICONST_1);
    mv.visitJumpInsn(Opcodes.GOTO, end);
    Compiler.designateLabel(mv, pushZero);
    mv.visitInsn(Opcodes.ICONST_0);
    Compiler.designateLabel(mv, end);

    return mv;
  }

  /**
   * Interpretive evaluation. Encodes the complement of the operand's 0/1 into
   * an {@link arb.Integer} for the constant-folding path.
   */
  @Override
  @SuppressWarnings("unchecked")
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (!Integer.class.equals(resultType))
    {
      throw new UnsupportedOperationException("BooleanNegationNode.evaluate is only defined when resultType=arb.Integer; got "
                                              + resultType);
    }
    if (result == null)
    {
      result = (T) Utensils.newInstance(resultType);
    }
    try ( var argValue = (Integer) arg.evaluate(Integer.class, bits, new Integer()))
    {
      int outcome = argValue.getSignedValue() == 0 ? 1 : 0;
      ((Integer) result).set(outcome);
      return result;
    }
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("differentiate is undefined for the boolean-valued BooleanNegationNode "
                                            + this);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("integral is undefined for the boolean-valued BooleanNegationNode "
                                            + this);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(arg);
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    arg.accept(t);
    t.accept(this);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new BooleanNegationNode<>(newExpression, arg.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> transformation)
  {
    arg = arg.substitute(variable, transformation);
    return this;
  }

  @Override
  public String typeset()
  {
    return String.format("\\lnot %s", arg.typeset());
  }

  @Override
  public String toString()
  {
    return "¬" + arg;
  }
}
