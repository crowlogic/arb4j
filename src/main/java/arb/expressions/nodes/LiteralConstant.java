package arb.expressions.nodes;

import static arb.expressions.Compiler.generateLoadThis;
import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * FIXME: if a constant has the same value as an already generated constant then
 * re-use it rather than making a new one
 * 
 * @param <D>
 * @param <R>
 * @param <F>
 */
public class LiteralConstant<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                            Node<D, R, F>
{
  public final String value;
  public final String fieldName;

  public LiteralConstant(Expression<D, R, F> expression, String constantValueString)
  {
    super(expression);
    this.value     = constantValueString;
    this.fieldName = expression.getNextConstantFieldName();
    if (verbose)
    {
      out.println("Adding constant " + fieldName + " to " + expression + " with value " + value);
    }
    expression.literalConstants.add(this);

  }

  @Override
  public String toString()
  {
    return String.format("%s[fieldName=%s, value=%s]", getClass().getSimpleName(), fieldName, value);
  }

  public String toString(int depth)
  {
    return String.format("%s%s[value=%s]", depth < 0 ? "" : indent(depth), getClass().getSimpleName(), value);
  }

  @Override
  public void generate(MethodVisitor mv)
  {
    if (verbose)
    {
      out.println(this);
    }

    expression.generateLoadField(generateLoadThis(mv), fieldName, false);

    if (isLast)
    {
      expression.generateSetResultMethodCall(mv);
    }

  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "a constant is never reusable";
    return null;
  }
}
