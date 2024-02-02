package arb.expressions.nodes.nary;

import static java.lang.String.format;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;

import arb.Real;
import arb.RealPolynomial;
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
      throw new ExpressionCompilerException(format(MISSING_OPENING_CURLY_BRACE, rem));
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

  @Override
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {
    factor.generate(classVisitor, mv, RealPolynomial.class);
    return mv;
//    loadOutputVariableOntoStack(mv, expression, Real.class); // Prepare the stack for the result
//
//    Label loopStart = new Label();
//    Label afterLoop = new Label();
//    mv.visitLabel(loopStart);
//
//    // Generate start and end index values onto the stack
//    startIndex.generate(classVisitor, mv, Integer.class); // Load start index
//    endIndex.generate(classVisitor, mv, Integer.class); // Load end index
//
//    // Compare start index with end index
//    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
//    mv.visitJumpInsn(IFGE, afterLoop); // Exit loop if start index >= end index
//
//    // Apply the 'factor' within the loop
//    factor.generate(classVisitor, mv, Real.class); // Apply factor to the product
//
//    // Increment the index logic here
//    // Assuming an increment method or operation updates the index within the factor
//    // or elsewhere
//
//    mv.visitJumpInsn(GOTO, loopStart);
//    mv.visitLabel(afterLoop);
//
//    // Finalization code if needed
//
//    return mv; // Return MethodVisitor for potential further modifications
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  protected void loadOutputVariableOntoStack(MethodVisitor mv, Expression<D, R, F> expression, Class<?> resultType)
  {
    if (isReusable())
    {
      // Logic for direct reuse
    }
    else
    {
      // Reserve an intermediate variable if the result can't be reused
      expression.reserveIntermediateVariable(mv, resultType);
    }
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
