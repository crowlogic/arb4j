package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.Real;
import arb.exceptions.CompilerException;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.*;
import arb.expressions.nodes.nary.ProductNode;
import arb.functions.Function;

/**
 * This class represents a {@link VariableNode} node within an
 * {@link Expression} by extending the {@link Node} class to provide additional
 * functionality for managing {@link VariableReference}s, those registered in
 * the {@link Context}, and/or those which are inputs to the {@link Expression},
 * or any upstream expression (in the case of nested-expressions such as for
 * {@link ProductNode}s).
 *
 * <h3>Variable Types</h3>
 * <p>
 * A variable can be one of two types:
 * <ul>
 * <li><strong>Independent variable:</strong> The input variable to the
 * containing expression or any containing-expression's input. For nullary
 * functions producing polynomials/functionals, the independent variable
 * represents the formal variable and generates identity() codegen rather
 * than loading a runtime input parameter.</li>
 * <li><strong>Context variable:</strong> A variable defined in the
 * {@link Context} associated with this {@link #expression}, representing named
 * constants or parameters from the evaluation environment.</li>
 * </ul>
 * </p>
 * 
 * <h3>{@link Context} Variables</h3>
 * <p>
 * For {@link Context}-defined variables, the reference is stored and
 * subsequently acts as a mutable {@link VariableReference} but remains a
 * constant if not modified. If one really wants the constant to be immutable
 * then calling {@link Real#lock()} will mark the underlying memory area in the
 * hardware as read-only, but for that to work the Real (scalar or vector)
 * should have been constructed with the alignment option specified as true so
 * that its address is aligned on a page boundary, where it must be for locking
 * to occur. (At least on x86-64 machines)
 * </p>
 *
 * <p>
 * This class is also responsible for generating bytecode for this variable node
 * through its {@link #generate(MethodVisitor, Class)} method.
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
public class VariableNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         Node<D, R, F>
{

  /**
   * Đ^(α)(t) = Γ(2)/Γ(2-α)*t^(1-α)
   * 
   * This is the monomial case with k=1.
   */
  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    VariableNode<D, R, F> indepVar = expression.getIndependentVariable();
    if (this.equals(indepVar))
    {
      Node<D, R, F> p         = one();
      Node<D, R, F> numerator = p.add(one()).Γ();
      Node<D, R, F> denomArg  = p.sub(α).add(one());
      Node<D, R, F> term      = this.pow(p.sub(α));
      return numerator.div(denomArg.Γ()).mul(term);
    }
    return zero();
  }

  public boolean isZero()
  {
    return false;
  }

  public boolean                    upstreamInput;

  public boolean                    isIndependent   = false;

  public boolean                    isFormalVariable = false;

  public VariableReference<D, R, F> reference;

  public String resolutionStateString()
  {
    return String.format("variable='%s', type=%s, isIndependent=%s, isFormalVariable=%s, upstreamInput=%s, expression=%s, independentVariable=%s, context=%s",
                         reference.name,
                         reference.type,
                         isIndependent,
                         isFormalVariable,
                         upstreamInput,
                         expression,
                         expression.independentVariable,
                         expression.context);
  }

  private VariableNode<?, ?, ?> resolveUpstreamVariables()
  {
    final VariableNode<?, ?, ?>[] found = new VariableNode[1];

    if (expression != null)
    {
      expression.acceptUntil(e ->
      {
        var iv = e.independentVariable;
        if (iv != null && reference.equals(iv.reference))
        {
          if (e != expression)
          {
            upstreamInput = true;
          }
          reference.type = e.domainType;
          found[0]       = iv;
          return true;
        }

        return false;
      });
    }

    return found[0];
  }

  public VariableNode<?, ?, ?> resolveReference()
  {
//    if (reference.type != null)
//    {
//      return this;
//      throw new CompilerException(String.format("variable already resolved and cannot be resolved again: %s",
//                                                resolutionStateString()));
//    }

    var inputVariable = expression.independentVariable;

    if (Expression.traceNodes)
    {
      logger.debug("resolveReference START: {}", resolutionStateString());
    }

    if (resolveContextualVariable())
    {
      expression.registerReferencedVariable(this);
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference CONTEXT: {}", resolutionStateString());
      }
      return this;
    }

    if (isIndependent = isIndependent(inputVariable))
    {
      resolveIndependentVariable(inputVariable);
      reference.type = expression.domainType;
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference INDEPENDENT: {}", resolutionStateString());
      }
      return this;
    }

    var upstream = resolveUpstreamVariables();
    if (upstream != null)
    {
      if (upstreamInput)
      {
        expression.registerReferencedVariable(this);
      }

      if (Expression.traceNodes)
      {
        logger.debug("resolveReference UPSTREAM: {}", resolutionStateString());
      }
      return this;
    }

    if (expression.thisOrAnyUpstreamExpressionHasFunctionalCodomain()
        && !expression.anyUpstreamIndependentVariableIsNamed(getName()))
    {
      isFormalVariable = true;
      reference.type   = expression.coDomainType;
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference FORMAL VARIABLE: {}", resolutionStateString());
      }
      return this;
    }

    throw new CompilerException(String.format("undefined variable reference: %s", resolutionStateString()));
  }

  protected void throwNewUndefinedReferenceException()
  {
    throw new UndefinedReferenceException(String.format("undefined reference: %s", resolutionStateString()));
  }

  public VariableNode(Expression<D, R, F> expression, VariableReference<D, R, F> reference, boolean resolve)
  {
    super(expression);
    var variables = expression.context != null ? expression.context.variables : null;
    this.expression         = expression;
    this.reference          = reference;
    this.reference.position = position;
    assert reference != null;
    assert !(expression.recursive && reference.name.equals(expression.functionName)) : "variable name clashes with "
                                                                                       + "the function name since it's a recursve function";

    var existingVariable = expression.getReference(reference.name);
    if (existingVariable != null)
    {
      this.reference.type = existingVariable.reference.type;
      isIndependent       = existingVariable.isIndependent;
      isFormalVariable    = existingVariable.isFormalVariable;
    }
    else
    {
      boolean resolved = false;
      if ((variables == null || !variables.containsKey(reference.name) || reference.type == null) && resolve)
      {
        resolveReference();
        resolved = true;
      }

      if (expression.independentVariable != null && reference.equals(expression.independentVariable.reference))
      {
        isIndependent = true;
      }

      if (!resolved)
      {
        if (isIndependent)
        {
          reference.type = expression.domainType;
        }
        else
        {
          if (!reference.isElse() && resolve)
          {
            expression.registerReferencedVariable(this);
          }
        }
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
    classVisitor.visitField(ACC_PUBLIC, reference.name, type().descriptorString(), null, null);
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
    return equals(variable) ? one() : zero();
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
    return Objects.equals(reference, other.reference);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("#%s: generate( this=%s, resultType=%s)\n", System.identityHashCode(this), this, resultType));
    }

    generateReference(mv, resultType);

    generateIndexAccess(mv);

    if (generatedType == null)
    {
      generatedType = type();
    }

    if (isRootNode)
    {
      expression.generateSetResultInvocation(mv, generatedType);
    }

    return mv;
  }

  private void generateIndexAccess(MethodVisitor mv)
  {
    Class<? extends R> indexType = null;
    if (reference.index != null)
    {
      indexType = reference.index.type();

      reference.index.generate(mv, indexType);
    }

    if (Integer.class.equals(indexType))
    {
      Compiler.generateVirtualMethodInvocation(mv, reference.type(), "get", reference.type(), indexType);
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
      if (expression.isNullaryFunction())
      {
        generateNullaryIndependentVariable(mv);
      }
      else
      {
        Compiler.cast(loadInputParameter(mv), type());
      }
    }
    else if (isFormalVariable)
    {
      generateNullaryIndependentVariable(mv);
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
    expression.loadThisAndFieldOntoStack(mv, reference.name, referenceType);

  }

  /**
   * Generates code for the independent variable of a nullary function.
   * Instead of loading a runtime input parameter (which is null for nullary
   * functions), this generates an identity() call to create the formal
   * variable (e.g., the identity polynomial for polynomial expressions).
   */
  public void generateNullaryIndependentVariable(MethodVisitor mv)
  {
    if (reference.type == null)
    {
      resolveReference();
    }
    if (isRootNode)
    {
      cast(loadResultParameter(mv), reference.type);
    }
    else
    {
      if (reference.type.equals(Object.class))
      {
        Compiler.loadInputParameter(mv);
      }
      else
      {
        expression.allocateIntermediateVariable(mv, reference.type);
      }
    }
    Compiler.generateVirtualMethodInvocation(mv, reference.type, "identity", reference.type);
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
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
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
    return equals(inputVariable) || (inputVariable == null && !expression.references(reference));
  }

  @Override
  public boolean isAtomic()
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

  public boolean resolveContextualVariable()
  {
    if (expression.context != null && expression.context.variables != null)
    {
      Object instanceVariable = expression.context.variables.get(reference.name);
      if (instanceVariable != null)
      {
        reference.type = instanceVariable.getClass();
        if (Expression.traceNodes)
        {
          logger.debug("Declaring {} as a contextual variable of type {}", reference, reference.type());

        }

        return true;
      }
    }

    return false;
  }

  public void resolveIndependentVariable(VariableNode<D, R, F> inputVariable)
  {
    assert (inputVariable == null || inputVariable.equals(expression.independentVariable)) : "inputVariable is already "
                                                                                             + inputVariable
                                                                                             + " it doesnt make sense to change it to "
                                                                                             + this;
    if (!equals(inputVariable))
    {
      if (Expression.traceNodes)
      {

        logger.debug(String.format("#%s: resolveIndependentVariable: declaring %s as the input node to '%s' which currently has input variable %s\n",
                                   System.identityHashCode(this),
                                   reference,
                                   expression,
                                   expression.independentVariable));
      }
      isIndependent                  = true;
      expression.independentVariable = this;
      reference.type                 = expression.domainType;
    }
  }

  public <E, S, G extends Function<? extends E, ? extends S>> VariableNode<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new VariableNode<E, S, G>(newExpression,
                                     reference.spliceInto(newExpression),
                                     !newExpression.deferVariableResolution);
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    Node<D, R, F> retVal = variable.equals(getName()) ? arg.spliceInto(expression) : this;
    assert retVal != null : "refusing to return null for " + this;
    return retVal;
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

  public String toStringVerbose()
  {
    return "VariableNode[upstreamInput="
           + upstreamInput
           + ", isIndependent="
           + isIndependent
           + ", isFormalVariable="
           + isFormalVariable
           + ", reference="
           + reference
           + "]";
  }

  @Override
  public Class<?> type()
  {
    Class<?> returnType = null;
    if (isIndependent)
    {
      returnType = expression.isNullaryFunction() ? expression.coDomainType : expression.domainType;
    }
    else if (isFormalVariable)
    {
      returnType = expression.coDomainType;
    }
    else
    {
      returnType = reference.type();
    }
    if (returnType == null || returnType.equals(Object.class))
    {
      returnType = expression.coDomainType;
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
