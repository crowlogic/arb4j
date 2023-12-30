package arb.expressions.nodes;

import static arb.expressions.Compiler.loadBits;
import static arb.expressions.Compiler.loadResult;
import static java.lang.String.format;
import static java.lang.System.err;
import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.expressions.*;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class FunctionCall<D, R, F extends Function<D, R>> extends
                         UnaryOperation<D, R, F>
{
  @Override
  public String toString()
  {
    return "FunctionCall[name=" + name + ", arg=" + node + ", isResult=" + isResult + "]";
  }

  public interface CodeGenerator
  {
    MethodVisitor generate(MethodVisitor mv, Node<?, ?, ?> operand, int depth);
  }

  private final String name;

  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument, int depth)
  {
    super(argument,
          expression,
          depth);
    assert argument != null;
    this.name  = Parser.replaceSubscriptsAndArrows(functionName).replace("ln", "log").replace("√", "sqrt");
    this.depth = depth;
  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor)
  {

    Context context = expression.context;
    if (context != null && context.functions.map.containsKey(name))
    {
      return generateContextualFunctionCall(methodVisitor);
    }
    else
    {
      return generateBuiltinFunctionCall(methodVisitor);
    }
  }

  @Override
  public String typeset()
  {
    return format("%s(%s)", name.replace("√", "\\sqrt").replace("J0", "J_0"), node.typeset());
  }

  @Override
  public Class<?> type()
  {
    return expression.rangeClass;
  }

  /**
   * Generate an invocation of member function of an {@link Object} by its name
   * and the {@link Node} whose evaluated result is the independent variable, also
   * known as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param lastCall
   * @return methodVisitor (for fluent-style function composition)
   */
  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor)
  {
    var     expression = node.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      out.format("callFunction(functionName=%s, arg=%s, depth=%d)\n", name, node, depth);
      out.flush();
    }

    node.generate(methodVisitor);
    loadBits(methodVisitor);

    if (isResult)
    {
      expression.checkClassCast(loadResult(methodVisitor), node.type());
    }
    else
    {
      if (node.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + node.toString(-1));
          err.flush();
        }

        node.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, depth, node.type());
      }
    }

    expression.checkClassCast(methodVisitor, node.type());
    return generateCallToBuiltinUnaryFunction(methodVisitor, name, node.type(), type());
  }

  /**
   * Generate an invocation of function registered via
   * {@link Context#registerFunction(String, Function)} by its name and the
   * {@link Node} whose evaluated result is the independent variable, also known
   * as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param name
   * @param node
   * @param lastCall
   * @param depth
   * @return methodVisitor
   */
  public MethodVisitor generateContextualFunctionCall(MethodVisitor methodVisitor)
  {
    var     expression = node.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      err.format("callRegisteredFunction(functionName=%s, arg=%s, depth=%d)\n", name, node, depth);
      err.flush();

    }

    F func = expression.context.functions.get(name);

    if (func == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s(.)", name));
    }
    expression.loadVariableReferenceOntoStack(Compiler.loadThisOntoStack(methodVisitor),
                                              name,
                                              func.getClass().descriptorString());

    node.generate(methodVisitor);
    Compiler.loadOrder(methodVisitor);
    Compiler.loadBits(methodVisitor);

    if (node.isResult)
    {
      Compiler.loadResult(methodVisitor);
    }
    else
    {
      if (node.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + node.toString(-1));
          err.flush();
        }

        node.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, depth, type());
      }
    }

    expression.callRegisteredUnaryFunction(methodVisitor, func, type());

    if (verbose)
    {
      err.println("Returning from callRegisteredFunction");
      err.flush();
    }

    return methodVisitor;
  }

  /**
   * Emit an instruction to invoke a {@link UnaryOperation} , that is, a function
   * of one variable in the input domain mapping to one variable in the output
   * range. The operators implementing method has the signature D functionName(
   * int bits, D result).
   * 
   * @param methodVisitor
   * @param functionName
   * @param domainType
   * @param rangeType
   * @return methodVisitor
   */
  public static MethodVisitor generateCallToBuiltinUnaryFunction(MethodVisitor methodVisitor,
                                                                 String functionName,
                                                                 Class<?> domainType,
                                                                 Class<?> rangeType)
  {
    if (verbose)
    {
      out.format("generateCallToBuiltinUnaryFunction(functionName=%s, domainType=%s, rangeType=%s\n",
                 functionName,
                 domainType,
                 rangeType);
      out.flush();
    }
    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s", domainType.descriptorString(), rangeType.descriptorString()),
                                  false);
    return methodVisitor;
  }

}