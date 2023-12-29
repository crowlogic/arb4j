package arb.expressions.nodes;

import static arb.expressions.Compiler.loadBits;
import static arb.expressions.Compiler.loadResult;
import static java.lang.String.format;
import static java.lang.System.err;
import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;

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

      Compiler.generateRegisteredFunctionCall(methodVisitor, name, node, depth);

      return methodVisitor;
    }
    else
    {
      generateBuiltinFunctionCall(methodVisitor, name, node, depth);

      return methodVisitor;
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
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return methodVisitor (for fluent-style function composition)
   */
  public MethodVisitor
         generateBuiltinFunctionCall(MethodVisitor methodVisitor, String functionName, Node<D, R, F> arg, int depth)
  {
    var     expression = arg.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      out.format("callFunction(functionName=%s, arg=%s, depth=%d)\n", functionName, arg, depth);
      out.flush();
    }

    arg.generate(methodVisitor);
    loadBits(methodVisitor);

    if (isResult)
    {
      expression.checkClassCast(loadResult(methodVisitor), false);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + arg.toString(-1));
          err.flush();
        }

        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, depth, arg.type());
      }
    }

    expression.checkClassCast(methodVisitor, false);
    return expression.callBuiltinUnaryFunction(methodVisitor, functionName);
  }

}