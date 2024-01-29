package arb.expressions.nodes.nary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  private static final char[] ALPHANUMERIC_SUBSCRIPT_CHARACTERS = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₕ', 'ᵢ', 'ⱼ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₒ', 'ₚ', 'ᵣ',
    'ₛ', 'ₜ', 'ᵤ', 'ᵥ', 'ₓ', '…' };

  private static final char[] SUBSCRIPT_CHARACTERS              = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ',
    'ₜ' };

  Node<D, R, F>               index;

  String                      range;

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    index = expression.evaluate();

    if (expression.nextCharacterIs('₌'))
    {
      int startPos = expression.position;
      while (expression.nextCharacterIs(ALPHANUMERIC_SUBSCRIPT_CHARACTERS));
      range = expression.expression.substring(startPos, expression.position);
    }

    int startPos = expression.position;
    while (expression.nextCharacter() != ')' && expression.position < expression.expression.length());
    String expr = expression.expression.substring(startPos, expression.position);
    System.out.format("Product(index=%s, range=%s, expr=%s)\n", index, range, expr);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: Auto-generated method stub";
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
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
