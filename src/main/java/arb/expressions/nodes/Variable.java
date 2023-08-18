package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.Variables;
import arb.functions.Function;

public class Variable<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                     Node<D, R, F>
{
  private final String        name;
  private final Variables<D>  namespace;
  private Expression<D, R, F> expression;
  boolean                     isIndependent = false;

  public Variable(Expression<D, R, F> expression, String variableName)
  {
    super(expression);
    this.expression = expression;
    this.name       = variableName;
    this.namespace  = expression.variables;
    expression.referencedVariables.put(variableName, this);
    if (namespace == null || namespace.get(variableName) == null)
    {
      if (expression.independentVariableNode == null || expression.independentVariableNode.name.equals(variableName))
      {
        expression.independentVariableNode = this;
        isIndependent                      = true;
        if (verbose)
        {
          out.println("Independent Variable declared to be: " + this);
        }
      }
      else
      {
        throw new RuntimeException(format("Undefined reference to variable '%s' in %s, independent variable is %s",
                                          variableName,
                                          expression,
                                          expression.independentVariableNode),
                                   new NoSuchFieldException(variableName));
      }
    }
  }

  @Override
  public String toString()
  {
    return toString(0);
  }

  public String toString(int depth)
  {
    return String.format("%s%s[name=%s]",
                         depth < 0 ? "" : indent(depth),
                         getClass().getSimpleName(),
                         isIndependent ? "INPUT" : name);
  }

  @Override
  public void generate(MethodVisitor mv)
  {
    if (verbose)
    {
      out.println(this);
    }

    if (isIndependent)
    {
      expression.checkClassCast(loadInput(mv), false);
    }
    else
    {
      expression.loadField(loadThis(mv), name, true);
    }

    if (isLast)
    {
      expression.setResult(mv);
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
    assert false : "a variable is never reusable";
    return null;
  }

}
