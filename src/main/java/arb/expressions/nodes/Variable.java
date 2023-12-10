package arb.expressions.nodes;

import static arb.expressions.Compiler.loadInput;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.*;
import arb.functions.Function;

/**
 * Represents a variable node within an {@link Expression}. This class extends
 * the {@link Node} class to provide additional behavior for tracking variables
 * in a namespace and for handling independent variables within the expression.
 *
 * <p>
 * A variable can either be the independent variable otherwise its value is assumed
 * to be defined in the {@link Context} associated with this this{@link #expression} 
 * where its value is substituted and subsequently acts as a mutable (constant) ironically.
 * If you really want it to be a constant, call the lock
 * owns this {@code Variable} node.
 * </p>
 *
 * <p>
 * This class is also responsible for generating bytecode for this variable node
 * through its {@link #generate(MethodVisitor)} method.
 * </p>
 *
 * @param <D> Type of domain field, must extend {@link arb.Field}.
 * @param <R> Type of range field, must extend {@link arb.Field}.
 * @param <F> Type of function that maps domain to range, must implement
 *            {@link Function}.
 *
 * @see Node
 * @see Expression
 * @see Variables
 * 
 *      <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *      </pre>
 */
public class Variable<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                     Node<D, R, F>
{
  public final Reference     reference;
  public final Variables<R>  namespace;
  public Expression<D, R, F> expression;
  public boolean             isIndependent = false;

  public Variable(Expression<D, R, F> expression, Reference variableReference, int depth)
  {
    super(expression,
          depth + 1);
    this.expression = expression;
    this.reference  = variableReference;
    this.namespace  = expression.variables;
    if (namespace == null || namespace.get(variableReference.name) == null)
    {
      if ((expression.independentVariableNode == null
                    || expression.independentVariableNode.reference.equals(variableReference))
                    && !LiteralConstant.isConstant(variableReference.name))
      {
        expression.independentVariableNode = this;
        isIndependent                      = true;
        if (verbose)
        {
          out.println("Independent Variable declared to be: " + this);
          out.flush();
        }
      }
      else
      {
        throw new RuntimeException(format("Undefined reference to variable '%s' in %s, independent variable is %s",
                                          variableReference,
                                          expression,
                                          expression.independentVariableNode),
                                   new NoSuchFieldException(variableReference.toString()));
      }
    }
    if (!isIndependent)
    {
      expression.referencedVariables.put(variableReference.name, this);
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
                         isIndependent ? format("INPUT(%s)", reference) : reference);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv)
  {

    if (verbose)
    {
      out.println(this);
      out.flush();
    }

    if (isIndependent)
    {
      expression.checkClassCast(loadInput(mv), false);
    }
    else
    {
      expression.loadFieldOntoStack(loadThisOntoStack(mv), reference.name, true);
    }

    if (reference.index != null)
    {
      if (Parser.isDigit(reference.index.charAt(0)))
      {
        mv.visitLdcInsn(Integer.parseInt(reference.index) - 1);
      }
      else
      {
        expression.loadIndexField(loadThisOntoStack(mv), reference.index);
      }

      mv.visitMethodInsn(INVOKEVIRTUAL,
                         expression.domainClassInternalName,
                         "get",
                         "(I)" + expression.domainClassDescriptor,
                         false);
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
    assert false : "a variable is never reusable(overwritable)";
    return null;
  }

  @Override
  public String typeset()
  {
    return reference.typeset();
  }

}
