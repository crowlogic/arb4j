package arb.expressions.nodes.nary;

import org.objectweb.asm.MethodVisitor;

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

  String                      range;

  String expr;
  
  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    factor = expression.evaluate();

    if (expression.nextCharacterIs('₌'))
    {
      int startPos = expression.position;
      while (expression.nextCharacterIs(ALPHANUMERIC_AND_SUBSCRIPT_CHARACTERS));
      range = expression.expression.substring(startPos, expression.position);
    }

    int startPos = expression.position;
    while (expression.nextCharacter() != ')' && expression.position < expression.expression.length());
    expr = expression.expression.substring(startPos, expression.position);
    System.out.format("Product(factor=%s, range=%s, expr=%s)\n", factor, range, expr);
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
   return String.format("product(%s,%s=%s)", factor, expr, range );
  }

  @Override
  public <C> Class<? extends C> type()
  {
    return factor.type();
  }

}
