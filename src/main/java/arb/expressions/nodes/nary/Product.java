package arb.expressions.nodes.nary;

import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;

import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  private static final char[] ALPHANUMERIC_AND_SUBSCRIPT_CHARACTERS = new char[]
  { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₕ', 'ᵢ', 'ⱼ', 'ₖ', 'ₗ', 'ₘ',
    'ₙ', 'ₒ', 'ₚ', 'ᵣ', 'ₛ', 'ₜ', 'ᵤ', 'ᵥ', 'ₓ', '…' };

  Node<D, R, F>               factor;

  String                      rangeString;

  String                      expr;

  Range                       range;

  public class Range
  {

    public Node<D, R, F> firstIndex;
    public Node<D, R, F> lastIndex;
  }

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    factor = expression.evaluate();

    if (expression.nextCharacterIs('₌'))
    {
      Node<D, R, F> startIndex = expression.evaluate();

      if (!expression.nextCharacterIs('…'))
      {
        throw new ExpressionCompilerException(String.format("range format is expected to be startIndex…endIndex but got %c character at index %s of %s and startIndex=%s\n",
                                                            expression.character,
                                                            expression.position,
                                                            expression,startIndex));
      }
      Node<D, R, F> endIndex = expression.evaluate();

      range            = new Range();
      range.firstIndex = startIndex;
      range.lastIndex  = endIndex;
      out.println("product ranges from " + startIndex + " to " + endIndex);
    }

    int startPos = expression.position;
    while (expression.nextCharacter() != ')' && expression.position < expression.expression.length());
    expr = expression.expression.substring(startPos, expression.position);
    System.out.format("Product(factor=%s, range=%s, expr=%s)\n", factor, rangeString, expr);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: Auto-generated method stub for generate: resultType=" + resultType + " expr=" + expr;
    return null;
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    return null;
  }

  @Override
  public String typeset()
  {
    return String.format("product(%s,%s=%s)", factor, expr, rangeString);
  }

  @Override
  public <C> Class<? extends C> type()
  {
    return factor.type();
  }

}
