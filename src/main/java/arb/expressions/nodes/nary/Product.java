package arb.expressions.nodes.nary;

import static java.lang.String.format;
import static java.lang.System.out;

import org.objectweb.asm.*;

import arb.Integer;
import arb.Real;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  public Node<D, R, F>     endIndex;

  public Node<D, R, F>     factor;

  public Variable<D, R, F> index;

  public Node<D, R, F>     startIndex;

  public Product(Expression<D, R, F> expression, Node<D, R, F> node)
  {
    super(expression);
    factor = node;
  }

  public Product<D, R, F> evaluateRangeSpecification()
  {
    String rem = expression.remaining();
    if (!expression.nextCharacterIs('{'))
    {
      throw new ExpressionCompilerException(format(MISSING_OPENING_CURLY_BRACE, expression.character, rem));
    }
    var indexVar = expression.determine();
    if (!(indexVar instanceof Variable<D, R, F>))
    {
      throw new ExpressionCompilerException(format(NONVARIABLE_MSG, indexVar, rem));
    }
    index = (Variable<D, R, F>) indexVar;
    if (!expression.nextCharacterIs('='))
    {
      throw new ExpressionCompilerException(format(MISSING_EQUALS,
                                                   expression.character,
                                                   expression.position,
                                                   expression));
    }
    startIndex = expression.determine();
    if (!expression.nextCharacterIs('…'))
    {
      throw new ExpressionCompilerException(format(MISSING_ELLIPSIS,
                                                   expression.character,
                                                   expression.position,
                                                   expression));

    }
    endIndex = expression.determine();
    if (!expression.nextCharacterIs('}'))
    {
      throw new ExpressionCompilerException(format(MISSING_CLOSING_CURLY_BRACE, rem));
    }

    return this;
  }

  private ProductGenerator productGenerator = new ProductGenerator(Type.getInternalName(expression.functionClass))
  {

    @Override
    public void evaluateFactor(MethodVisitor methodVisitor)
    {
      out.format( "Evaluate %s\n", factor);
      factor.generate(null, methodVisitor, type());
    }

    @Override
    public String getIndexFieldName()
    {
      assert index.reference.index == null : "the index field cannot itself be indexed";
      return index.reference.name;
    }

    @Override
    void loadResultingProductVariable(MethodVisitor methodVisitor)
    {
      loadFieldFromThis(methodVisitor, intermediateProductResultVariable, type());
    }
  };

  public Product(Expression<D, R, F> expression)
  {

    super(expression);
    {

      expression.context.registerVariable(productGenerator.getIndexFieldName(), new Integer());
    }

  }

  private String intermediateProductResultVariable;

  @Override
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {
    intermediateProductResultVariable = expression.reserveIntermediateVariable(mv, type());
    System.out.println( "generateProduct: expr=" + expression );

    productGenerator.generateProduct(new MethodVisitInterceptor(Opcodes.ASM9,
                                                                mv));
    return mv;

  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {

    return mv;
  }

  @Override
  public String toString()
  {
    return typeset();
  }

  @Override
  public Class<Real> type()
  {
    return Real.class;
  }

  private static final String MISSING_CLOSING_CURLY_BRACE = "Expected the closing curly brace } of the range specification {k=a..b} in Πf(k){k=a..b}"
                + " to follow the ending index parameter b, instead got '%s' with remaining";
  private static final String MISSING_ELLIPSIS            = "Expected an … character after the start index a in the "
                + "index specification {k=a..b} in ∏f(k){k=a..b} but instead got '%c' at position %d in %s";
  private static final String MISSING_EQUALS              = "Expected an = character after the index variable specification {k=a..b} "
                + "in ∏f(k){k=a..b} but instead got '%c' at position %d in %s";
  private static final String MISSING_OPENING_CURLY_BRACE = "Expected the opening curly brace { of the product range specification {k=a..b} in Πf(k){k=a..b}"
                + " to follow the operand definition, instead got '%c' with remaining %s";

  private static final String NONVARIABLE_MSG             = "Expected the first element of the product range specification"
                + " {...} in ∏f(k){k=a…b} to be a Variable but got %s with remaining %s";

  private String              indexVariableName;

  @Override
  public String typeset()
  {
    return String.format("\\prod_{%s = %s}^{%s}{%s}",
                         index.typeset(),
                         startIndex.typeset(),
                         endIndex.typeset(),
                         factor.typeset());
  }
}
