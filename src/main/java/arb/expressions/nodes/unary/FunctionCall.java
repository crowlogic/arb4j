package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameter;
import static arb.expressions.Compiler.loadOrderParameter;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.F_SAME;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.IFNONNULL;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import java.util.Arrays;
import java.util.HashSet;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
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
 * {@link Function#express(Class, Class, String, String, Context)}
 * methods that accepts another {@link String} argument specifying the name of
 * the function should be used.<br>
 * <br>
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
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
    this.functionName = Parser.replaceArrow(functionName).replace("ln", "log").replace("√", "sqrt");
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
  public MethodVisitor generate(MethodVisitor methodVisitor, Class<?> resultType)
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
      return generateContextualFunctionCall(methodVisitor, resultType);
    }
    else
    {
      return generateBuiltinFunctionCall(methodVisitor, resultType);
    }
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    var     expression                = arg.expression;
    boolean needsResultTypeConversion = !resultType.equals(type());

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
    mv.visitCode();
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
    mv.visitFrame(F_SAME, 0, null, 0, null);
    return mv;
  }

  @SuppressWarnings("unchecked")
  public MethodVisitor generateContextualFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    Class<?>              type        = type();
    FunctionMapping<D, R> mapping     = expression.context.functions.get(functionName);
    F                     func        = (F) mapping.func;
    boolean               isRecursive = expression.recursive && functionName.equals(expression.functionName);
    if (isRecursive)
    {
      conditionallyInstantiate(methodVisitor,
                               functionName,
                               expression.className,
                               functionName,
                               format("L%s;", functionName));
    }
    if (func == null && mapping.functionInterface == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s", mapping));
    }

    expression.loadFieldOntoStack(loadThisOntoStack(methodVisitor),
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
      expression.reserveIntermediateVariable(methodVisitor, mapping.domain);
    }

    if (isVoid)
    {
      methodVisitor.visitInsn(Opcodes.ACONST_NULL);
    }
    else
    {
      arg.generate(methodVisitor, argType);
    }

    Class<?> typeAfter = isVoid ? Void.class : arg.type();

    assert typeBefore.equals(typeAfter)
                  || isVoid : String.format("%s: typeBefore=%s typeAfter=%s\n", this, typeBefore, typeAfter);

    if (needsArgTypeConversion)
    {
      invokeSetMethod(methodVisitor, arg.type(), mapping.domain);
    }

    loadOrderParameter(methodVisitor);
    loadBitsParameter(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, type);

    return expression.callContextualUnaryFunction(methodVisitor, mapping, type);
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