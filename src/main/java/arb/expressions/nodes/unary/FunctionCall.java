package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.*;

import java.util.Arrays;
import java.util.HashSet;

import org.objectweb.asm.*;

import arb.Integer;
import arb.Real;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Mapping;
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
 * {@link Function#express(Class, Class, String, String, Context, boolean)}
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

  public String        functionName;
  public boolean       contextual                      = false;
  public Mapping<D, R> mapping;

  HashSet<String>      integerFunctionsWithRealResults = new HashSet<>(Arrays.asList(new String[]
  { "sqrt", "tanh", "log" }));

  Class<?>             targetResultType;

  @SuppressWarnings("unchecked")
  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument, int depth)
  {
    super(argument,
          expression,
          depth);
    assert argument != null;
    this.functionName = Parser.replaceSubscriptsAndArrows(functionName).replace("ln", "log").replace("√", "sqrt");
    this.depth        = depth;
    if (expression.context != null)
    {
      mapping    = (Mapping<D, R>) expression.context.functions.map.get(functionName);
      contextual = mapping != null;
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, mapping);
      }
    }

    targetResultType = resultTypeFor(functionName);

  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor, Class<?> resultType)
  {

    if (verbose)
    {
      out.format("\n%s: generate(resultType=%s)\n\n", this, resultType);
      out.flush();
    }

    if (functionName.equals(expression.functionName))
    {
      contextual           = true;
      mapping              = new Mapping<>();
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
    boolean verbose                   = expression.verbose;
    boolean needsResultTypeConversion = !resultType.equals(type());
    if (verbose)
    {
      out.format("\n%s: generateBuiltinFunctionCall(resultType=%s)\n\n", this, resultType);
      out.flush();
    }
    if (needsResultTypeConversion)
    {
      loadResult(methodVisitor, verbose);
    }
    if (verbose)
    {
      out.format("\nGenerating arg of type %s\n   for\n%s\n\n", arg, this);
      out.flush();
    }

    arg.generate(methodVisitor, expression.domainType);
    loadBits(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, verbose, resultType);

    Class<?> domainType = getDomainType();
    Class<?> rangeType  = targetResultType;
    if (verbose)
    {
      out.format("\ngenerateCallToBuiltinUnaryFunction(functionName=%s, domainType=%s, rangeType=%s\n\n",
                 functionName,
                 domainType,
                 rangeType);
      out.flush();
    }
    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s", rangeType.descriptorString(), rangeType.descriptorString()),
                                  false);
    if (needsResultTypeConversion)
    {
      invokeSetMethod(methodVisitor, targetResultType, resultType, true);

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
    mv.visitVarInsn(ALOAD, 0); // Load "this" onto the stack
    mv.visitFieldInsn(GETFIELD, className, fieldName, fieldType); // Get the field value
    Label label = new Label();
    mv.visitJumpInsn(IFNONNULL, label); // Jump if the field is not null
    mv.visitVarInsn(ALOAD, 0); // Load "this" onto the stack

    mv.visitTypeInsn(Opcodes.NEW, className);
    mv.visitInsn(Opcodes.DUP);
    mv.visitVarInsn(Opcodes.ALOAD, 0);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, className, "<init>", format("(L%s;)V", className), false);

    mv.visitFieldInsn(PUTFIELD, thisClassName, fieldName, fieldType); // Assign the new instance to the field
    mv.visitLabel(label);
    mv.visitFrame(F_SAME, 0, null, 0, null);
    return mv;
  }

  @SuppressWarnings("unchecked")
  public MethodVisitor generateContextualFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    var           expression  = arg.expression;
    boolean       verbose     = expression.verbose;
    Class<?>      type        = type();
    Mapping<D, R> mapping     = expression.context.functions.get(functionName);
    F             func        = (F) mapping.func;
    boolean       isRecursive = expression.recursive && functionName.equals(expression.functionName);
    if (isRecursive)
    {
      conditionallyInstantiate(methodVisitor,
                               functionName,
                               expression.className,
                               functionName,
                               expression.functionClass.descriptorString());

      // functionName + " with copy constructor";
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

    Class<?> argType                = arg.type();
    var      typeBefore             = argType;
    boolean  needsArgTypeConversion = !argType.equals(mapping.domain);
    if (needsArgTypeConversion)
    {
      expression.reserveIntermediateVariable(methodVisitor, depth + 1, mapping.domain);
    }
    arg.generate(methodVisitor, argType);

    Class<?> typeAfter = arg.type();

    assert typeBefore.equals(typeAfter) : String.format("%s: typeBefore=%s typeAfter=%s\n",
                                                        this,
                                                        typeBefore,
                                                        typeAfter);

    if (needsArgTypeConversion)
    {
      invokeSetMethod(methodVisitor, arg.type(), mapping.domain, verbose);
    }

    loadOrder(methodVisitor);
    loadBits(methodVisitor);

    if (verbose)
    {
      err.format("\n%s: generateContextualFunctionCall(resultType=%s)\n", this, resultType);
      err.flush();

    }

    loadOutputVariableOntoStack(methodVisitor, expression, verbose, type);

    expression.callContextualUnaryFunction(methodVisitor, mapping, type);

    return methodVisitor;
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  public Class<?> resultTypeFor(String functionName)
  {
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
                                      arg.typeset(),
                                      targetResultType != null ? targetResultType.getName() : null) : String.format("FunctionCall[name=%s, arg=%s, targetResultType=%s]",
                                                                                                                    functionName,
                                                                                                                    arg.typeset(),
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
    return format("%s(%s)", functionName.replace("√", "\\sqrt").replace("J0", "J_0"), arg.typeset());
  }

}