package arb.expressions.nodes;

import static arb.expressions.Compiler.loadInputParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import java.util.Objects;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ExpressionCompilerException;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.VariableReference;
import arb.expressions.Variables;
import arb.expressions.nodes.nary.NaryMultiplication;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * This class represents a {@link Variable} node within an {@link Expression} by
 * extending the {@link Node} class to provide additional functionality for
 * managing {@link VariableReference}s those registered in the {@link Context}
 * and or those which are inputs to the expression, or any upstream expression
 * (in the case of nested-expressions such as for {@link NaryMultiplication}s
 *
 * <p>
 * A variable can either be the independent variable , or the independent(input)
 * variable to the containing expression, or the
 * containtain-containing-expressions input, etc; otherwise the variable should
 * be defined in the {@link Context} associated with this
 * this{@link #expression} where its reference is stored and subsequently acts
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
 * through its {@link #generate(MethodVisitor, Class)} method.
 * </p>
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
 * @author ©2024 Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Variable<D, R, F extends Function<D, R>> extends
                     Node<D, R, F>
{
  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  private static final String caveat = "variable name clashes with "
                + "the function name since its a recursve function";

  @Override
  public Class<?> type()
  {
    if ("z".equals(getName()))
    {
      System.out.format("z indeterminant=%s\n isIndependent=%s\n isAnyAscendingExpressionsInput=%s\n",
                        isIndeterminant,
                        isIndependent,
                        isAnyAscendingExpressionsInput);
    }
    // return reference.type();
    if (isIndependent)
    {
      return expression.domainType;
    }
    if (isAnyAscendingExpressionsInput)
    {
      return expression.ascendentExpression.domainType;
    }
    return isIndeterminant ? expression.rangeType : reference.type();
  }

  public final VariableReference<D, R, F> reference;

  public final Variables                  variables;

  public Expression<D, R, F>              expression;

  public boolean                          isIndependent   = false;

  public boolean                          isIndeterminant = false;

  private Class<?>                        generatedType;

  /**
   * TODO: this needs to be replaced with
   * isIndependentVariableOfAnyAscendentExpression where ascendent means any
   * parent expression, or parent expression of the parent expression, etc, also
   * known as ancestor but that connotates that only ascendents from earlier
   * generations and not the most recent are refered to. here, it is meant that an
   * ascendent expression is one that is an antecedent of this expression.
   * basically, this follows the natural lexical scope that is expected to be part
   * of a system such as this. in other words, these expressions can be nested
   * arbitrarily deep so it is not sufficient to only check the parent expression
   * to see if the variable matches its input during the
   * this{@link #resolveReference(VariableReference)} invocation but that the
   * inputs going back to the root node must be checked and from there the
   * resolution process completes.
   */
  private boolean                         isAnyAscendingExpressionsInput;

  public Variable(Expression<D, R, F> expression, VariableReference<D, R, F> reference)
  {
    super(expression);
    this.expression = expression;
    this.reference  = reference;
    this.variables  = expression.variables;
    assert reference != null;
    assert !(expression.recursive && reference.name.equals(expression.functionName)) : caveat;

    if (variables == null || !variables.map.containsKey(reference.name))
    {
      resolveReference(reference);
    }

    if (expression.inputNode != null && reference.equals(expression.inputNode.reference))
    {
      isIndependent = true;
    }

    if (!isIndependent)
    {
      boolean isElse = "else".equals(reference.name);

      if (!(isElse || isIndeterminant))
      {
        expression.referencedVariables.put(reference.name, this);
      }
    }
    else
    {
      if (expression.traceGenerator)
      {
        System.out.format("Set reference type of %s to %s\n", reference, expression.domainType);
      }
      reference.type = expression.domainType;
    }
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return true;
    if (getClass() != obj.getClass())
      return false;
    var other = (Variable<?, ?, ?>) obj;
    return Objects.equals(reference, other.reference);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    generateReference(mv);

    generateIndexAccess(mv);

    generatedType = type();
    if (isResult)
    {
      expression.setResult(mv, generatedType);
    }

    return mv;
  }

  public String getName()
  {
    return reference.name;
  }

  private void generateIndexAccess(MethodVisitor mv)
  {
    Class<?> indexType = null;
    if (reference.index != null)
    {
      indexType = reference.index.type();

      reference.index.generate(mv, indexType);

    }

    if (Integer.class.equals(indexType))
    {
      mv.visitMethodInsn(INVOKEVIRTUAL,
                         Type.getInternalName(reference.type()),
                         "get",
                         Utensils.getMethodDescriptor(reference.type(), indexType),
                         false);

    }
    else
    {
      if (indexType != null)
      {
        throw new ExpressionCompilerException("Unhandled indexType " + indexType);
      }
    }
  }

  private void generateReference(MethodVisitor mv)
  {
    if (isIndependent)
    {
      Compiler.checkClassCast(loadInputParameter(mv), expression.domainType);
    }
    else if (isIndeterminant)
    {
      Compiler.checkClassCast(Compiler.loadResultParameter(mv), expression.rangeType);
      generateIndeterminateRangeIdentityInvocation(mv);
    }
    else
    {
      expression.loadFieldOntoStack(loadThisOntoStack(mv), reference.name, reference.type().descriptorString());
    }
  }

  private void generateIndeterminateRangeIdentityInvocation(MethodVisitor mv)
  {
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(expression.rangeType),
                       "identity",
                       format("()%s", expression.rangeType.descriptorString()),
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

  public void resolveReference(VariableReference<D, R, F> reference)
  {
    var inputVariable = expression.inputNode;

    if (isIndependent = equals(inputVariable))
    {
      if (expression.inputNode == null)
      {
        expression.inputNode = this;
      }
    }
    else
    {
      if (isIndeterminant = expression.hasPolynomialRange())
      {
        expression.indeterminate = this;
      }
      else
      {
        resolveInheritedVariableReference(reference, inputVariable);
      }
    }
  }

  /**
   * FIXME: variable is being referenced with the wrong type -
   * https://github.com/crowlogic/arb4j/issues/357 this also beckons for a general
   * recursive function called isAscendingInput(node) that would return true
   * rather than just checking 1 level deep as it present does
   */
  protected void resolveInheritedVariableReference(VariableReference<D, R, F> reference, Variable<D, R, F> variable)
  {

    var parentExpression = expression.ascendentExpression;
    if (parentExpression != null)
    {
      var parentExpressionsIndependentVariableNode = resolve(reference, parentExpression);

      if ("z".equals(getName()))
      {
        System.out.format("\nVariable.resolveInheritedVariableReference( name=%s\n%sreference=%s\n"
                      + "%sparentExpressionsIndependentVariableNode=%s\n"
                      + "%sthisExpressionsindependentVariableNode=%s\n" + "%stype=%s\n"
                      + "%sparentExpressionsDomain=%s\n%sparentExpressionsRange=%s\n%sexpressionDomain=%s\n%sexpressionRange=%s)\n\n",
                          getName(),
                          Utensils.indent(44),
                          reference,
                          Utensils.indent(44),
                          parentExpressionsIndependentVariableNode,
                          Utensils.indent(44),
                          expression.inputNode,
                          Utensils.indent(44),
                          type(),
                          Utensils.indent(44),
                          expression.ascendentExpression.domainType,
                          Utensils.indent(44),
                          expression.ascendentExpression.rangeType,
                          Utensils.indent(44),
                          expression.domainType,
                          Utensils.indent(44),
                          expression.rangeType,
                          Utensils.indent(44));
        System.out.flush();
        assert !type().equals(Integer.class) : "why is z an integer? #357 its using this expressions domain type"
                      + " rather than the ascendent "
                      + " expressions domain type apparently which is the crux of the issue";
      }
    }
    else
    {
      throw new UndefinedReferenceException(format("Undefined reference to variable"
                    + " '%s' in %s, independent variable is %s and parentExpression is %s",
                                                   reference.name,
                                                   expression,
                                                   variable,
                                                   expression.ascendentExpression));
    }
  }

  protected Variable<?, ?, ?> resolve(VariableReference<D, R, F> reference, Expression<?, ?, ?> ascendentExpression)
  {
    var ascendentInputNode = ascendentExpression.inputNode;

    if (ascendentInputNode.reference.equals(reference))
    {
      isAnyAscendingExpressionsInput = true;
    }
    else if (ascendentExpression.ascendentExpression != null)
    {
      return resolve(reference, ascendentExpression.ascendentExpression);
    }

    return ascendentInputNode;
  }

  @Override
  public String toString()
  {
    return toString(0);
  }

  public String toString(int depth)
  {

    return typeset();
  }

  @Override
  public String typeset()
  {
    return reference.typeset();
  }

  public ClassVisitor declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC, reference.name, type().descriptorString(), null, null);
    return classVisitor;
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

}
