package arb.expressions.nodes;

import static java.lang.String.format;

import java.util.*;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.nary.ProductNode;
import arb.expressions.nodes.nary.SumNode;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;

/**
 * Abstract base class for all nodes in the expression abstract syntax tree.
 * 
 * <p>
 * Each node represents an operation, literal, variable, or function in a
 * mathematical expression. Nodes form a tree structure that can be:
 * </p>
 * <ul>
 * <li>Evaluated to produce a numeric result</li>
 * <li>Differentiated symbolically</li>
 * <li>Integrated symbolically</li>
 * <li>Simplified algebraically</li>
 * <li>Compiled to JVM bytecode</li>
 * </ul>
 *
 * @param <D> Domain type of the expression
 * @param <C> Codomain type of the expression
 * @param <F> Function interface type
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class Node<D, C, F extends Function<? extends D, ? extends C>>
{
  /**
   * Thread-local set tracking which nodes have been simplified in the current
   * simplification pass. This prevents exponential blowup when the same
   * subexpression is reachable via multiple paths in the AST.
   */
  private static final ThreadLocal<Set<java.lang.Integer>> simplifiedInCurrentPass =
                                                                                    ThreadLocal.withInitial(HashSet::new);

  /**
   * Counter for tracking simplification pass depth. When this reaches 0,
   * the memoization set is cleared for the next top-level simplify() call.
   */
  private static final ThreadLocal<java.lang.Integer>      simplifyPassDepth       =
                                                                              ThreadLocal.withInitial(() -> 0);

  /**
   * Enable/disable simplification memoization. Set to false for debugging.
   */
  public static boolean                                    memoizeSimplify         = true;

  public int                                               position;

  public Expression<D, C, F>                               expression;

  public String                                            fieldName;

  public Class<?>                                          generatedType;

  public boolean                                           intermediate;

  public String                                            typeName;

  public Node(Expression<D, C, F> expression)
  {
    this.expression = expression;
  }

  /**
   * Begins a simplification pass. Call this at the start of a top-level
   * simplify() operation.
   */
  protected static void beginSimplifyPass()
  {
    simplifyPassDepth.set(simplifyPassDepth.get() + 1);
  }

  /**
   * Ends a simplification pass. When depth reaches 0, clears the memoization
   * set.
   */
  protected static void endSimplifyPass()
  {
    int depth = simplifyPassDepth.get() - 1;
    simplifyPassDepth.set(depth);
    if (depth == 0)
    {
      simplifiedInCurrentPass.get().clear();
    }
  }

  /**
   * Checks if this node has already been simplified in the current pass.
   * 
   * @return true if already simplified
   */
  protected boolean alreadySimplifiedInThisPass()
  {
    if (!memoizeSimplify)
    {
      return false;
    }
    return simplifiedInCurrentPass.get().contains(System.identityHashCode(this));
  }

  /**
   * Marks this node as simplified in the current pass.
   */
  protected void markSimplified()
  {
    if (memoizeSimplify)
    {
      simplifiedInCurrentPass.get().add(System.identityHashCode(this));
    }
  }

  public void accept(Consumer<Node<D, C, F>> visitor)
  {
    visitor.accept(this);
  }

  public Node<D, C, F> add(Node<D, C, F> addend)
  {
    return new AdditionNode<>(expression,
                              this,
                              addend);
  }

  public Node<D, C, F> arccos()
  {
    return new ArcCosineNode<>(expression,
                               this);
  }

  public Node<D, C, F> arccosh()
  {
    return new HyperbolicArcCosineNode<>(expression,
                                         this);
  }

  public Node<D, C, F> arcsin()
  {
    return new ArcSineNode<>(expression,
                             this);
  }

  public Node<D, C, F> arcsinh()
  {
    return new HyperbolicArcSineNode<>(expression,
                                       this);
  }

  public Node<D, C, F> arctan()
  {
    return new ArcTangentNode<>(expression,
                                this);
  }

  public Node<D, C, F> arctanh()
  {
    return new HyperbolicArcTangentNode<>(expression,
                                          this);
  }

  public FunctionNode<D, C, F> asFunction()
  {
    return (FunctionNode<D, C, F>) this;
  }

  public LiteralConstantNode<D, C, F> asLiteralConstant()
  {
    return (LiteralConstantNode<D, C, F>) this;
  }

  public VariableNode<D, C, F> asVariable()
  {
    return (VariableNode<D, C, F>) this;
  }

  public Node<D, C, F> cos()
  {
    return new CosineNode<>(expression,
                            this);
  }

  public Node<D, C, F> cosh()
  {
    return new HyperbolicCosineNode<>(expression,
                                      this);
  }

  public Node<D, C, F> cot()
  {
    return new CotangentNode<>(expression,
                               this);
  }

  public Node<D, C, F> coth()
  {
    return new HyperbolicCotangentNode<>(expression,
                                         this);
  }

  public Node<D, C, F> csc()
  {
    return new CosecantNode<>(expression,
                              this);
  }

  public Node<D, C, F> csch()
  {
    return new HyperbolicCosecantNode<>(expression,
                                        this);
  }

  public abstract boolean dependsOn(VariableNode<D, C, F> variable);

  /**
   * Computes the symbolic derivative of this node with respect to the given
   * variable.
   *
   * @param variable The variable to differentiate with respect to
   * @return A new node representing the derivative
   */
  public abstract Node<D, C, F> differentiate(VariableNode<D, C, F> variable);

  public Node<D, C, F> div(Node<D, C, F> divisor)
  {
    return new DivisionNode<>(expression,
                              this,
                              divisor);
  }

  @Override
  public abstract boolean equals(Object obj);

  public Node<D, C, F> exp()
  {
    return new ExponentialNode<>(expression,
                                 this);
  }

  public Node<D, C, F> factorial()
  {
    return new FactorialNode<>(expression,
                               this);
  }

  public abstract MethodVisitor generate(MethodVisitor methodVisitor, Class<?> resultType);

  public abstract List<Node<D, C, F>> getBranches();

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public Node<D, C, F> getSquareRootArg()
  {
    if (isSquareRoot())
    {
      return ((SquareRootNode<D, C, F>) this).arg;
    }
    return null;
  }

  @Override
  public abstract int hashCode();

  /**
   * Computes the symbolic integral of this node with respect to the given
   * variable.
   *
   * @param variable The variable to integrate with respect to
   * @return A new node representing the antiderivative
   */
  public abstract Node<D, C, F> integrate(VariableNode<D, C, F> variable);

  public boolean isBitless()
  {
    return false;
  }

  public boolean isConstant()
  {
    return false;
  }

  public boolean isFunction()
  {
    return false;
  }

  public boolean isHalf()
  {
    return false;
  }

  public boolean isIndependentOf(VariableNode<D, C, F> variable)
  {
    return !dependsOn(variable);
  }

  public abstract boolean isLeaf();

  public boolean isLiteralConstant()
  {
    return false;
  }

  public boolean isNegativeInfinity()
  {
    return false;
  }

  public boolean isNegOne()
  {
    return false;
  }

  public boolean isOne()
  {
    return false;
  }

  public boolean isPositiveInfinity()
  {
    return false;
  }

  /**
   * can the expression represented by this node possibly assume a value less
   * than zero?
   * 
   * @return true if it can
   */
  public boolean isPossiblyNegative()
  {
    return true;
  }

  /**
   * Is this {@link Node} a representation of a multiplication of other scalars
   * not involving any addition/subtraction or other elementary operations/
   * 
   * @return
   */
  public boolean isScalar()
  {
    return isLeaf();
  }

  public boolean isSquareRoot()
  {
    return this instanceof SquareRootNode;
  }

  public boolean isTwo()
  {
    return false;
  }

  public boolean isVariable()
  {
    return false;
  }

  public boolean isVariableSquared(VariableNode<D, C, F> variable)
  {
    if (this instanceof ExponentiationNode<D, C, F> exp)
    {
      return exp.left.equals(variable) && exp.right.isTwo();
    }
    return false;
  }

  public boolean isZero()
  {
    return false;
  }

  public Node<D, C, F> log()
  {
    return new NaturalLogarithmNode<>(expression,
                                      this);
  }

  public Node<D, C, F> mul(Node<D, C, F> multiplicand)
  {
    return new MultiplicationNode<>(expression,
                                    this,
                                    multiplicand);
  }

  public Node<D, C, F> neg()
  {
    return new NegationNode<>(expression,
                              this);
  }

  public Node<D, C, F> negativeOne()
  {
    return new LiteralConstantNode<>(expression,
                                     "-1");
  }

  public Node<D, C, F> one()
  {
    return new LiteralConstantNode<>(expression,
                                     "1");
  }

  public Node<D, C, F> pow(int n)
  {
    return pow(new LiteralConstantNode<>(expression,
                                         String.valueOf(n)));
  }

  public Node<D, C, F> pow(Node<D, C, F> exponent)
  {
    return new ExponentiationNode<>(expression,
                                    this,
                                    exponent);
  }

  public Node<D, C, F> product(String indexVariableName, Node<D, C, F> from, Node<D, C, F> to)
  {
    return new ProductNode<D, C, F>(expression,
                                    indexVariableName,
                                    from,
                                    to,
                                    this);
  }

  public Node<D, C, F> sec()
  {
    return new SecantNode<>(expression,
                            this);
  }

  public Node<D, C, F> sech()
  {
    return new HyperbolicSecantNode<>(expression,
                                      this);
  }

  /**
   * Simplifies this node algebraically.
   * 
   * <p>
   * This method uses memoization to avoid re-simplifying the same node multiple
   * times within a single simplification pass. This is critical for preventing
   * exponential blowup when the AST has shared subexpressions.
   * </p>
   *
   * @return A simplified version of this node, or this node if no
   *         simplification is possible
   */
  public Node<D, C, F> simplify()
  {
    return this;
  }

  public Node<D, C, F> sin()
  {
    return new SineNode<>(expression,
                          this);
  }

  public Node<D, C, F> sinh()
  {
    return new HyperbolicSineNode<>(expression,
                                    this);
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression);

  public Node<D, C, F> sqrt()
  {
    return new SquareRootNode<>(expression,
                                this);
  }

  public Node<D, C, F> sub(Node<D, C, F> subtrahend)
  {
    return new SubtractionNode<>(expression,
                                 this,
                                 subtrahend);
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String name, Node<E, S, G> replacement)
  {
    return this;
  }

  public Node<D, C, F> sum(String indexVariableName, Node<D, C, F> from, Node<D, C, F> to)
  {
    return new SumNode<D, C, F>(expression,
                                indexVariableName,
                                from,
                                to,
                                this);
  }

  public abstract char symbol();

  public Node<D, C, F> tan()
  {
    return new TangentNode<>(expression,
                             this);
  }

  public Node<D, C, F> tanh()
  {
    return new HyperbolicTangentNode<>(expression,
                                       this);
  }

  public Node<D, C, F> two()
  {
    return new LiteralConstantNode<>(expression,
                                     "2");
  }

  public abstract Class<?> type();

  public String typeset()
  {
    return toString();
  }

  public Node<D, C, F> zero()
  {
    return new LiteralConstantNode<>(expression,
                                     "0");
  }

  public String toStringWithType()
  {
    return format("%s<%s>", this, type().getSimpleName());
  }
}
