package arb.expressions.nodes;

import static arb.expressions.Compiler.prepareStackForReusingLeftSide;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.functions.Function;

public abstract class UnaryOperation<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
                                    extends
                                    Node<D, R, F>
{
  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    if (node.isReusable())
    {
      return prepareStackForReusingLeftSide(mv); 
    }
    else
    {
      throw new RuntimeException("The node is not reusable");
    }    
  }

  protected final Node<D,R,F> node;

  public UnaryOperation(Node<D,R,F> node,
                        Expression<D, R, F> expression)
  {
    super(expression);
    this.node = node;
  }

  @Override
  public String toString()
  {
    return toString(0);
  }

  public String toString(int depth)
  {
    String indent      = depth < 0 ? "" : indent(depth);
    String childIndent = depth < 0 ? "" : indent(depth + 1);
    return String.format(depth < 0 ? "%s%s[name=%s,%sarg=%s%s%s]" : "%s%s[name=%s,\n%sarg=\n %s%s\n%s]",
                         indent,
                         getClass().getSimpleName(),
                         node,
                         childIndent,
                         childIndent,
                         node.toString(depth < 0 ? depth : (depth + 1)),
                         indent);
  }

  @Override
  public boolean isReusable()
  {
    return node.isReusable() || node.isLast;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv)
  {
    return node.generate(mv);   
  }
}