package arb.expressions.nodes;

import static arb.expressions.Compiler.loadInputParameter;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Polynomial;
import arb.QuasiPolynomial;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.VariableReference;
import arb.expressions.Variables;
import arb.expressions.nodes.nary.Product;
import arb.functions.Function;

/**
 * This class represents a {@link Variable} node within an {@link Expression} by
 * extending the {@link Node} class to provide additional functionality for
 * managing {@link VariableReference}s those registered in the {@link Context}
 * and or those which are inputs to the expression, or any upstream expression
 * (in the case of nested-expressions such as for {@link Product}s
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
 * through its {@link #generate(Class, MethodVisitor)} method.
 * </p>
 * 
 * @param <D> Type of domain field
 * @param <R> Type of coDomain field
 * @param <F> Type of function that maps domain to coDomain, must implement
 *            {@link Function}.
 *
 * @author ©2024 Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Variable<D, R, F extends Function<? extends D, ? extends R>> extends
                     Node<D, R, F>
{

  @Override
  public boolean
         dependsOn(Variable<D, R, F> variable)
  {
    return equals(variable);
  }

  @Override
  public String
         toString()
  {
    return reference.toString();
  }

  @Override
  public boolean
         isVariable()
  {
    return true;
  }

  @Override
  public Class<?>
         getGeneratedType()
  {
    return generatedType;
  }

  @Override
  public Class<?>
         type()
  {
    Class<?> returnType = null;
    if (isIndependent)
    {
      returnType = expression.domainType;
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

  public final VariableReference<D, R, F> reference;

  public boolean                          isIndependent = false;

  public boolean                          isIndetermate = false;

  public boolean                          ascendentInput;

  public Variable(Expression<D, R, F> expression,
                  VariableReference<D, R, F> reference,
                  int startPos,
                  boolean resolve)
  {
    super(expression);
    Variables variables = expression.variables;
    this.expression = expression;
    this.reference  = reference;

    assert reference != null;
    assert !(expression.recursive
             && reference.name.equals(expression.functionName)) : "variable name clashes with "
                                                                  + "the function name since its a recursve function";

    if ((variables == null
         || !variables.map.containsKey(reference.name)
         || reference.type == null)
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
      if (isIndetermate)
      {
        reference.type = expression.coDomainType;
      }
      else
      {
        if (!reference.isElse()
            && !isIndetermate)
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

  @Override
  public boolean
         equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    var other = (Variable<?, ?, ?>) obj;
    return Objects.equals(reference,
                          other.reference);
  }

  @Override
  public MethodVisitor
         generate(Class<?> resultType,
                  MethodVisitor mv)
  {
    if (Expression.trace)
    {
      System.out.format("Variable(#%s).generate( this=%s, resultType=%s)\n\n",
                        System.identityHashCode(this),
                        this,
                        resultType);
    }

    generateReference(mv,
                      resultType);

    generateIndexAccess(mv);

    if (generatedType == null)
    {
      generatedType = type();
    }

    // TODO: this should really do the conversion to resultType if generatedType !=
    // resultType. Or better yet, generate the requested type in the first place

    if (isResult)
    {
      expression.generateSetResultInvocation(mv,
                                             generatedType);
    }

    return mv;
  }

  public String
         getName()
  {
    return reference.name;
  }

  private void
          generateIndexAccess(MethodVisitor mv)
  {
    Class<? extends R> indexType = null;
    if (reference.index != null)
    {
      indexType = reference.index.type();

      reference.index.generate(indexType,
                               mv);
    }

    if (Integer.class.equals(indexType))
    {
      mv.visitMethodInsn(INVOKEVIRTUAL,
                         Type.getInternalName(reference.type()),
                         "get",
                         Compiler.getMethodDescriptor(reference.type(),
                                                      indexType),
                         false);

    }
    else
    {
      if (indexType != null)
      {
        throw new CompilerException("Unhandled indexType " + indexType);
      }
    }
  }

  private void
          generateReference(MethodVisitor mv,
                            Class<?> neededType)
  {
    if (isIndependent)
    {
      generateReferenceToThisIndependentVariable(mv);
    }
    else if (isIndetermate)
    {
      generateReferenceToThisVariableRepresentingTheIndeterminantOfAPolynomial(mv);
    }
    else
    {
      generateReferenceToContextualVariable(mv);
    }
  }

  public void
         generateReferenceToContextualVariable(MethodVisitor mv)
  {
    if (reference.type() == null)
    {
      resolveReference();
      assert reference.type != null : "type is null for " + reference + " expression=" + expression
                                      + " expression.ascendentExpression=" + expression.ascendentExpression;
    }
    Class<?> referenceType = reference.type();

    expression.loadThisFieldOntoStack(mv,
                                      reference.name,
                                      referenceType);
//    expression.loadFieldOntoStack(loadThisOntoStack(mv),
//                                  reference.name,
//                                  referenceType.descriptorString());
  }

  public void
         generateReferenceToThisVariableRepresentingTheIndeterminantOfAPolynomial(MethodVisitor mv)
  {
    if (reference.type == null)
    {
      resolveReference();
    }
    Compiler.checkClassCast(Compiler.loadResultParameter(mv),
                            reference.type);
    generateIndeterminateRangeIdentityInvocation(mv);
  }

  public void
         generateReferenceToThisIndependentVariable(MethodVisitor mv)
  {
    Compiler.checkClassCast(loadInputParameter(mv),
                            expression.domainType);
  }

  private void
          generateIndeterminateRangeIdentityInvocation(MethodVisitor mv)
  {
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(reference.type),
                       "identity",
                       format("()%s",
                              reference.type.descriptorString()),
                       false);
  }

  @Override
  public int
         hashCode()
  {
    return Objects.hash(expression,
                        isIndependent,
                        reference,
                        expression.variables);
  }

  @Override
  public boolean
         isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor
         prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "a variable is never reusable(overwritable)";
    return null;
  }

  public Variable<D, R, F>
         resolveReference()
  {
    if (Expression.trace)
    {
      System.err.format("\nVariable(#%s).resolveReference(reference=%s) expression=%s\n\n",
                        System.identityHashCode(this),
                        reference,
                        expression);
    }

    if (isIndetermate)
    {
      reference.type = expression.getThisOrAnyAscendentExpressionsPolynomialCoDomain();
    }

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

      boolean a = expression.thisOrAnyAscendentExpressionHasPolynomialOrQuasiPolynomialCoDomain();
      boolean b = expression.anyAscendentIndependentVariableIsEqualTo(getName());
      boolean c = expression.getVariable(reference) == null;
      boolean d = expression.independentVariable == null
                  || !expression.independentVariable.getName()
                                                    .equals(getName());
      if (isIndetermate = ((a
                            && !b)
                           && c
                           && d))
      {
        if (expression.indeterminateVariable != this
            && Expression.trace)
        {
          System.err.format("Expression(#%s) declaring %s to be the indeterminant in %s\nvariables=%s\n\n",
                            System.identityHashCode(expression),
                            this,
                            expression,
                            expression.context == null ? null : expression.context.variables);

        }

        expression.indeterminateVariable = this;

      }
      else
      {
        resolveInheritedVariableReference(inputVariable);
      }
    }
    return this;
  }

  public boolean
         resolveContextualVariable()
  {
    if (expression.variables != null)
    {
      Object instanceVariable = expression.variables.get(reference.name);
      if (instanceVariable != null)
      {
        reference.type = instanceVariable.getClass();
        if (Expression.trace)
        {
          System.err.println("Declaring " + reference + " as a contextual variable of type " + reference.type());

        }

        return true;
      }
    }

    return false;
  }

  public void
         resolveIndependentVariable(Variable<D, R, F> inputVariable)
  {
    assert (inputVariable == null
            || inputVariable.equals(expression.independentVariable)) : "inputVariable is already " + inputVariable
                                                                       + " it doesnt make sense to change it to "
                                                                       + this;

    if (Expression.trace)
    {
      System.err.format("Variable(#%s).resolveIndependentVariable: declaring " + reference + " as the input node to "
                        + expression + " which currently has input variable " + expression.independentVariable + "\n\n",
                        System.identityHashCode(this));
    }

    expression.independentVariable = this;
    reference.type                 = expression.domainType;
  }

  public boolean
         isIndependent(Variable<D, R, F> inputVariable)
  {
    return equals(inputVariable)
           || (inputVariable == null
               && !expression.references(reference)
               && !expression.isNullaryPolynomialFunction());
  }

  protected void
            resolveInheritedVariableReference(Variable<D, R, F> variable)
  {

    var parentExpression = expression.ascendentExpression;
    if (parentExpression != null)
    {
      resolve(reference,
              parentExpression);
    }
    else
    {
      throw new UndefinedReferenceException(format("Undefined reference to variable"
                                                   + " '%s' in expression=%s, expression.rootNode=%s, independent variable is %s and parentExpression is %s",
                                                   reference.name,
                                                   expression.expression,
                                                   expression.rootNode,
                                                   variable,
                                                   expression.ascendentExpression));
    }
  }

  protected Variable<?, ?, ?>
            resolve(VariableReference<D, R, F> reference,
                    Expression<?, ?, ?> ascendentExpression)
  {
    var ascendentInputNode = ascendentExpression.independentVariable;

    if (ascendentInputNode != null
        && ascendentInputNode.reference.equals(reference))
    {
      if (Expression.trace)
      {
        System.err.format("Assigning this %s as ascendent input node=%s\n",
                          this,
                          ascendentInputNode);
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

  @Override
  public String
         typeset()
  {
    return reference.typeset();
  }

  public ClassVisitor
         declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC,
                            reference.name,
                            type().descriptorString(),
                            null,
                            null);
    return classVisitor;
  }

  @Override
  public boolean
         isLeaf()
  {
    return true;
  }

  @Override
  public boolean
         hasSingleLeaf()
  {
    return false;
  }

  @Override
  public List<Node<D, R, F>>
         getBranches()
  {
    return List.of();
  }

  public Variable<D, R, F>
         resolveType()
  {
    resolveReference();
    assert type() != null : "type() STILL null even after calling resolveReference";
    return this;
  }

  @Override
  public Node<D, R, F>
         integral(Variable<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable,
                    Node<E, S, G> arg)
  {
    return variable.equals(getName()) ? arg.spliceInto(expression) : this;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new Variable<E, S, G>(newExpression,
                                 reference.spliceInto(newExpression),
                                 -1,
                                 true);
  }

  @Override
  public void
         accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }

  public boolean
         isNamed(String variable)
  {
    return getName().equals(variable);
  }

  public Variable<D, R, F>
         renameTo(String to)
  {
    reference.name = to;
    return this;
  }

  @Override
  public Node<D, R, F>
         derivative(Variable<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean
         isScalar()
  {
    return !type().isAssignableFrom(Polynomial.class)
           && !type().isAssignableFrom(QuasiPolynomial.class);
  }

  @Override
  public char
            symbol()
  {
    return getName().charAt(0);
  }

  @Override
  public boolean isConstant()
  {
    return false;
  }

}
