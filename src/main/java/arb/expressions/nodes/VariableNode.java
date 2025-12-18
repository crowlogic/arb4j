package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Integer;
import arb.Real;
import arb.exceptions.CompilerException;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.*;
import arb.expressions.nodes.nary.ProductNode;
import arb.functions.Function;

/**
 * This class represents a {@link VariableNode} node within an {@link Expression} by
 * extending the {@link Node} class to provide additional functionality for managing
 * {@link VariableReference}s, those registered in the {@link Context}, and/or those which
 * are inputs to the {@link Expression}, or any upstream expression (in the case of
 * nested-expressions such as for {@link ProductNode}s).
 *
 * <h3>Variable Types</h3>
 * <p>
 * A variable can be one of three types:
 * <ul>
 * <li><strong>Independent variable:</strong> The input variable to the containing
 * expression or any containing-expression's input. This variable will receive concrete
 * values during function evaluation.</li>
 * <li><strong>Indeterminate variable:</strong> A symbolic placeholder used in algebraic
 * computations, including polynomial expressions, rational functions, and functionals
 * (functions whose codomain is itself a function). These variables remain symbolic for
 * algebraic manipulation before evaluation.</li>
 * <li><strong>Context variable:</strong> A variable defined in the {@link Context}
 * associated with this {@link #expression}, representing named constants or parameters
 * from the evaluation environment.</li>
 * </ul>
 * </p>
 * 
 * <h3>Terminology Distinction</h3>
 * <p>
 * While "independent" and "indeterminate" may appear synonymous, they serve distinct
 * roles: independent variables are function inputs that receive values at evaluation
 * time, while indeterminate variables remain symbolic for algebraic operations. In
 * functionals like {@code Function<Real, Function<Real, Complex>>}, inner variables are
 * independent from their local function's perspective but indeterminate from the outer
 * functional's perspective.
 * </p>
 * 
 * <h3>{@link Context} Variables</h3>
 * <p>
 * For {@link Context}-defined variables, the reference is stored and subsequently acts as
 * a mutable {@link VariableReference} but remains a constant if not modified. If one
 * really wants the constant to be immutable then calling {@link Real#lock()} will mark
 * the underlying memory area in the hardware as read-only, but for that to work the Real
 * (scalar or vector) should have been constructed with the alignment option specified as
 * true so that its address is aligned on a page boundary, where it must be for locking to
 * occur. (At least on x86-64 machines)
 * </p>
 *
 * <p>
 * This class is also responsible for generating bytecode for this variable node through
 * its {@link #generate(MethodVisitor, Class)} method.
 * </p>
 *
 * @param <D> Type of domain field
 * @param <R> Type of codomain field
 * @param <F> Type of function that maps domain to codomain, must implement
 *            {@link Function}.
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class VariableNode<D, R, F extends Function<? extends D, ? extends R>>
                         extends
                         Node<D, R, F>
{
  Logger log = LoggerFactory.getLogger(getClass());

  @Override
  public boolean isPossiblyNegative()
  {
    return true;
  }

  public boolean                    ascendentInput;

  public boolean                    isIndependent   = false;

  public boolean                    isIndeterminate = false;

  public VariableReference<D, R, F> reference;

  public VariableNode(Expression<D, R, F> expression, VariableReference<D, R, F> reference, int startPos, boolean resolve)
  {
    super(expression);
    var variables = expression.context != null ? expression.context.variables : null;
    this.expression         = expression;
    this.reference          = reference;
    this.reference.position = startPos;
    assert reference != null;
    assert !(expression.recursive && reference.name.equals(expression.functionName)) : "variable name clashes with " + "the function name since it's a recursve function";

    var existingVariable = expression.getReference(reference.name);
    if (existingVariable != null)
    {
      this.reference.type = existingVariable.reference.type;
      isIndependent       = existingVariable.isIndependent;
      isIndeterminate     = existingVariable.isIndeterminate;
    }
    else
    {
      if ((variables == null || !variables.containsKey(reference.name) || reference.type == null) && resolve)
      {
        resolveReference();
      }

      if (expression.independentVariable != null && reference.equals(expression.independentVariable.reference))
      {
        isIndependent = true;
      }

      if (!isIndependent)
      {
        if (isIndeterminate)
        {
          reference.type = expression.coDomainType;
        }
        else
        {
          if (!reference.isElse() && !isIndeterminate)
          {
            expression.referencedVariables.put(reference.name,
                                               this);
          }
        }
      }
      else
      {
        reference.type = expression.domainType;
      }
    }
    fieldName = reference.name;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }

  public ClassVisitor declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC,
                            reference.name,
                            type().descriptorString(),
                            null,
                            null);
    return classVisitor;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return equals(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return expression.newLiteralConstant(equals(variable) ? 1 : 0);
  }

  @Override
  public int dim()
  {
    return 1;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(reference);
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
    var other = (VariableNode<?, ?, ?>) obj;
    return Objects.equals(reference,
                          other.reference);
  }

  boolean refuseToGenerateIndeterminateVariables = false;

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      log.debug(String.format("#%s: generate( this=%s, resultType=%s)\n",
                              System.identityHashCode(this),
                              this,
                              resultType));
    }

    if (refuseToGenerateIndeterminateVariables && isIndeterminate && isScalar())
    {
      throw new CompilerException(this + " is an indeterminate variable, not independent, it should not be generated since its a placeholder, expression=" + expression);
    }
    generateReference(mv,
                      resultType);

    generateIndexAccess(mv);

    if (generatedType == null)
    {
      generatedType = type();
    }

    if (isResult)
    {
      expression.generateSetResultInvocation(mv,
                                             generatedType);
    }

    return mv;
  }

  private void generateIndexAccess(MethodVisitor mv)
  {
    Class<? extends R> indexType = null;
    if (reference.index != null)
    {
      indexType = reference.index.type();

      reference.index.generate(mv,
                               indexType);
    }

    if (Integer.class.equals(indexType))
    {
      Compiler.invokeVirtualMethod(mv,
                                   reference.type(),
                                   "get",
                                   reference.type(),
                                   indexType);
    }
    else
    {
      if (indexType != null)
      {
        throw new CompilerException("Unhandled indexType " + indexType);
      }
    }
  }

  private void generateReference(MethodVisitor mv, Class<?> neededType)
  {
    if (isIndependent)
    {
      Compiler.cast(loadInputParameter(mv),
                    expression.domainType);
    }
    else if (isIndeterminate)
    {

      generateReferenceToIndeterminantVariable(mv);

    }
    else
    {
      generateReferenceToContextualVariable(mv);
    }
  }

  public void generateReferenceToContextualVariable(MethodVisitor mv)
  {
    if (reference.type() == null)
    {
      resolveReference();
    }
    Class<?> referenceType = reference.type();
    expression.loadThisFieldOntoStack(mv,
                                      reference.name,
                                      referenceType);

  }

  public void generateReferenceToIndeterminantVariable(MethodVisitor mv)
  {
    assert isIndeterminate : this + " is not an indeterminant variable";
    if (reference.type == null)
    {
      resolveReference();
    }
    if (isResult)
    {
      cast(loadResultParameter(mv),
           reference.type);
    }
    else
    {
      if (reference.type.equals(Object.class))
      {
        Compiler.loadInputParameter(mv);
      }
      else
      {
        expression.allocateIntermediateVariable(mv,
                                                reference.type);
      }
    }
    Compiler.invokeVirtualMethod(mv,
                                 reference.type,
                                 "identity",
                                 reference.type);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of();
  }

  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public String getName()
  {
    return reference.name;
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    if (variable.reference.equals(reference))
    {
      return variable.pow(2).div(2);
    }
    else
    {
      return mul(variable);
    }
  }

  public boolean isIndependent(VariableNode<D, R, F> inputVariable)
  {
    if (expression.isNullaryFunction())
    {
      return false;
    }
    return equals(inputVariable) || (inputVariable == null && !expression.references(reference) && !expression.hasIndeterminateVariable());
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  public boolean isNamed(String variable)
  {
    return getName().equals(variable);
  }

  @Override
  public boolean isScalar()
  {
    Class<?> t = type();
    return Compiler.isScalar(t);
  }

  @Override
  public boolean isVariable()
  {
    return true;
  }

  /**
   * Conditionally rename this {@link VariableNode}
   * 
   * @param from
   * @param to
   * @return true if it was renamed
   */
  public boolean renameIfNamed(String from, String to)
  {
    if (isVariableNamed(from))
    {
      renameTo(to);
      return true;
    }
    else
    {
      return false;
    }

  }

  public VariableNode<D, R, F> renameTo(String to)
  {
    reference.name = to;
    return this;
  }

  public VariableNode<?, ?, ?> resolve(VariableReference<D, R, F> reference, Expression<?, ?, ?> ascendentExpression)
  {
    var ascendentInputNode = ascendentExpression.independentVariable;

    if (ascendentInputNode != null && ascendentInputNode.reference.equals(reference))
    {
      if (Expression.trace)
      {
        log.debug(String.format("Assigning this %s as ascendent input node=%s",
                                this,
                                ascendentInputNode));
      }
      ascendentInput = true;
      reference.type = ascendentExpression.domainType;
    }
    else if (ascendentExpression.ascendentExpression != null)
    {
      return resolve(reference,
                     ascendentExpression.ascendentExpression);
    }

    return ascendentInputNode;
  }

  public boolean resolveContextualVariable()
  {
    if (expression.context != null && expression.context.variables != null)
    {
      Object instanceVariable = expression.context.variables.get(reference.name);
      if (instanceVariable != null)
      {
        reference.type = instanceVariable.getClass();
        if (Expression.trace)
        {
          log.debug("Declaring {} as a contextual variable of type {}",
                    reference,
                    reference.type());

        }

        return true;
      }
    }

    return false;
  }

  public void resolveIndependentVariable(VariableNode<D, R, F> inputVariable)
  {
    assert (inputVariable == null || inputVariable.equals(expression.independentVariable)) : "inputVariable is already " + inputVariable + " it doesnt make sense to change it to " + this;
    if (!equals(inputVariable))
    {
      if (Expression.trace)
      {

        log.debug(String.format("#%s: resolveIndependentVariable: declaring %s as the input node to '%s' which currently has input variable %s\n",
                                System.identityHashCode(this),
                                reference,
                                expression,
                                expression.independentVariable));
      }

      expression.independentVariable = this;
      reference.type                 = expression.domainType;
    }
  }

  public void resolveInheritedVariableReference(VariableNode<D, R, F> variable)
  {

    var parentExpression = expression.ascendentExpression;
    if (parentExpression != null)
    {
      resolve(reference,
              parentExpression);
    }
    else
    {
      throw new UndefinedReferenceException(format("Undefined reference to variable " + " '%s' at position=%d in expression=%s, independent " + "variable is %s and ascendentExpression is %s,  remaining='%s'",
                                                   reference.name,
                                                   reference.position,
                                                   expression.expression,
                                                   variable,
                                                   expression.ascendentExpression,
                                                   expression.remaining()));
    }
  }

  public VariableNode<D, R, F> resolveReference()
  {
      var inputVariable = expression.independentVariable;

      if (resolveContextualVariable())
      {
        return this;
      }

      if (isIndependent = isIndependent(inputVariable))
      {
        resolveIndependentVariable(inputVariable);
      }
      else
      {
        if (isIndeterminate = (!expression.anyAscendentIndependentVariableIsNamed(getName())
                               && !expression.anyAscendentIndeterminateVariableIsNamed(getName())))
        {
          declareThisToBeTheIndeterminantVariable();
        }
        else
        {
          resolveInheritedVariableReference(inputVariable);
        }
      }
      if (expression.independentVariable != null && !isIndeterminate && !isIndependent && !ascendentInput)
      {
        throwNewUndefinedReferenceException();
      }
      return this;
  }



  protected void throwNewUndefinedReferenceException()
  {
    throw new UndefinedReferenceException(format("Undefined reference '%s' at position=%d in Expression(=%s)=%s, "
                                                 + "independent variable is %s, indeterminant variable is %s, and parentExpression is %s, remaining='%s'",
                                                 reference.name,
                                                 reference.position,
                                                 System.identityHashCode(expression),
                                                 expression.expression,
                                                 expression.independentVariable,
                                                 expression.indeterminateVariable,
                                                 expression.ascendentExpression,
                                                 expression.remaining()));
  }

  protected void declareThisToBeTheIndeterminantVariable()
  {

    if (expression.indeterminateVariable != null)
    {
      if (!expression.indeterminateVariable.equals(this))
      {
        throwNewIndeterminantVariableAlreadyDeclared();
      }
      else
      {
        return;
      }
    }

    if (!VariableNode.this.equals(expression.indeterminateVariable) && Expression.trace)
    {
      log.debug(String.format("Expression(#%s) declaring %s to be the indeterminant in %s",
                              System.identityHashCode(expression),
                              this,
                              expression));

    }
    expression.referencedVariables.put(reference.name,
                                       this);
    expression.indeterminateVariable = this;
  }

  protected void throwNewIndeterminantVariableAlreadyDeclared()
  {
    throw new CompilerException(String.format("undefined variable reference '%s' at position=%s in expression '%s' " + "since the inderminate variable has already been declared to be '%s'",
                                              reference,
                                              expression.position,
                                              expression,
                                              expression.indeterminateVariable));
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new VariableNode<E, S, G>(newExpression,
                                     reference.spliceInto(newExpression),
                                     position,
                                     true);
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    return variable.equals(getName()) ? arg.spliceInto(expression) : this;
  }

  @Override
  public char symbol()
  {
    return getName().charAt(0);
  }

  @Override
  public String toString()
  {
    return reference.toString();
  }

  @Override
  public Class<?> type()
  {
    Class<?> returnType = null;
    if (isIndependent)
    {
      returnType = expression.domainType;
    }
    else if (isIndeterminate)
    {
      returnType = expression.coDomainType;
    }
    else if (ascendentInput)
    {
      returnType = expression.ascendentExpression.domainType;
    }
    else
    {
      returnType = reference.type();
    }
    assert returnType != null : "returnType is null for " + this;
    return returnType;
  }

  @Override
  public String typeset()
  {
    return reference.typeset();
  }

}
