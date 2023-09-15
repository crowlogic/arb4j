package arb.expressions.nodes;

import static arb.expressions.Compiler.loadThis;
import static java.lang.System.out;

import org.objectweb.asm.*;

import arb.RealConstants;
import arb.expressions.Expression;
import arb.functions.Function;

public class LiteralConstant<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                            Node<D, R, F>
{
  public final String value;
  public String       fieldName;

  String              π = "π";

  public LiteralConstant(Expression<D, R, F> expression, String constantValueString, int depth)
  {
    super(expression,
          depth + 1);
    value = constantValueString;

    if (π.equals(constantValueString))
    {
      fieldName = π;
      return;
    }

    for (LiteralConstant<D, R, F> existingConstant : expression.literalConstants)
    {
      if (existingConstant.value.equals(constantValueString))
      {
        if (verbose)
        {
          out.println("Reusing " + existingConstant);
        }
        fieldName = existingConstant.fieldName;
        return;
      }
    }

    if (fieldName == null)
    {
      fieldName = expression.getNextConstantFieldName();
    }

    if (verbose)
    {
      out.println("Adding constant " + fieldName + " to " + expression + " with value " + value);
    }
    expression.literalConstants.add(this);
  }

  @Override
  public String toString()
  {
    return String.format("%s[fieldName=%s, value=%s, depth=%s]",
                         getClass().getSimpleName(),
                         fieldName,
                         value,
                         depth);
  }

  public String toString(int depth)
  {
    return String.format("%s%s[fieldName=%s, value=%s, depth=%s]",
                         depth < 0 ? "" : indent(depth),
                         getClass().getSimpleName(),
                         fieldName,
                         value,
                         depth);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv)
  {
    if (verbose)
    {
      out.println(this);
    }

    if (π.equals(fieldName))
    {
      mv.visitFieldInsn(Opcodes.GETSTATIC,
                        Type.getInternalName(RealConstants.class),
                        fieldName,
                        expression.domainClassDescriptor);
    }
    else
    {
      expression.loadField(loadThis(mv), fieldName, false);
    }

    if (isLast)
    {
      expression.setResult(mv);
    }

    return mv;
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
