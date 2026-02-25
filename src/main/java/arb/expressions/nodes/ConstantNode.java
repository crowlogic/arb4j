package arb.expressions.nodes;

import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.ACC_FINAL;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Field;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Wraps a fully-constant subtree whose type is exact. The subtree's bytecode is
 * emitted into the generated class's {@code initialize()} method and the
 * evaluate path loads the precomputed field.
 *
 * {@link LiteralConstantNode} is a subclass handling parsed literal values.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ConstantNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         Node<D, R, F>
{
  public static final Logger    logger = LoggerFactory.getLogger(ConstantNode.class);

  protected final Node<D, R, F> constantSubtree;
  protected final Class<?>      valueType;

  public ConstantNode(Expression<D, R, F> expression, Node<D, R, F> constantSubtree)
  {
    super(expression);
    assert constantSubtree.isConstant() : constantSubtree + " is not constant";
    this.constantSubtree = constantSubtree;
    this.valueType       = constantSubtree.type();
    this.fieldName       = expression.getNextConstantFieldName(valueType);
    expression.registerFoldedConstant(this);
  }

  protected ConstantNode(Expression<D, R, F> expression)
  {
    super(expression);
    this.constantSubtree = null;
    this.valueType       = null;
  }

  @Override
  public boolean isConstant()
  {
    return true;
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean isScalar()
  {
    return true;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return false;
  }

  @Override
  public Class<?> type()
  {
    return valueType;
  }

  @SuppressWarnings("unchecked")
  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    return constantSubtree.evaluate(resultType, bits, result);
  }

  public ClassVisitor declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC
                  | ACC_FINAL, fieldName, valueType.descriptorString(), null, null);
    return classVisitor;
  }

  public MethodVisitor generateInitializer(MethodVisitor mv)
  {
    assert constantSubtree.isConstant() : constantSubtree
                                          + " is not constant at initializer generation time";
    expression.insideInitializer = true;
    constantSubtree.generate(mv, valueType);
    expression.setThisField(mv, fieldName, valueType);
    expression.insideInitializer = false;
    return mv;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert constantSubtree.isConstant() : constantSubtree
                                          + " is not constant at code generation time";
    generatedType = valueType;
    expression.loadFieldOntoStack(loadThisOntoStack(mv), fieldName, valueType.descriptorString());
    return mv;
  }

  @Override
  public Node<D, R, F> simplify()
  {
    return this;
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return expression.newConstant(0);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return mul(variable);
  }

  @Override
  public String typeset()
  {
    return constantSubtree.typeset();
  }

  @Override
  public String toString()
  {
    return constantSubtree.toString();
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of();
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new ConstantNode<>(newExpression,
                              constantSubtree.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    return this;
  }

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public char symbol()
  {
    return '#';
  }

  @Override
  public boolean isZero()
  {
    return constantSubtree.isZero();
  }

  @Override
  public boolean isOne()
  {
    return constantSubtree.isOne();
  }
}
