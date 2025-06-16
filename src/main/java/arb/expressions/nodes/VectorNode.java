package arb.expressions.nodes;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
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
 * Vector/array syntax: [expr1,expr2,...]
 * 
 * @param <D>
 * @param <R>
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class VectorNode<D, R, F extends Function<? extends D, ? extends R>> extends
                       Node<D, R, F>
{

  @Override
  public int dim()
  {
    return elements.size();
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return elements.stream().anyMatch(node -> node.dependsOn(variable));
  }

  @Override
  public String toString()
  {
    return elements.stream().map(Node::toString).collect(Collectors.joining(",", "[", "]"));
  }

  public ArrayList<Node<D, R, F>> elements = new ArrayList<>();

  public VectorNode(Expression<D, R, F> expression)
  {
    this(expression,
         true);
  }

  public VectorNode(Expression<D, R, F> expression, boolean parse)
  {
    super(expression);
    if (parse)
    {
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
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
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
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
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
      element.generate(mv, scalarType);
      convertTypeIfNecessary(mv, scalarType, element, index);
      mv.visitInsn(AASTORE);
    });

    var arrayType = scalarType.arrayType();
    
    if (isResult)
    {
      expression.generateSetResultInvocation(mv, arrayType);
    }
    else
    {
      fieldName = expression.allocateIntermediateVariable(mv, "v", scalarType);
      Compiler.swap(mv);
      Compiler.invokeSetMethod(mv, arrayType, scalarType);
    }
    generatedType = scalarType;
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
  public String typeset()
  {
    return elements.stream().map(Node::typeset).collect(Collectors.joining(",", "\\left[", "\\right]"));
  }

  @Override
  public Class<? extends R> type()
  {
    return expression.coDomainType;
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
    var vec = new VectorNode<E, S, G>(newExpression,
                                      false);
    vec.elements = new ArrayList<Node<E, S, G>>(elements.size());
    for (int i = 0; i < elements.size(); i++)
    {
      vec.elements.add(i, elements.get(i).spliceInto(newExpression));
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
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
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



}
