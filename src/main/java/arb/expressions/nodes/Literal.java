package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * A constant made available to a process, by inclusion in the executable text.
 * Most modern systems do not allow texts to modify themselves during execution,
 * so literals are indeed constant; their value is written at compile-time and
 * is read-only at run time.
 * 
 * In contrast, values placed in variables or files and accessed by the process
 * via a symbolic name, can be changed during execution. This may be an asset.
 * For example, messages can be given in a choice of languages by placing the
 * translation in a file.
 * 
 * Literals are used when such modification is not desired. The name of the file
 * mentioned above (not its content), or a physical constant such as 3.14159,
 * might be coded as a literal. Literals can be accessed quickly, a potential
 * advantage of their use.
 */
public class Literal<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                    Node
{
  public final String value;
  public final String fieldName;

  public Literal(Expression parser,
                 String constantValueString)
  {
    super(parser);
    this.value     = constantValueString;
    this.fieldName = parser.getNextConstantFieldName();
    if (verbose)
    {
      out.println("Adding constant " + fieldName + " to " + parser + " with value " + value);
    }
    parser.literals.add(this);

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

    loadThis(mv);
    expression.loadField(mv, fieldName, false);

    if (isLast)
    {
      loadResult(mv);

      expression.checkClassCast(mv, false);

      mv.visitInsn(SWAP);

      String dcd = expression.domainClassDescriptor;
      mv.visitMethodInsn(INVOKEVIRTUAL,
                         expression.domainClassInternalName,
                         "set",
                         format("(%s)%s", dcd, dcd),
                         false);
      mv.visitInsn(DUP);
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
