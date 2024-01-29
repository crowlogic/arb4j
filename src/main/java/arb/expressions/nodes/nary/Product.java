package arb.expressions.nodes.nary;

import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.Utensils;

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
      int startPos = expression.position;
      while (expression.nextCharacterIs(ALPHANUMERIC_AND_SUBSCRIPT_CHARACTERS));
      rangeString = expression.expression.substring(startPos, expression.position);
      String[] interval = rangeString.split("…");
      for ( int i = 0; i < interval.length; i++ )
      {
        interval[i] = Utensils.subscriptToRegular(interval[i]);
      }
      assert interval.length == 2 : "range format is expected to be startIndex…endIndex but got '" + rangeString
                    + "'";
      range = new Range();
      out.println("product ranges from " + interval[0] + " to " + interval[1]);
    }

    int startPos = expression.position;
    while (expression.nextCharacter() != ')' && expression.position < expression.expression.length());
    expr = expression.expression.substring(startPos, expression.position);
    System.out.format("Product(factor=%s, range=%s, expr=%s)\n", factor, rangeString, expr);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: Auto-generated method stub: resultType=" + resultType + " expr=" + expr;
    return null;
  }

  @Override
  public String toString(int depth)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public boolean isReusable()
  {
    assert false : "TODO: Auto-generated method stub";
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "TODO: Auto-generated method stub";
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
