package arb.expressions.nodes;

import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.*;

import java.util.HashSet;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 */
public class LiteralConstant<D, R, F extends Function<D, R>> extends
                            Node<D, R, F>
{
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

  public boolean      isInt = false;

  public final String value;

  public String       fieldName;

  public LiteralConstant(Expression<D, R, F> expression, String constantValueString)
  {
    this(expression,
         constantValueString,
         null);

  }

  public LiteralConstant(Expression<D, R, F> expression, String constantValueString, String name)
  {
    super(expression);
    assert Integer.class.equals(arb.Integer.class) : "an import statement for arb.Integer is probably missing";
    value = Utensils.subscriptToRegular(constantValueString.trim());
    isInt = !((value.contains(".") || constantSymbols.contains(value)));

    if (isConstant(constantValueString))
    {
      fieldName = constantValueString;
      return;
    }

    for (var existingConstant : expression.literalConstants)
    {
      if (existingConstant.value.equals(value))
      {
        fieldName = existingConstant.fieldName;
        return;
      }
    }
    if (name != null)
    {
      fieldName = name;
    }
    if (fieldName == null)
    {
      fieldName = expression.getNextConstantFieldName();
    }

    expression.literalConstants.add(this);
  }

  public ClassVisitor declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC & ACC_FINAL, fieldName, type().descriptorString(), null, null);
    return classVisitor;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (π.equals(fieldName))
    {
      getStaticField(mv, π);
    }
    else if (half.equals(fieldName))
    {
      getStaticField(mv, "half");
    }
    else
    {
      // todo: https://github.com/crowlogic/arb4j/issues/222: use the primitive int ,
      // the signature of the method being invoked will also have to know this has
      // been done and change correspondingly
      expression.loadFieldOntoStack(loadThisOntoStack(mv), fieldName, type().descriptorString());
    }

    if (isResult)
    {
      expression.setResult(mv, type());
    }

    return mv;
  }

  public MethodVisitor generateLiteralConstantInitializerWithString(MethodVisitor methodVisitor)
  {
    Class<?> type = type();
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, Type.getInternalName(type));
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitLdcInsn(value);
    boolean needsBitsPassedToStringConstructor = type.equals(Real.class);
    if (needsBitsPassedToStringConstructor)
    {
      methodVisitor.visitIntInsn(SIPUSH, bits);
    }
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  Type.getInternalName(type),
                                  "<init>",
                                  needsBitsPassedToStringConstructor ? "(Ljava/lang/String;I)V" : "(Ljava/lang/String;)V",
                                  false);
    methodVisitor.visitFieldInsn(PUTFIELD, expression.className, fieldName, type.descriptorString());
    return methodVisitor;
  }

  private void getStaticField(MethodVisitor mv, String fn)
  {
    mv.visitFieldInsn(Opcodes.GETSTATIC,
                      Type.getInternalName(RealConstants.class),
                      fn,
                      expression.domainClassDescriptor);
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
  public String toString()
  {
    return String.format("%s[fieldName=%s, value=%s, type=%s]",
                         getClass().getSimpleName(),
                         fieldName,
                         value,
                         type() != null ? type().getName() : null);
  }

  public String toString(int depth)
  {
    return String.format("%s[fieldName=%s, value=%s, depth=%s]",
                         getClass().getSimpleName(),
                         fieldName,
                         value,
                         depth);
  }

  @Override
  public Class<?> type()
  {
    return isInt ? Integer.class : Real.class;
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
