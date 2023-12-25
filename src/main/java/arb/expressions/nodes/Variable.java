package arb.expressions.nodes;

import static arb.expressions.Compiler.loadInput;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.Real;
import arb.Tuple;
import arb.expressions.*;
import arb.functions.Function;

/**
 * Represents a variable node within an {@link Expression}. This class extends
 * the {@link Node} class to provide additional behavior for tracking variables
 * in a {@link Context} and for handling independent variables within the
 * expression.
 *
 * <p>
 * A variable can either be the independent variable otherwise its value is
 * assumed to be defined in the {@link Context} associated with this
 * this{@link #expression} where its value is substituted and subsequently acts
 * as a mutable variable reference but remains a constant if not modified. If
 * one really wants the constant to be immutable then calling
 * {@link Real#lock()} will do the trick, but for that to work the Real (scalar
 * or vector) should have been constructed with the alignment option specified
 * as true so that its address is aligned on a page boundary, where it must be
 * for locking to occur. ( At least on x86-64 machines)
 * </p>
 *
 * <p>
 * This class is also responsible for generating bytecode for this variable node
 * through its {@link #generate(MethodVisitor)} method.
 * </p>
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * 
 * @param <D> Type of domain field
 * @param <R> Type of range field
 * @param <F> Type of function that maps domain to range, must implement
 *            {@link Function}.
 *
 * @see Node
 * @see Expression
 * @see Variables
 * 
 *
 * @author ©2023 Stephen Crowley
 */
public class Variable<D, R, F extends Function<? extends D, ? extends R>> extends
                     Node<D, R, F>
{
  public final Reference     reference;

  public final Variables     variables;

  public Expression<D, R, F> expression;
  public boolean             isIndependent = false;

  public Variable(Expression<D, R, F> expression, Reference reference, int depth)
  {
    super(expression,
          depth + 1);
    this.expression = expression;
    this.reference  = reference;
    this.variables  = expression.variables;
    boolean isMultivariate = reference.isMultivariate();

    assert isMultivariate == false : "TODO: handle tuples: " + reference.name;
    if (variables == null || !variables.map.containsKey(reference.name))
    {
      resolveReference(expression, reference);
    }

    if (!isIndependent)
    {
      if (verbose)
      {
        out.format("%s: referenced %s\n", expression, reference);
        out.flush();
      }
      expression.referencedVariables.put(reference.name, this);
    }
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    var other = (Variable<?, ?, ?>) obj;
    return Objects.equals(expression, other.expression) && isIndependent == other.isIndependent
                  && Objects.equals(reference, other.reference) && Objects.equals(variables, other.variables);
  }

  /**
   * TODO: modify this checking of this{@link #isIndependent} to see if its part
   * of a {@link Tuple} and if so generate the reference to the corresponding
   * element of the input tuple rather than generating a reference to the tuple
   * itself
   * 
   */
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
      generateIndexAccess(mv);
    }

    if (isResult)
    {
      expression.setResult(mv);
    }

    return mv;
  }

  public void generateIndexAccess(MethodVisitor mv)
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

  @Override
  public int hashCode()
  {
    return Objects.hash(expression, isIndependent, reference, variables);
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

  public void resolveReference(Expression<D, R, F> expression, Reference reference)
  {
    var independentVariable = expression.independentVariableNode;
    isIndependent = (independentVariable == null || independentVariable.equals(this));
    if (isIndependent)
    {
      expression.independentVariableNode = this;
      if (verbose)
      {
        out.format("%s: Independent Variable declared to be: %s", expression, this);
        out.flush();
      }
    }
    else
    {
      throw new UndefinedReferenceException(format("Undefined reference to variable '%s' in %s, independent variable is %s",
                                                   reference,
                                                   expression,
                                                   independentVariable));
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
  public String typeset()
  {
    return reference.typeset();
  }

}
