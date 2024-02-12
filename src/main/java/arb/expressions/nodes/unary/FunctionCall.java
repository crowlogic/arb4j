package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.*;

import java.util.Arrays;
import java.util.HashSet;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.Parser;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * {@link FunctionCall} is a {@link Node} in the {@link Expression} that
 * represents a call to either a builtin or a contextual function. A built-in
 * function is one that is a member of the type of the domain or range of the
 * function, such as {@link Real#tanh(int, Real)}. <br>
 * <br>
 * A contextual function is one that is shared thru a mutual {@link Context} by
 * constructing one and passing it to the
 * {@link Function#express(Class, Class, String, Context)} function or one of
 * the other variations of the express function that accepts a {@link Context}
 * argument. <br>
 * <br>
 * For the function to be callable from another function via a shared
 * {@link Context} either the
 * {@link Function#express(Class, Class, String, String, Context)} or
 * {@link Function#express(Class, Class, String, String, Context)} methods that
 * accepts another {@link String} argument specifying the name of the function
 * should be used.<br>
 * <br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionCall<D, R, F extends Function<D, R>> extends
                         UnaryOperation<D, R, F>
{

  public String                functionName;
  public boolean               contextual                      = false;
  public FunctionMapping<D, R> mapping;

  HashSet<String>              integerFunctionsWithRealResults = new HashSet<>(Arrays.asList(new String[]
  { "sqrt", "tanh", "log" }));

  Class<?>                     targetResultType;

  @SuppressWarnings("unchecked")
  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument)
  {
    super(argument,
          expression);
    this.functionName = Parser.replaceArrowsAndEllipses(functionName).replace("ln", "log").replace("√", "sqrt");
    targetResultType  = resultTypeFor(functionName);

    // assert argument == null && !targetResultType.equals(Void.class) : "argument
    // is null for " + this;
    if (expression.context != null)
    {
      mapping    = (FunctionMapping<D, R>) expression.context.functions.map.get(functionName);
      contextual = mapping != null;
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, mapping);
      }
    }

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {


    if (functionName.equals(expression.functionName))
    {
      contextual           = true;
      mapping              = new FunctionMapping<>();
      targetResultType     = expression.rangeType;
      mapping.range        = targetResultType;
      mapping.domain       = getDomainType();
      mapping.name         = functionName;
      expression.recursive = true;

    }

    if (contextual)
    {
      return generateContextualFunctionCall(mv, resultType);
    }
    else
    {
      return generateBuiltinFunctionCall(mv, resultType);
    }
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    var     expression                = arg.expression;
    boolean needsResultTypeConversion = !resultType.equals(targetResultType);

    if (needsResultTypeConversion)
    {
      loadResultParameter(methodVisitor);
    }

    arg.generate(methodVisitor, expression.domainType);
    loadBitsParameter(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, resultType);

    Class<?> domainType = getDomainType();
    Class<?> rangeType  = targetResultType;

    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s", rangeType.descriptorString(), rangeType.descriptorString()),
                                  false);
    if (needsResultTypeConversion)
    {
      invokeSetMethod(methodVisitor, targetResultType, resultType);

    }
    return methodVisitor;
  }

  public Class<?> getDomainType()
  {
    return arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
  }

  public static MethodVisitor conditionallyInstantiate(MethodVisitor mv,
                                                       String thisClassName,
                                                       String className,
                                                       String fieldName,
                                                       String fieldType)
  {
    mv.visitVarInsn(ALOAD, 0);
    mv.visitFieldInsn(GETFIELD, className, fieldName, fieldType);
    Label fieldAlreadyPopulated = new Label();
    mv.visitJumpInsn(IFNONNULL, fieldAlreadyPopulated);
    mv.visitVarInsn(ALOAD, 0);

    mv.visitTypeInsn(Opcodes.NEW, className);
    mv.visitInsn(Opcodes.DUP);
    mv.visitVarInsn(Opcodes.ALOAD, 0);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, className, "<init>", format("(L%s;)V", className), false);

    mv.visitFieldInsn(PUTFIELD, thisClassName, fieldName, fieldType);
    mv.visitLabel(fieldAlreadyPopulated);
    mv.visitFrame(F_SAME1, 0, null, 1, new Object[]
    { fieldType });

    return mv;
  }

  public void inactive(MethodVisitor mv)
  {
    if (isRecursive())
    {
      conditionallyInstantiate(mv, functionName, expression.className, functionName, format("L%s;", functionName));
    }
  }

  @SuppressWarnings("unchecked")
  public MethodVisitor generateContextualFunctionCall(MethodVisitor mv, Class<?> resultType)
  {
    Class<?>              type        = type();
    FunctionMapping<D, R> mapping     = expression.context.functions.get(functionName);
    F                     func        = (F) mapping.func;
    boolean               isRecursive = isRecursive();

    mv.visitFrame(F_SAME, 0, null, 0, null);

    if (func == null && mapping.functionInterface == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s", mapping));
    }

    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  functionName,
                                  mapping.func != null ? mapping.func.getClass()
                                                                     .descriptorString() : String.format("L%s;",
                                                                                                         functionName));

    Class<?> argType                = arg == null ? Void.class : arg.type();
    var      typeBefore             = argType;
    boolean  isVoid                 = Void.class.equals(mapping.domain);
    boolean  needsArgTypeConversion = !argType.equals(mapping.domain) && !isVoid;

    if (needsArgTypeConversion)
    {
      expression.reserveIntermediateVariable(mv, mapping.domain);
    }

    if (isVoid)
    {
      mv.visitInsn(Opcodes.ACONST_NULL);
    }
    else
    {
      arg.generate(mv, argType);
    }

    Class<?> typeAfter = isVoid ? Void.class : arg.type();

    assert typeBefore.equals(typeAfter)
                  || isVoid : String.format("%s: typeBefore=%s typeAfter=%s\n", this, typeBefore, typeAfter);

    if (needsArgTypeConversion)
    {
      invokeSetMethod(mv, arg.type(), mapping.domain);
    }

    loadOrderParameter(mv);
    loadBitsParameter(mv);

    loadOutputVariableOntoStack(mv, expression, type);

    return expression.callContextualUnaryFunction(mv, mapping, type);
  }

  private boolean isRecursive()
  {
    return expression.recursive && functionName.equals(expression.functionName);
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  public Class<?> resultTypeFor(String functionName)
  {
    if (arg == null)
    {
      return Void.class;
    }
    if (arg.type().equals(Integer.class) && integerFunctionsWithRealResults.contains(functionName))
    {
      return Real.class;
    }
    else
    {
      return expression.rangeType;
    }
  }

  @Override
  public String toString()
  {
    return contextual ? String.format("FunctionCall[name=%s,  function=%s, arg=%s, targetResultType=%s]",
                                      functionName,
                                      mapping,
                                      arg == null ? "null" : arg.typeset(),
                                      targetResultType != null ? targetResultType.getName() : null) : String.format("FunctionCall[name=%s, arg=%s, targetResultType=%s]",
                                                                                                                    functionName,
                                                                                                                    arg == null ? "null" : arg.typeset(),
                                                                                                                    targetResultType != null ? targetResultType.getName() : null);
  }

  @Override
  public Class<?> type()
  {
    if (isBuiltin())
    {
      return resultTypeFor(functionName);
    }
    assert mapping.range != null : "range of " + mapping + " is null";
    return mapping.range;
  }

  @Override
  public String typeset()
  {
    return format("%s(%s)",
                  functionName.replace("√", "\\sqrt").replace("J0", "J_0"),
                  arg == null ? "" : arg.typeset());
  }

}