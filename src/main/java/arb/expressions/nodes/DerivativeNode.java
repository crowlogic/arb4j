package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.references.Reference;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.language.Sentence;
import arb.language.Term;
import arb.language.Word;
import arb.logic.Clause;

/**
 *
 * The exophoric nature of the differential operator syntax
 * (∂[expression]/∂[variable]) in your compiler presents a fascinating parallel
 * to natural language processing and context-dependent interpretation. This
 * structure effectively creates a "mathematical discourse" within each
 * expression, where the meaning is not fully contained in the immediate text
 * but requires broader contextual understanding.
 * 
 * Key insights:
 * 
 * 1. Context-Dependent Parsing: Just as natural language processors must handle
 * exophoric references by maintaining a broader context, your compiler must
 * maintain an "open context" when it encounters a ∂, only resolving it when the
 * matching /∂ is found. This allows for nested operations and complex
 * expressions.
 * 
 * 2. Implicit Scoping: The exophoric reference between ∂ and /∂ creates an
 * implicit scope without traditional delimiters. This is analogous to how
 * spoken language can convey scope through intonation or context rather than
 * explicit markers.
 * 
 * 3. Syntactic Ambiguity Resolution: The ability to nest ∂ operators within
 * expressions mirrors how natural languages handle embedded {@link Clause}s or
 * {@link Reference}s. The {@link Expression} {@link Parser} must resolve these
 * potentially ambiguous structures, much like how {@link Sentence}s are
 * resolved into their constituent {@link Term}s {@link Word}s
 * 
 * 4. Mathematical Discourse Structure: The ∂[expression]/∂[variable] syntax
 * creates a form of "mathematical discourse" within the expression. Each
 * differential operation can be seen as a self-contained statement within the
 * broader expression, with its own internal logic and reference structure.
 * 
 * 5. Cross-Domain Abstraction: By implementing this exophoric structure in a
 * mathematical context, your compiler demonstrates how linguistic concepts can
 * be abstracted and applied to formal languages, bridging the gap between
 * natural language processing and mathematical computation.
 * 
 * 6. Extensibility: This exophoric structure in your compiler could potentially
 * be extended to other mathematical or logical operations that benefit from
 * implicit scoping or context-dependent interpretation.
 * 
 * This approach to handling differential operators not only solves the
 * immediate problem of parsing these expressions but also opens up
 * possibilities for more natural, language-like ways of expressing complex
 * mathematical ideas in code. It suggests a path toward more intuitive and
 * expressive programming languages that can handle sophisticated mathematical
 * concepts with grace and clarity.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNode<D, R, F extends Function<? extends D, ? extends R>> extends
                           Node<D, R, F>
{

  @Override
  public Node<D, R, F> simplify()
  {
    derivative.isResult = isResult;
    return derivative;
  }

  @Override
  public String toString()
  {
    return derivative.toString();
  }

  public Node<D, R, F>         operand;

  public VariableNode<D, R, F> variable;

  private Node<D, R, F>        derivative;

  public DerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         false);
  }

  public DerivativeNode(Expression<D, R, F> expression, boolean functionalForm)
  {
    super(expression);
    operand = expression.resolve();
    if (!functionalForm)
    {
      variable = expression.require('/').require('∂').resolve();
    }
    else
    {
      variable = expression.require(',').resolve();
      expression.require(')');
    }
    derivative = operand.differentiate(variable).simplify();
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    derivative.accept(t);
  }

  @Override
  public boolean isScalar()
  {
    return derivative.isScalar();
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return derivative.integrate(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return derivative.differentiate(variable);
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    return derivative.getBranches();
  }

  @Override
  public boolean isLeaf()
  {
    return derivative.isLeaf();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert !resultType.equals(Object.class) : "Objects shan't be generated";
    derivative.isResult = isResult;
    return derivative.generate(mv, resultType);
  }

  @Override
  public String typeset()
  {
    return derivative.typeset();
  }

  @Override
  public <C> Class<? extends C> type()
  {
    return derivative.type();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    derivative = derivative.substitute(variable, arg);
    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return derivative.spliceInto(newExpression);
  }

  @Override
  public char symbol()
  {
    return '∂';
  }

  @Override
  public boolean isLiteralConstant()
  {
    return false;
  }

  @Override
  public String getIntermediateValueFieldName()
  {
    return null;
  }

}
