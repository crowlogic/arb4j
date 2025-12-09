package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.scilab.forge.jlatexmath.LaTeXAtom;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.unary.*;
import arb.expressions.viz.ExpressionTree;
import arb.functions.Function;

/**
 * <pre>
 * Represents the abstract base class for elements of the abstract {@link ExpressionTree} 
 * constituting an {@link Expression}. This class is a fundamental part of the framework, 
 * facilitating the construction, manipulation, and evaluation of symbolic express
 * ions. Nodes in the tree can perform a variety of operations such as differentiation, 
 * integration, and algebraic simplifications, employing generics to accommodate 
 * different data and function types.
 *
 * Each node can be a composite, containing other nodes, or a leaf, representing
 * terminal operations or values. The class supports dynamic type
 * transformations, code generation via the ASM framework, and optimization
 * techniques like subtree reuse to enhance performance and memory efficiency.
 * It also integrates typesetting capabilities, using JLaTeXMath for rendering
 * expressions in LaTeX format.
 *
 * Subclasses must implement functionality specific to the symbolic operations
 * they represent, including handling their computational branches, and must
 * provide methods for performing substitutions and cloning, even if not
 * implemented via the {@link Cloneable} interface.
 * </pre>
 * 
 * @param <D> the domain type of the node, defining the types of inputs this node accepts
 * @param <R> the range type of the node, defining the types of results this node produces
 * @param <F> the type of function encapsulated by this node, conforming to the
 *            {@link Function} interface
 *
 * @see Function
 * @see Expression
 * @see MethodVisitor
 * @see LaTeXAtom
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
@SuppressWarnings("unchecked")
public abstract class Node<D, R, F extends Function<? extends D, ? extends R>>
                          implements
                          Typesettable,
                          Consumer<Consumer<Node<D, R, F>>>
{

  public String toStringWithoutIndependentVariableSpecified()
  {
    String str        = toString();
    int    arrowIndex = str.indexOf('➔');
    return arrowIndex == -1 ? str : str.substring(arrowIndex + 1);
  }

  /**
   * @return true if this node's evaluation is independent of all input parameters
   */
  public boolean isConstantExpression()
  {
    if (independentOfInput())
    {
      // Check that all branches are also constant using functional traversal
      final boolean[] allConstant =
      { true };
      accept(node ->
      {
        if (node != this && !node.independentOfInput())
        {
          allConstant[0] = false;
        }
      });
      return allConstant[0];
    }
    return false;
  }

  public boolean hoisted;

  public boolean independentOfInput()
  {
    return expression.isNullaryFunction() ? true : !isIndependentOf(expression.getIndependentVariable());
  }

  public int                 bits     = 128;

  public Expression<D, R, F> expression;

  public String              fieldName;

  public Class<?>            generatedType;

  public boolean             isResult = false;

  protected final Logger     logger   = LoggerFactory.getLogger(getClass());

  public final int           position;

  public Node(Expression<D, R, F> expression)
  {
    this.expression = expression;
    this.position   = expression.position;
  }

  public <N extends Node<D, R, F>> N abs()
  {
    return (N) new AbsoluteValueNode<>(expression,
                                       this);
  }

  public <N extends Node<D, R, F>> N add(Node<D, R, F> addend)
  {
    return (N) new AdditionNode<>(expression,
                                  this,
                                  addend);
  }

  public FunctionNode<D, R, F> apply(String functionName)
  {
    return new FunctionNode<>(functionName,
                              this,
                              expression);
  }

  public Node<D, R, F> arcsin()
  {
    return apply("arcsin");
  }

  public Node<D, R, F> arctan()
  {
    return apply("arctan");
  }

  public BinaryOperationNode<D, R, F> asBinaryOperation()
  {
    assert this instanceof BinaryOperationNode : this + " isn't a BinaryOperationNode";
    return (BinaryOperationNode<D, R, F>) this;
  }

  public FunctionNode<D, R, F> asFunction()
  {
    assert isFunction() : this + " isn't a FunctionNode";
    return (FunctionNode<D, R, F>) this;
  }

  public LiteralConstantNode<D, R, F> asLiteralConstant()
  {
    assert this instanceof LiteralConstantNode : this + " isn't a Literal constant, it is a " + this.getClass().getName();
    return (LiteralConstantNode<D, R, F>) this;
  }

  public VariableNode<D, R, F> asVariable()
  {
    assert isVariable() : this + " isn't a Variable";
    return (VariableNode<D, R, F>) this;
  }

  @Override
  public Object clone()
  {
    assert false : "TODO";
    return null;
  }

  public Node<D, R, F> δ()
  {
    return apply("δ");
  }

  public Node<D, R, F> θ()
  {
    return apply("θ");
  }

  public Node<D, R, F> cos()
  {
    return apply("cos");
  }

  public Node<D, R, F> cosh()
  {
    return apply("cosh");
  }

  public Node<D, R, F> cot()
  {
    return apply("cot");
  }

  public abstract boolean dependsOn(VariableNode<D, R, F> variable);

  /**
   * 
   * @return this{@link #differentiate(VariableNode)} with
   *         {@link Expression#independentVariable} passed as the variable to be
   *         differentiated with respect to
   */
  public Node<D, R, F> differentiate()
  {
    var variable = expression.indeterminateVariable != null ? expression.indeterminateVariable : expression.independentVariable;
    return differentiate(variable);
  }

  public abstract Node<D, R, F> differentiate(VariableNode<D, R, F> variable);

  public Node<D, R, F> digamma()
  {
    return apply("digamma");
  }

  public int dim()
  {
    return 1;
  }

  public Node<D, R, F> div(int i)
  {
    return div(expression.newLiteralConstant(i));
  }

  public Node<D, R, F> div(Node<D, R, F> divisor)
  {
    return new DivisionNode<>(expression,
                              this,
                              divisor);
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
    Node<?, ?, ?> other = (Node<?, ?, ?>) obj;
    return Objects.equals(generatedType,
                          other.generatedType) && isResult == other.isResult;
  }

  public FunctionNode<D, R, F> exp()
  {
    return apply("exp");
  }

  public void loadOutputVariableOntoStack(MethodVisitor methodVisitor, Class<?> resultType)
  {
    if (isResult)
    {
      cast(loadResultParameter(methodVisitor),
           resultType);
      fieldName = "result";
    }
    else
    {
      fieldName = expression.allocateIntermediateVariable(methodVisitor,
                                                          resultType);
    }
  }

  public abstract MethodVisitor generate(MethodVisitor mv, Class<?> resultType);

  public Class<?> generateCastTo(MethodVisitor methodVisitor, Class<?> type)
  {
    if (Expression.trace)
    {
      logger.debug(String.format("generateCastTo(type=%s) from generatedType=%s\n",
                                 type,
                                 generatedType));
    }
    cast(methodVisitor,
         generatedType);
    expression.allocateIntermediateVariable(methodVisitor,
                                            type);
    swap(methodVisitor);
    invokeSetMethod(methodVisitor,
                    generatedType,
                    type);
    return generatedType = type;
  }

  public abstract List<? extends Node<D, R, F>> getBranches();

  public String getFieldName()
  {
    return isResult ? "result" : fieldName;
  }

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public Node<D, R, F> getSquareRootArg()
  {
    return null;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(generatedType,
                        isResult);
  }

  /**
   * Compute the indefinite integral of this node
   * 
   * @param variable
   * @return
   */
  public abstract Node<D, R, F> integrate(VariableNode<D, R, F> variable);

  public boolean isHalf()
  {
    return false;
  }

  public boolean isIndependentOf(VariableNode<D, R, F> variable)
  {
    return !dependsOn(variable);
  }

  /**
   * @return true if this node does not have any subnodes
   */
  public abstract boolean isLeaf();

  public final boolean isLiteralConstant()
  {
    return this instanceof LiteralConstantNode;
  }

  public boolean isNegOne()
  {
    return "-1".equals(toString());

  }
  
  public boolean isOne()
  {
    return "1".equals(toString());
  }

  public boolean isPossiblyNegative()
  {
    return false;
  }

  public abstract boolean isScalar();

  public boolean isSquareRoot()
  {
    return false;
  }

  public boolean isVariable()
  {
    return false;
  }

  public boolean isVariableNamed(String variable)
  {
    return isVariable() && asVariable().isNamed(variable);
  }

  public boolean isVariableSquared(VariableNode<D, R, F> variable)
  {
    return false;
  }

  public boolean isZero()
  {
    return "0".equals(toString());
  }

  protected void loadBitsOntoStack(MethodVisitor mv)
  {
    if (expression.insideInitializer)
    {
      mv.visitLdcInsn(128);
    }
    else
    {
      loadBitsParameterOntoStack(mv);
    }
  }

  public MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getFieldFromThis(mv,
                            expression.className,
                            fieldName,
                            type);
  }

  public Node<D, R, F> log()
  {
    return apply("log");
  }

  public Node<D, R, F> mul(int i)
  {
    return mul(expression.newLiteralConstant(i));
  }

  public <N extends Node<D, R, F>> N mul(Node<D, R, F> multiplicand)
  {
    return (N) new MultiplicationNode<>(expression,
                                        this,
                                        multiplicand);
  }

  public <N extends Node<D, R, F>> N neg()
  {
    return (N) new NegationNode<>(expression,
                                  this);
  }

  public LiteralConstantNode<D, R, F> negativeOne()
  {
    return expression.newLiteralConstant(-1);
  }

  public LiteralConstantNode<D, R, F> one()
  {
    return expression.newLiteralConstant(1);
  }

  public Node<D, R, F> pow(int i)
  {
    return pow(expression.newLiteralConstant(i));
  }

  public <N extends Node<D, R, F>> N pow(Node<D, R, F> exponent)
  {
    return (N) new ExponentiationNode<>(expression,
                                        this,
                                        exponent);
  }

  public Node<D, R, F> pow(String exponent)
  {
    return new LiteralConstantNode<>(expression,
                                     exponent);
  }

  public Node<D, R, F> sec()
  {
    return apply("sec");
  }

  public Node<D, R, F> simplify()
  {
    return this;
  }

  public Node<D, R, F> arcsinh()
  {
    return apply("arcsinh");
  }

  public Node<D, R, F> sin()
  {
    return apply("sin");
  }

  public Node<D, R, F> sinh()
  {
    return apply("sinh");
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression);

  public Node<D, R, F> sqrt()
  {
    return apply("sqrt");
  }

  public Node<D, R, F> sub(int i)
  {
    return sub(expression.newLiteralConstant(i));
  }

  public <N extends Node<D, R, F>> N sub(Node<D, R, F> subtrahend)
  {
    return (N) new SubtractionNode<>(expression,
                                     this,
                                     subtrahend);
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg);

  public abstract char symbol();

  public Node<D, R, F> tan()
  {
    return apply("tan");
  }

  public Node<D, R, F> tanh()
  {
    return apply("tanh");
  }

  public LiteralConstantNode<D, R, F> three()
  {
    return expression.newLiteralConstant(3);
  }

  public LiteralConstantNode<D, R, F> two()
  {
    return expression.newLiteralConstant(2);
  }

  public boolean loadOutput(MethodVisitor mv, Class<?> resultType)
  {
    try
    {
      if (isResult)
      {
        // When isResult=true, the result parameter is already on the stack as the target
        // Just cast it to the correct type - don't call generateSetResultInvocation
        Compiler.cast(loadResultParameter(mv),
                      resultType);
        fieldName = "result";
      }
      else
      {
        if (fieldName == null)
        {
          fieldName = expression.allocateIntermediateVariable(mv,
                                                              resultType);
        }
        return true;
      }
      return false;
    }
    finally
    {
      expression.generatedNodes.put(this,
                                    fieldName);
    }
  }

  /**
   * 
   * @return the type that this node leaves on the stack when
   *         this{@link #generate(MethodVisitor, Class)} is called
   */
  public abstract <C> Class<? extends C> type();

  /**
   * 
   * @return the string that represents this node in {@link Latex} format
   */
  public abstract String typeset();

  public LiteralConstantNode<D, R, F> π()
  {
    return expression.newLiteralConstant("π");
  }

  public LiteralConstantNode<D, R, F> zero()
  {
    return expression.newLiteralConstant(0);
  }

  public boolean isFunction()
  {
    return this instanceof FunctionNode;
  }

  public boolean isNegativeInfinity()
  {
    return "-∞".equals(toString());
  }

  public boolean isPositiveInfinity()
  {
    return "∞".equals(toString());
  }

  public Node<D, R, F> cloneNode()
  {
    return spliceInto(expression);
  }

  protected boolean containsDeltaFunction()
  {
    boolean does[] = new boolean[]
    { false };

    accept(node ->
    {
      if (node.isFunction() && node.asFunction().is("δ"))
      {
        does[0] = true;
      }
    });
    return does[0];
  }

  

}
