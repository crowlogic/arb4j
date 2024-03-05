package arb.expressions.nodes;

import static arb.expressions.Compiler.loadInputParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
import arb.expressions.StackTrackingMethodVisitor;
import arb.expressions.VariableReference;
import arb.expressions.Variables;
import arb.expressions.nodes.nary.Product;
import arb.functions.Function;

/**
 * This class represents a {@link Variable} node within an {@link Expression} by
 * extending the {@link Node} class to provide additional functionality for managing
 * {@link VariableReference}s those registered in the {@link Context} and or those which are inputs
 * to the expression, or any upstream expression (in the case of nested-expressions such as for
 * {@link Product}s 
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
    return isIndeterminant ? expression.rangeType : reference.type();
  }

  public final VariableReference<D, R, F> reference;

  public final Variables                  variables;

  public Expression<D, R, F>              expression;

  public boolean                          isIndependent   = false;

  public boolean                          isIndeterminant = false;

  public final boolean                    isMultivariate;

  private Class<?>                        generatedType;

  private boolean                         isIndependentVariableOfParentExpression;

  public Variable(Expression<D, R, F> expression, VariableReference<D, R, F> reference)
  {
    super(expression);
    this.expression = expression;
    this.reference  = reference;
    this.variables  = expression.variables;
    isMultivariate  = reference.isMultivariate();
    assert reference != null;
    assert !(expression.recursive && reference.name.equals(expression.functionName)) : caveat;

    if (variables == null || !variables.map.containsKey(reference.name))
    {
      resolveReference(reference);
    }

    if (expression.independentVariableNode != null && reference.equals(expression.independentVariableNode.reference))
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

  public static String printStack(MethodVisitor mv)
  {
    if (!(mv instanceof StackTrackingMethodVisitor))
    {
      return "";
    }
    else
    {
      Stream<List<Object>> stream = Stream.of(((StackTrackingMethodVisitor) mv).stack);
      return stream.collect(Collectors.toList()).toString();
    }
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
                         Type.getMethodDescriptor(Type.getType(reference.type()), Type.getType(indexType)),
                         false);
      mv.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { Type.getInternalName(reference.type) });

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
      // addTypeToStackMapFrame(mv, expression.domainType);

    }
    else if (isIndeterminant)
    {
      Compiler.checkClassCast(Compiler.loadResultParameter(mv), expression.rangeType);

      mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                         Type.getInternalName(expression.rangeType),
                         "identity",
                         format("()%s", expression.rangeType.descriptorString()),
                         false);

      Compiler.addTypeToStackMapFrame(mv, expression.rangeType);
    }
    else
    {
      // assert !isIndependentVariableOfParentExpression : "handle
      // isIndependentVariableOfParentExpression: " + reference;
      expression.loadFieldOntoStack(loadThisOntoStack(mv), reference.name, reference.type().descriptorString());
      // addTypeToStackMapFrame(mv, reference.type());

    }
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

  /**
   * Set this{@link #isIndeterminant} , this{@link #isIndependent}, or
   * this{@link #isIndependentVariableOfParentExpression}
   * 
   * @param reference
   */
  public void resolveReference(VariableReference<D, R, F> reference)
  {
    var inputVariable = expression.independentVariableNode;

    if (isIndependent = equals(inputVariable))
    {
      if (expression.independentVariableNode == null)
      {
        expression.independentVariableNode = this;
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
        if (expression.parentExpression != null)
        {
          if (expression.parentExpression.independentVariableNode.reference.equals(reference))
          {
            isIndependentVariableOfParentExpression = true;
            return;
          }

        }
        else
        {
          throw new UndefinedReferenceException(format("Undefined reference to variable"
                        + " '%s' in %s, independent variable is %s and parentExpression is %s",
                                                       reference.name,
                                                       expression,
                                                       inputVariable,
                                                       expression.parentExpression));
        }
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

}
