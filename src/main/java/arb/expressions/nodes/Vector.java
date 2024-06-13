package arb.expressions.nodes;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static java.util.stream.Collectors.joining;
import static org.objectweb.asm.Opcodes.AASTORE;
import static org.objectweb.asm.Opcodes.ANEWARRAY;
import static org.objectweb.asm.Opcodes.BIPUSH;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import java.util.stream.Collectors;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Vector<D, R, F extends Function<? extends D, ? extends R>>
                   extends
                   Node<D, R, F>
{

  @Override
  public boolean dependsOn(Variable<D, R, F> variable)
  {
    return elements.stream().anyMatch(node -> node.dependsOn(variable));
  }

  @Override
  public String toString()
  {
    return elements.stream().map(Node::typeset).collect(Collectors.joining(",", "[", "]"));
  }

  public ArrayList<Node<D, R, F>> elements = new ArrayList<>();

  public Vector(Expression<D, R, F> expression)
  {
    super(expression);
    do
    {
      var e = expression.resolve();
      if (e != null)
      {
        elements.add(e);
      }
    }
    while (expression.nextCharacterIs(','));
    expression.require(']');
  }

  @Override
  public Node<D, R, F> integral(Variable<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ArrayList<Node<D, R, F>> getBranches()
  {
    return elements;
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    int dimensions = elements.size();
    mv.visitIntInsn(BIPUSH, dimensions);
    var scalarType = Compiler.scalarType(resultType);
    mv.visitTypeInsn(ANEWARRAY, Type.getInternalName(scalarType));

    AtomicInteger i = new AtomicInteger(0);
    elements.forEach(element ->
    {
      int index = i.getAndIncrement();
      printIfTraceGenerationEnabled(i, element);
      duplicateTopOfTheStack(mv);
      mv.visitIntInsn(BIPUSH, index);
      element.generate(scalarType, mv);
      convertTypeIfNecessary(mv, scalarType, element, index);
      mv.visitInsn(AASTORE);
    });

    if (isResult)
    {
      expression.generateSetResultInvocation(mv, scalarType.arrayType());
    }
    else
    {
      expression.allocateIntermediateVariable(mv, "v", scalarType);
      Compiler.swap(mv);
      Compiler.invokeSetMethod(mv, scalarType.arrayType(), scalarType);
    }

    return mv;
  }

  public void assertResultTypeAndGeneratedTypeEquality(Class<?> resultType, int index, Node<D, R, F> element)
  {
    assert resultType.equals(element.generatedType) : String.format("%s != %s at index %s",
                                                                    resultType,
                                                                    element.getGeneratedType(),
                                                                    index);
  }

  public void convertTypeIfNecessary(MethodVisitor mv, Class<?> resultType, Node<D, R, F> element, int index)
  {
    assert resultType != null : "result type cannot be null";
    Class<?> generatedElementType = element.getGeneratedType();
    if (generatedElementType == null)
    {
      generatedElementType = element.generatedType = resultType;
    }
    if (!resultType.equals(generatedElementType))
    {
      if (Expression.trace)
      {
        System.err.format("index %d: Converting from type %s to %s\n", index, generatedElementType, resultType);
      }
      element.generateCastTo(mv, resultType);
    }
  }

  public void printIfTraceGenerationEnabled(AtomicInteger i, Node<D, R, F> element)
  {
    if (Expression.trace)
    {
      System.err.format("Vector(#%s).generating %s-th element of node %s whose type is %s:  %s\n",
                        System.identityHashCode(this),
                        i.get(),
                        element.getClass(),
                        element.type(),
                        element);
    }
  }

  @Override
  public boolean isReusable()
  {
    assert false : "TODO: Auto-generated method stub";
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String typeset()
  {
    return elements.stream().map(Node::typeset).collect(joining(",", "[", "]"));
  }

  @Override
  public Class<? extends R> type()
  {
    return expression.coDomainType;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return elements.size() == 1;
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    elements.forEach(expr -> expr.substitute(variable, arg));
    return this;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var vec = new Vector<E, S, G>(newExpression);
    vec.elements = new ArrayList<Node<E, S, G>>(elements.size());
    for (int i = 0; i < elements.size(); i++)
    {
      vec.elements.set(i, elements.get(i).spliceInto(newExpression));
    }
    return vec;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    elements.forEach(t);
    t.accept(this);
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean isScalar()
  {
    return false;
  }

  @Override
  public char symbol()
  {
    return '→';
  }

  @Override
  public boolean isConstant()
  {
    return elements.stream().allMatch(Node::isConstant);
  }

}
