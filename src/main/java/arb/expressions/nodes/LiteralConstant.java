package arb.expressions.nodes;

import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.System.out;

import java.util.HashSet;
import java.util.Objects;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class LiteralConstant<D, R, F extends Function<D, R>> extends
                            Node<D, R, F>
{
  @Override
  public Class<?> type()
  {
    assert Integer.class.equals(arb.Integer.class) : "an import statement for arb.Integer is probably missing";
    return (value.contains(".") || constantSymbols.contains(value)) ? Real.class : Integer.class;
  }

  public final String           value;
  public String                 fieldName;

  public static final String    π               = "π";

  public static final String    half            = "½";

  public static HashSet<String> constantSymbols = new HashSet<String>();

  static
  {
    constantSymbols.add(π);
    constantSymbols.add(half);
  }

  public static boolean isConstant(String var)
  {
    return constantSymbols.contains(var);
  }

  public LiteralConstant(Expression<D, R, F> expression, String constantValueString, int depth)
  {
    super(expression,
          depth + 1);
    value = constantValueString.trim();

    if (isConstant(constantValueString))
    {
      fieldName = constantValueString;
      return;
    }

    for (var existingConstant : expression.literalConstants)
    {
      if (existingConstant.value.equals(value))
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
      out.format("\nAdding constant %s of type %s to %s with value %s\n\n", fieldName, type(), expression, value);
      out.flush();
    }
    expression.literalConstants.add(this);
  }

  @Override
  public String toString()
  {
    return String.format("%s[fieldName=%s, value=%s, depth=%s, type=%s]",
                         getClass().getSimpleName(),
                         fieldName,
                         value,
                         depth,
                         type() != null ? type().getName() : null);
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
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
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
    else if (half.equals(fieldName))
    {
      mv.visitFieldInsn(Opcodes.GETSTATIC,
                        Type.getInternalName(RealConstants.class),
                        "half",
                        expression.domainClassDescriptor);
    }
    else
    {
      expression.loadFieldOntoStack(loadThisOntoStack(mv), fieldName, type());
    }

    if (isResult)
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

  @Override
  public String typeset()
  {
    if (π.equals(value))
    {
      return "\\pi";
    }
    else if (half.equals(value))
    {
      return "\\frac{1}{2}";
    }
    else
    {
      return value;
    }
  }
}
