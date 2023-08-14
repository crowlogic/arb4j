package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.expressions.Expression;
import arb.expressions.Variables;

public class Variable extends
                      Node
{
  private final String    name;
  private final Variables namespace;
  private Expression      expression;
  boolean                 isInput = false;

  public Variable(Expression expression,
                  String variableName)
  {
    super(expression);
    this.expression = expression;
    this.name       = variableName;
    this.namespace  = expression.variables;
    if (namespace == null || namespace.get(variableName) == null)
    {
      if (expression.inputNode == null)
      {
        expression.inputNode = this;
        isInput          = true;
      }
      else
      {
        throw new RuntimeException("Undefined reference to variable '" + variableName + "' in " + expression,
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
                         isInput ? "INPUT" : name);
  }

  @Override
  public void generate(MethodVisitor mv)
  {
    if (verbose)
    {
      out.println(this);
    }

    if (isInput)
    {
      expression.checkClassCast(loadInput(mv), false);
    }
    else
    {
      expression.loadField(loadThis(mv), name, true);
    }

    if (isLast)
    {      
      expression.checkClassCast(loadResult(mv), false);
      mv.visitInsn(Opcodes.SWAP);
      mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                         expression.domainClassInternalName,
                         "set",
                         String.format("(%s)%s", expression.domainClassDescriptor, expression.domainClassDescriptor),
                         false);
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
