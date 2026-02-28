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
 * This class represents a {@link VariableNode} node within an
 * {@link Expression} by extending the {@link Node} class to provide additional
 * functionality for managing {@link VariableReference}s, those registered in
 * the {@link Context}, and/or those which are inputs to the {@link Expression},
 * or any upstream expression (in the case of nested-expressions such as for
 * {@link ProductNode}s).
 *
 * <h3>Variable Types</h3>
 * <p>
 * A variable can be one of three types:
 * <ul>
 * <li><strong>Independent variable:</strong> The input variable to the
 * containing expression or any containing-expression's input. This variable
 * will receive concrete values during function evaluation.</li>
 * <li><strong>Indeterminate variable:</strong> A symbolic placeholder used in
 * algebraic computations, including polynomial expressions, rational functions,
 * and functionals (functions whose codomain is itself a function). These
 * variables remain symbolic for algebraic manipulation before evaluation.</li>
 * <li><strong>Context variable:</strong> A variable defined in the
 * {@link Context} associated with this {@link #expression}, representing named
 * constants or parameters from the evaluation environment.</li>
 * </ul>
 * </p>
 * 
 * <h3>Terminology Distinction</h3>
 * <p>
 * While "independent" and "indeterminate" may appear synonymous, they serve
 * distinct roles: independent variables are function inputs that receive values
 * at evaluation time, while indeterminate variables remain symbolic for
 * algebraic operations. In functionals like
 * {@code Function<Real, Function<Real, Complex>>}, inner variables are
 * independent from their local function's perspective but indeterminate from
 * the outer functional's perspective.
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
  public static final Logger logger = LoggerFactory.getLogger(VariableNode.class);

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

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  Logger log = LoggerFactory.getLogger(getClass());

  @Override
  public boolean isPossiblyNegative()
  {
    return true;
  }

  public boolean                    upstreamInput;

  public boolean                    isIndependent   = false;

  public boolean                    isIndeterminate = false;

  public VariableReference<D, R, F> reference;

  public VariableNode(Expression<D, R, F> expression,
                      VariableReference<D, R, F> reference,
                      int startPos,
                      boolean resolve)
  {
    super(expression);
    var variables = expression.context != null ? expression.context.variables : null;
    this.expression         = expression;
    this.reference          = reference;
    this.reference.position = startPos;
    assert reference != null;
    assert !(expression.recursive
                  && reference.name.equals(expression.functionName)) : "variable name clashes with "
                                                                       + "the function name since it's a recursve function";

    var existingVariable = expression.getReference(reference.name);
    if (existingVariable != null)
    {
      this.reference.type = existingVariable.reference.type;
      isIndependent       = existingVariable.isIndependent;
      isIndeterminate     = existingVariable.isIndeterminate;
    }
    else
    {
      if ((variables == null || !variables.containsKey(reference.name) || reference.type == null)
                    && resolve)
      {
        resolveReference();
      }

      if (expression.independentVariable != null
                    && reference.equals(expression.independentVariable.reference))
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
            expression.registerReferencedVariable(this);
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

  boolean         refuseToGenerateIndeterminateVariables = false;

  private boolean upstreamIndeterminate;

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.traceNodes)
    {
      log.debug(String.format("#%s: generate( this=%s, resultType=%s)\n",
                              System.identityHashCode(this),
                              this,
                              resultType));
    }

    if (refuseToGenerateIndeterminateVariables && isIndeterminate && isScalar())
    {
      throw new CompilerException(this
                                  + " is an indeterminate variable, not independent, it should not be generated since its a placeholder, expression="
                                  + expression);
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
      Compiler.cast(loadInputParameter(mv), type());
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
    expression.loadThisFieldOntoStack(mv, reference.name, referenceType);

  }

  public void generateReferenceToIndeterminantVariable(MethodVisitor mv)
  {
    assert isIndeterminate : this + " is not an indeterminant variable";
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
    return equals(inputVariable) || (inputVariable == null && !expression.references(reference)
                  && !expression.hasIndeterminateVariable());
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

  private VariableNode<?, ?, ?> resolveBoundVariable()
  {
    final VariableNode<?, ?, ?>[] bound = new VariableNode[1];

    if (expression != null)
    {
      expression.acceptUntil(e ->
      {
        // 1) Check independent variable in this scope
        var iv = e.independentVariable;
        if (iv != null && reference.equals(iv.reference))
        {
          if (e != expression)
          {
            upstreamInput = true;
          }
          reference.type = e.domainType;
          bound[0]       = iv;
          return true;
        }

        // 2) Check indeterminates in this scope
        for (var v : e.getIndeterminateVariables())
        {
          if (reference.equals(v.reference))
          {
            if (e != expression)
            {
              upstreamIndeterminate = true;
            }
            isIndeterminate = true;
            reference.type  = v.reference.type();
            bound[0]        = v;
            return true;
          }
        }

        return false;
      });
    }

    return bound[0];
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
    assert (inputVariable == null
                  || inputVariable.equals(expression.independentVariable)) : "inputVariable is already "
                                                                             + inputVariable
                                                                             + " it doesnt make sense to change it to "
                                                                             + this;
    if (!equals(inputVariable))
    {
      if (Expression.traceNodes)
      {

        log.debug(String.format("#%s: resolveIndependentVariable: declaring %s as the input node to '%s' which currently has input variable %s and indeterminant varaibles %s\n",
                                System.identityHashCode(this),
                                reference,
                                expression,
                                expression.independentVariable,
                                expression.getIndeterminateVariables()));
      }
      isIndependent                  = true;
      expression.independentVariable = this;
      reference.type                 = expression.domainType;
    }
  }

  public VariableNode<?, ?, ?> resolveReference()
  {
    var inputVariable = expression.independentVariable;

    if (Expression.traceNodes)
    {
      log.debug("=== resolveReference START: var={}, expr={}, upstreamExpr={}",
                reference.name,
                expression.functionName,
                expression.upstreamExpression != null ? expression.upstreamExpression.functionName
                                                      : "null");
    }

    // 1) Context variable
    if (resolveContextualVariable())
    {
      if (Expression.traceNodes)
      {
        log.debug("=== resolveReference: {} resolved as CONTEXT variable in {}",
                  reference.name,
                  expression.functionName);
      }
      return this;
    }

    // 2) Independent variable
    if (isIndependent = isIndependent(inputVariable))
    {
      resolveIndependentVariable(inputVariable);
      reference.type = expression.domainType;
      if (Expression.traceNodes)
      {
        log.debug("=== resolveReference: {} resolved as INDEPENDENT variable in {}",
                  reference.name,
                  expression.functionName);
      }
      return this;
    }

    // 3) Bind in current or upstream scope (combined)
    var bound = resolveBoundVariable();
    if (bound != null)
    {
      if (Expression.traceNodes)
      {
        log.debug("=== resolveReference: {} FOUND in upstream, upstreamInput={}, upstreamIndeterminate={}, referencedVariables.containsKey={}",
                  reference.name,
                  upstreamInput,
                  upstreamIndeterminate,
                  expression.isVariableReferenced(this));
      }

      if (upstreamInput || upstreamIndeterminate)
      {
        if (Expression.traceNodes)
        {
          log.debug("=== resolveReference: ADDING {} to referencedVariables in {}",
                    reference.name,
                    expression.functionName);
        }
        expression.registerReferencedVariable(this);
      }

      if (Expression.traceNodes)
      {
        log.debug("=== resolveReference: {} resolved from upstream, isIndependent={}, isIndeterminate={}, type={}",
                  reference.name,
                  isIndependent,
                  isIndeterminate,
                  reference.type);
      }
      return this;
    }

    // 4) New indeterminate
    if (expression.getIndeterminateVariables().isEmpty() || reference.type != null)
    {
      isIndeterminate = true;
      reference.type  = expression.coDomainType;
      declareThisToBeTheIndeterminantVariable();
      if (Expression.traceNodes)
      {
        log.debug("=== resolveReference: {} declared as NEW INDETERMINATE in {}",
                  reference.name,
                  expression.functionName);
      }
      return this;
    }
    else
    {
      throw new CompilerException(String.format("undefined variable reference '%s' in expression '%s'; existing indeterminates: %s, independent variable: %s context=%s",
                                                reference.name,
                                                expression,
                                                expression.getIndeterminateVariables(),
                                                expression.independentVariable,
                                                expression.context));
    }
  }

  protected void throwNewUndefinedReferenceException()
  {
    throw new UndefinedReferenceException(format("Undefined reference '%s' at position=%d in Expression(=%s)=%s, "
                                                 + "independent variable is %s, indeterminant variables is %s, and upstreamExpression is %s, remaining='%s' and upstreamExpression.indeterminantVariables='%s'",
                                                 reference.name,
                                                 reference.position,
                                                 System.identityHashCode(expression),
                                                 expression,
                                                 expression.independentVariable,
                                                 expression.getIndeterminateVariable(),
                                                 expression.upstreamExpression,
                                                 expression.remaining(),
                                                 expression.upstreamExpression
                                                               != null ? expression.upstreamExpression.getIndeterminateVariables()
                                                                       : null));
  }

  public VariableNode<D, R, F> declareThisToBeTheIndeterminantVariable()
  {

    if (Expression.traceNodes)
    {
      log.debug(String.format("Expression(#%s) declaring %s to be the indeterminant in %s by pushing it to the top of the stack %s\n",
                              System.identityHashCode(expression),
                              this,
                              expression,
                              expression.getIndeterminateVariables()));

    }
    if (expression.anyUpstreamIndependentVariableIsNamed(getName()))
    {
      throw new CompilerException("cannot set the independent variable of "
                                  + this
                                  + " to "
                                  + getName()
                                  + " because it is the independent variable of "
                                  + this
                                  + " or one of its upstream(upstream) expressions");
    }
    expression.registerReferencedVariable(this);
    expression.pushIndeterminateVariable(this);
    return this;
  }

  protected void throwNewIndeterminantVariableAlreadyDeclared()
  {
    throw new CompilerException(String.format("the inderminate variable has already been declared to be '%s' in expr#%s the so it cannot be changed to '%s' at position=%s in expr='%s'",
                                              expression.getIndeterminateVariables(),
                                              System.identityHashCode(expression),
                                              this,
                                              expression.position,
                                              expression));
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         VariableNode<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new VariableNode<E, S, G>(newExpression,
                                     reference.spliceInto(newExpression),
                                     position,
                                     true);
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
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
           + ", isIndeterminant="
           + isIndeterminate
           + ", reference="
           + reference
           + ", upstreamIndeterminate="
           + upstreamIndeterminate
           + "]";
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

  public VariableNode<D, R, F> pushThisOntoTheIndeterminantVariableStack()
  {
    assert !expression.getIndeterminateVariables()
                      .contains(this) : this
                                        + " is already in "
                                        + expression.getIndeterminateVariables();
    assert !equals(expression.independentVariable) : "cannot add "
                                                     + this
                                                     + " to indeterminate stack since it is the inependent variable";

    expression.pushIndeterminateVariable(this);
    return this;
  }

}
