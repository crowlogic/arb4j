package arb.expressions.nodes;

import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.ACC_FINAL;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.DUP;
import static org.objectweb.asm.Opcodes.INVOKESPECIAL;
import static org.objectweb.asm.Opcodes.NEW;
import static org.objectweb.asm.Opcodes.PUTFIELD;
import static org.objectweb.asm.Opcodes.SIPUSH;

import java.util.HashSet;
import java.util.List;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
    classVisitor.visitField(ACC_PUBLIC
                  & ACC_FINAL, fieldName, type().descriptorString(), null, null);
    return classVisitor;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Class<?> thisType = type();
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
      expression.loadFieldOntoStack(loadThisOntoStack(mv), fieldName, thisType.descriptorString());
    }

    if (isResult)
    {
      expression.setResult(mv, thisType);
    }

    expression.addToTypeStack(thisType, toString() );

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
                                  needsBitsPassedToStringConstructor ? "(Ljava/lang/String;I)V"
                                                                     : "(Ljava/lang/String;)V",
                                  false);
    methodVisitor.visitFieldInsn(PUTFIELD,
                                 expression.className,
                                 fieldName,
                                 type.descriptorString());
    return methodVisitor;
  }

  private void getStaticField(MethodVisitor mv, String fn)
  {
    mv.visitFieldInsn(Opcodes.GETSTATIC,
                      Type.getInternalName(RealConstants.class),
                      fn,
                      Real.class.descriptorString());
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
    return value;
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

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return false;
  }

  @Override
  public List<Node<?, ?, ?>> getBranches()
  {
    return List.of();
  }
}
