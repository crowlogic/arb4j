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

  @Override
  public String toString()
  {
    return String.format("Product[factor=%s, expr=%s, range=%s]", factor, expr, range);
  }
  
  @Override
  public String typeset()
  {
    return String.format("product(%s,%s=%s)", factor, expr, range);
  }


  Node<D, R, F> factor;

  String        expr;

  Range         range;

  public class Range
  {

    @Override
    public String toString()
    {
      return String.format("Range[%s…%s]", firstIndex.typeset(), lastIndex.typeset());
    }
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
        throw new ExpressionCompilerException(String.format("range format is expected to be startIndex…endIndex but got %c character at index %s of %s\n",
                                                            expression.character,
                                                            expression.position,
                                                            expression));
      }
      Node<D, R, F> endIndex = expression.evaluate();

      range            = new Range();
      range.firstIndex = startIndex;
      range.lastIndex  = endIndex;
      out.println("\nproduct ranges from\n \n" + startIndex + "\n to \n" + endIndex + "\n");
    }

    int startPos = expression.position;
    while (expression.nextCharacter() != ')' && expression.position < expression.expression.length());
    expr = expression.expression.substring(startPos, expression.position);
    System.err.println(this);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: Auto-generated method stub: resultType=" + resultType + " expr=" + expr;
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
  public <C> Class<? extends C> type()
  {
    return factor.type();
  }

}
