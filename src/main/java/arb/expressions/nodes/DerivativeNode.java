package arb.expressions.nodes;

import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadOrderParameter;
import static arb.expressions.Compiler.loadThisOntoStack;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.functions.Function;

/**
 *
 * ∂f(x)/∂x
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNode<D, R, F extends Function<? extends D, ? extends R>> extends
                           Node<D, R, F>
{
  @Override
  public boolean isZero()
  {
    return operand.isConstant() || operand.isIndependentOf(expression.getIndependentVariable());
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(operand, variable);
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
    DerivativeNode<?, ?, ?> other = (DerivativeNode<?, ?, ?>) obj;
    return Objects.equals(operand, other.operand) && Objects.equals(variable, other.variable);
  }

  @Override
  public Node<D, R, F> simplify()
  {
    if (symbolicOrder)
    {
      return this;
    }
    if (getDifferentiatedNode() != null)
    {
      return differentiatedNode.simplify();
    }
    return this;
  }

  @Override
  public String toString()
  {
    if (symbolicOrder)
    {
      return String.format("diff(%s,%s^(%s))", operand, variable, order);
    }
    getDifferentiatedNode();
    if (differentiatedNode != null)
    {

      return differentiatedNode.toString();
    }
    else
    {
      assert variable != null : "variable is null";
      if (order != null)
      {
        return String.format("diff(%s,%s^(%s))", operand, variable, order);
      }
      else
      {
        return String.format("diff(%s,%s)", operand, variable);
      }
    }
  }

  public Node<D, R, F>               operand;

  public final VariableNode<D, R, F> variable;

  private Node<D, R, F>              differentiatedNode;

  private Node<D, R, F>              order;

  public DerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         false);
  }

  public DerivativeNode(Expression<D, R, F> expression, Node<D, R, F> operand)
  {
    super(expression);
    assert operand != null : "variable is null";
    this.operand = operand;
    operand.parent = this;
    variable     = expression.getIndependentVariable();
  }

  public DerivativeNode(Expression<D, R, F> expression, boolean functionForm)
  {
    super(expression);
    operand        = expression.resolve();
    operand.parent = this;

    if (functionForm)
    {
      expression.require(',');
    }
    else
    {
      expression.require("/∂");
    }

    var baseVariableNode = expression.resolve();
    if (baseVariableNode.isVariable())
    {
      variable = baseVariableNode.asVariable();

    }
    else if (baseVariableNode instanceof ExponentiationNode<D, R, F> expNode)
    {
      if (!expNode.left.isVariable())
      {
        throwSyntaxError("the base of " + this + " must be a variable");
      }
      variable = expNode.left.asVariable();
      order    = expNode.right;
      if (order.type() != arb.Integer.class)
      {
        throwSyntaxError("the order of differentiation node must generate an Integer but got order=" + order + " of type " + order.type());
      }

    }
    else
    {
      throwSyntaxError("the variable must be specified like variable^power");
      variable = null;
    }
    if (functionForm)
    {
      expression.require(')');
    }
    symbolicOrder = order != null && order.nodeStream().anyMatch(Node::isVariable);
    if (!symbolicOrder)
    {
      getDifferentiatedNode();
    }

  }

  private boolean symbolicOrder;
  private String  operandFunctionFieldName;

  private int getIntegerOrder()
  {
    if (order == null)
    {
      return 1;
    }
    return order.evaluate(arb.Integer.class, 128, new arb.Integer()).getSignedValue();
  }

  private Node<D, R, F> getDifferentiatedNode()
  {
    if (differentiatedNode == null)
    {
      differentiatedNode = operand;
      int n = getIntegerOrder();
      for (int i = 0; i < n; i++)
      {
        differentiatedNode = differentiatedNode.differentiate(variable);
      }
      differentiatedNode = differentiatedNode.simplify();
    }
    return differentiatedNode;

  }

  protected void throwSyntaxError(String string)
  {
    throw new CompilerException("the format for the nth derivative is diff(f(t),t^n) where n is an integer that is the order of differentiation and t is the variable being differentiated with respect to but instead of t^n this is "
                                + this
                                + ":"
                                + string);

  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    if (symbolicOrder)
    {
      operand.accept(t);
      if (order != null) order.accept(t);
      t.accept(this);
      return;
    }
    getDifferentiatedNode().accept(t);
  }

  @Override
  public boolean isScalar()
  {
    if (symbolicOrder) return operand.isScalar();
    return getDifferentiatedNode().isScalar();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    if (symbolicOrder)
    {
      throw new UnsupportedOperationException("integral of symbolic-order derivative not supported");
    }
    // Fundamental theorem of calculus: ∫ (dg/dv) dv = g when the integration
    // variable is the differentiation variable — one antiderivative is exactly
    // the un-differentiated operand, computed without any closed-form
    // antiderivative of the differentiated expression.
    if (order == null && this.variable != null && this.variable.equals(variable))
    {
      return operand;
    }
    return getDifferentiatedNode().integral(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    if (symbolicOrder)
    {
      throw new UnsupportedOperationException("differentiation of symbolic-order derivative not supported");
    }
    return getDifferentiatedNode().differentiate(variable);
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    if (symbolicOrder) return order == null ? List.of(operand) : List.of(operand, order);
    return differentiatedNode.getBranches();
  }

  @Override
  public boolean isAtomic()
  {
    if (symbolicOrder) return false;
    return getDifferentiatedNode().isAtomic();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert !resultType.equals(Object.class) : "Objects shan't be generated";
    if (symbolicOrder)
    {
      return generateSymbolicOrder(mv, resultType);
    }
    getDifferentiatedNode().isRootNode = isRootNode;
    return getDifferentiatedNode().generate(mv, resultType);
  }

  private MethodVisitor generateSymbolicOrder(MethodVisitor mv, Class<?> resultType)
  {
    if (operandFunctionFieldName == null)
    {
      operandFunctionFieldName = expression.registerIntermediateVariable("__df__" + System.identityHashCode(this),
                                                                         Function.class,
                                                                         false);
    }

    String internalName       = expression.internalName();
    String functionDescriptor = Function.class.descriptorString();

    Label  alreadyBuilt       = new Label();
    expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, functionDescriptor);
    mv.visitJumpInsn(Opcodes.IFNONNULL, alreadyBuilt);

    mv.visitLdcInsn(Type.getType(expression.domainType));
    mv.visitLdcInsn(Type.getType(expression.coDomainType));
    mv.visitLdcInsn(Type.getType(expression.functionClass));
    mv.visitLdcInsn("__df__" + System.identityHashCode(this));
    mv.visitLdcInsn(operand.toString());
    if (expression.getContext() != null)
    {
      loadThisOntoStack(mv);
      mv.visitFieldInsn(Opcodes.GETFIELD, internalName, "context", Context.class.descriptorString());
      Compiler.invokeStaticMethod(mv,
                                  Function.class,
                                  "express",
                                  Function.class,
                                  Class.class,
                                  Class.class,
                                  Class.class,
                                  String.class,
                                  String.class,
                                  Context.class);
    }
    else
    {
      Compiler.invokeStaticMethod(mv,
                                  Function.class,
                                  "express",
                                  Function.class,
                                  Class.class,
                                  Class.class,
                                  Class.class,
                                  String.class,
                                  String.class);
    }
    loadThisOntoStack(mv);
    mv.visitInsn(Opcodes.SWAP);
    mv.visitFieldInsn(Opcodes.PUTFIELD, internalName, operandFunctionFieldName, functionDescriptor);

    Compiler.designateLabel(mv, alreadyBuilt);

    expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, functionDescriptor);

    order.generate(mv, arb.Integer.class);
    Compiler.generateVirtualMethodInvocation(mv, arb.Integer.class, "getSignedValue", int.class);

    mv.visitMethodInsn(Opcodes.INVOKEINTERFACE,
                       Type.getInternalName(Function.class),
                       "derivative",
                       "(I)L" + Type.getInternalName(Function.class) + ";",
                       true);

    variable.generate(mv, expression.domainType);
    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);
    loadOutputVariableOntoStack(mv, resultType);

    mv.visitMethodInsn(Opcodes.INVOKEINTERFACE,
                       Type.getInternalName(Function.class),
                       "evaluate",
                       Compiler.evaluationMethodDescriptor,
                       true);
    Compiler.cast(mv, resultType);
    generatedType = resultType;
    return mv;
  }

  @Override
  public String typeset()
  {
    if (symbolicOrder) return String.format("\\partial_{%s}^{%s} %s", variable, order, operand.typeset());
    return getDifferentiatedNode().typeset();
  }

  @Override
  public <C> Class<? extends C> type()
  {
    if (symbolicOrder) return operand.type();
    return getDifferentiatedNode().type();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    if (symbolicOrder)
    {
      operand = operand.substitute(variable, arg);
      if (order != null) order = order.substitute(variable, arg);
      return this;
    }
    return differentiatedNode = getDifferentiatedNode().substitute(variable, arg);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    if (symbolicOrder)
    {
      DerivativeNode<E, S, G> splicedNode = new DerivativeNode<>(newExpression,
                                                                 operand.spliceInto(newExpression));
      splicedNode.symbolicOrder = true;
      splicedNode.order = order == null ? null : order.spliceInto(newExpression);
      return splicedNode;
    }
    return getDifferentiatedNode().spliceInto(newExpression);
  }

  @Override
  public char symbol()
  {
    return '∂';
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    if (symbolicOrder)
    {
      return operand.dependsOn(variable) || (order != null && order.dependsOn(variable));
    }
    return getDifferentiatedNode().dependsOn(variable);
  }

}
