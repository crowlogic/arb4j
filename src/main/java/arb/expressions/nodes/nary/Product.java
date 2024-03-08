package arb.expressions.nodes.nary;

import static arb.utensils.Utensils.getMethodDescriptor;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Parse represent and generate bytecodes for the product operator where the
 * syntax is ∏f(k){k=a…b} and the characters between the Π and { characters are
 * compiled as a sub-expression as a function from the {@link Integer} index
 * variable to whatever type is output by default or requested by whatever is
 * requesting its generation
 * 
 * @param <D> domain
 * @param <R> range
 * @param <F> {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Product<D, R, F extends Function<D, R>> extends
                    NAryOperation<D, R, F>
{

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    this.factor   = parseFactorExpression();

    functionClass = expression.className;
    assert functionClass != null : "functionClass is null";
    generatedType = (RealPolynomial.class.equals(expression.rangeType) ? Real.class : expression.rangeType);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (expression.traceGenerator)
    {
      System.out.format("Product.generate(resultType=%s, this=%s)\n\n", resultType, this);
    }
    resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class : resultType);

    assignFieldNames(resultType);

    prepareIndexVariable();

    generateFactorClass(resultType);

    propagateInputToFactorClass(mv);

    initializeResultVariable(mv, resultType);

    setIndexToTheStartIndex(mv);

    generateEndingIndex(mv);

    designateLabel(mv, beginningOfTheLoop, expression.isRealNumberOnTopOfTheStack());

    generateInnerLoop(mv);

    compareIndexToEndIndex(mv);

    jumpToIfLessThanOrEquals(mv, beginningOfTheLoop);

    assignResult(mv, resultType);

    return mv;

  }

  @Override
  public void initializeResultVariable(MethodVisitor mv, Class<?> resultType)
  {
    resultVariable = expression.reserveIntermediateVariable(mv, "product", resultType);
    invokeMethod(mv, resultType, "multiplicativeIdentity", getMethodDescriptor(resultType), false);
    pop(mv);
  }

  @Override
  public MethodVisitor operate(MethodVisitor mv)
  {
    multiplyFactor(mv);
    return mv;
  }

  public void multiplyFactor(MethodVisitor mv)
  {
    invokeMethod(mv, generatedType, "mul", getMethodDescriptor(generatedType, generatedType, int.class), false);
  }

}
