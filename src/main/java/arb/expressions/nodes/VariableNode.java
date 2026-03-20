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
import arb.utensils.Utensils;

/**
 * Represents a variable node within an {@link Expression}.
 *
 * <h3>Resolution Priority</h3>
 * <ol>
 * <li><b>Context variable</b> — name found in {@code expression.context.variables}.
 *     {@code reference.type} = {@code instanceVariable.getClass()}.
 *     Codegen: field access on generated class.</li>
 * <li><b>Independent variable (nullary)</b> — {@link #isIndependent()} and
 *     {@code expression.isNullaryFunction()}.
 *     {@code reference.type} = {@code expression.coDomainType}.
 *     Codegen: {@link #generateFunctionalVariableIdentity}.</li>
 * <li><b>Independent variable (non-nullary)</b> — {@link #isIndependent()} and
 *     not nullary.
 *     {@code reference.type} = {@code expression.domainType}.
 *     Codegen: {@code loadInputParameter}.</li>
 * <li><b>Placeholder variable</b> — {@code expression.isInterfaceFunctional()}
 *     and {@code expression.placeholderVariable == null} (first unresolved free
 *     variable in a non-nullary functional-codomain expression).
 *     {@code reference.type} = {@code expression.coDomainType}.
 *     Codegen: {@link #generateFunctionalVariableIdentity}.
 *     Sets {@code expression.placeholderVariable = this}.</li>
 * <li><b>Upstream variable</b> — matches the independent variable of a
 *     containing (upstream) expression.
 *     {@code reference.type} = upstream expression's {@code domainType}.
 *     {@code upstreamInput} = {@code true}.
 *     Codegen: linked field from containing class.</li>
 * <li><b>Undefined</b> — throws {@link UndefinedReferenceException}.</li>
 * </ol>
 *
 * @param <D> domain type
 * @param <R> codomain type
 * @param <F> function type
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class VariableNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         Node<D, R, F>
{

  @Override
  public boolean hasClosedFormFractionalDerivative(VariableNode<D, R, F> variable)
  {
    return true;
  }

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

  /**
   * True when this node is the placeholder variable of the codomain type
   * (resolution priority 4).  Set during {@link #resolveReference()}.
   */
  public boolean                    isPlaceholder   = false;

  public VariableReference<D, R, F> reference;

  public String resolutionStateString()
  {
    return String.format("variable='%s', type=%s, isIndependent=%s, isPlaceholder=%s, upstreamInput=%s, expression=%s, independentVariable=%s, context=%s expression=%s this=%s expression=%s",
                         reference.name,
                         reference.type,
                         isIndependent,
                         isPlaceholder,
                         upstreamInput,
                         expression,
                         expression.independentVariable,
                         expression.context,
                         expression.toStringExtended(),
                         Utensils.yamlString(this),
                         Utensils.yamlString(expression));
  }

  /**
   * Resolution step 5: walk the upstream expression chain looking for an
   * ancestor whose independent variable matches this node's name.
   */
  private VariableNode<?, ?, ?> resolveUpstreamIndependentVariables()
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
            upstreamInput  = true;
            reference.type = e.domainType;
          }
          else
          {
            reference.type = e.domainType;
          }
          found[0] = iv;
          return true;
        }

        return false;
      });
    }

    return found[0];
  }

  /**
   * Resolves this variable node to one of the six cases defined in the
   * VariableResolution spec.  Priority order: context → independent-nullary →
   * independent-non-nullary → placeholder → upstream → undefined.
   */
  public VariableNode<?, ?, ?> resolveReference()
  {
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

    if (expression.isInterfaceFunctional() && expression.placeholderVariable == null)
    {
      isPlaceholder              = true;
      reference.type             = expression.coDomainType;
      expression.placeholderVariable = this;
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference PLACEHOLDER: {}", resolutionStateString());
      }
      return this;
    }

    if (isIndependent = isIndependent())
    {
      designateAsIndependentVariable();
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference INDEPENDENT ({}): {}",
                     expression.isNullaryFunction() ? "nullary" : "non-nullary",
                     resolutionStateString());
      }
      return this;
    }
    
    // Priority 5: upstream variable
    var upstream = resolveUpstreamIndependentVariables();
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

    // Priority 6: undefined
    return throwNewUndefinedReferenceException();
  }

  protected VariableNode<?, ?, ?> throwNewUndefinedReferenceException()
  {
    throw new UndefinedReferenceException(String.format("undefined variable reference: %s", resolutionStateString()));
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
                                                                                       + "the function name since it's a recursive function";

    var existingVariable = expression.getReference(reference.name);
    if (existingVariable != null)
    {
      this.reference.type = existingVariable.reference.type;
      isIndependent       = existingVariable.isIndependent;
      isPlaceholder       = existingVariable.isPlaceholder;
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

      if (expression.placeholderVariable != null && reference.equals(expression.placeholderVariable.reference))
      {
        isPlaceholder = true;
      }

      if (!resolved)
      {
        if (isIndependent)
        {
          reference.type = expression.isNullaryFunction() ? expression.coDomainType : expression.domainType;
        }
        else if (isPlaceholder)
        {
          reference.type = expression.coDomainType;
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
        // Priority 2: nullary independent — identity codegen
        generateFunctionalVariableIdentity(mv);
      }
      else
      {
        // Priority 3: non-nullary independent — load input parameter
        Compiler.cast(loadInputParameter(mv), type());
      }
    }
    else if (isPlaceholder)
    {
      // Priority 4: placeholder variable — identity codegen
      generateFunctionalVariableIdentity(mv);
    }
    else
    {
      // Priority 1 (context) and Priority 5 (upstream): field access
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
   * Generates an {@code identity()} call for a variable that represents a
   * symbolic indeterminate rather than a runtime input parameter.  This is used
   * for both nullary-independent variables (priority 2) and placeholder variables
   * (priority 4).
   */
  public void generateFunctionalVariableIdentity(MethodVisitor mv)
  {
    if (reference.type == null)
    {
      resolveReference();
    }
    assert isIndependent && expression.isNullaryFunction() || isPlaceholder : "generateFunctionalVariableIdentity called on non-nullary non-placeholder variable: "
                                                                              + resolutionStateString();
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

  /**
   * Returns true if this node should be resolved as the independent variable of
   * the containing expression.
   *
   * <p>For nullary functions, there is no runtime input parameter, so no
   * variable is the "independent" input — the single free variable will instead
   * become the codomain placeholder (priority 4 or, if the codomain is not
   * functional, priority 2 applies directly since it shares both paths through
   * {@link #designateAsIndependentVariable}).  This method therefore returns
   * false for nullary expressions so that non-functional-codomain nullary
   * expressions still correctly fall into the nullary-independent path via
   * {@link #designateAsIndependentVariable} setting {@code isNullaryFunction()}
   * semantics, while functional-codomain nullary expressions also use it.
   *
   * <p>Concretely: for nullary expressions this method returns true when there
   * is no independent variable yet, which allows {@link #designateAsIndependentVariable}
   * to set {@code reference.type = expression.coDomainType} via its nullary branch.
   */
  public boolean isIndependent()
  {
    return equals(expression.independentVariable)
           || expression.independentVariable == null;
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

  public VariableNode<D, R, F> designateAsIndependentVariable()
  {
    assert (expression.independentVariable == null
                  || expression.independentVariable.equals(this)) : "independentVariable is already "
                                                                    + expression.independentVariable
                                                                    + " it doesn't make sense to change it to "
                                                                    + this;
    if (Expression.traceNodes)
    {
      logger.debug(String.format("#%s: designateAsIndependentVariable: declaring %s as the input node to '%s' which currently has input variable %s\n",
                                 System.identityHashCode(this),
                                 reference,
                                 expression,
                                 expression.independentVariable));
    }
    isIndependent                  = true;
    expression.independentVariable = this;
    reference.type                 = expression.isNullaryFunction() ? expression.coDomainType : expression.domainType;
    return this;
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
    if (upstreamInput && emittingBoundFormat.get())
    {
      return "%s";
    }
    return reference.toString();
  }

  public String toStringVerbose()
  {
    return "[upstreamInput="
           + upstreamInput
           + ", isIndependent="
           + isIndependent
           + ", isPlaceholder="
           + isPlaceholder
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
    else if (isPlaceholder)
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