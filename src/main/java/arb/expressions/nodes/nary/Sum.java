package arb.expressions.nodes.nary;

import static arb.utensils.Utensils.getMethodDescriptor;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Parse represent and generate bytecodes for the sum operator where the
 * syntax is ∑f(k){k=a…b} and the characters between the Π and { characters are
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
public class Sum<D, R, F extends Function<D, R>> extends
                NAryOperation<D, R, F>
{

  public Sum(Expression<D, R, F> expression)
  {
    super(expression);
  }

  @Override
  public void initializeResultVariable(MethodVisitor mv, Class<?> resultType)
  {
    resultVariable = expression.reserveIntermediateVariable(mv, "∑", resultType);
    invokeMethod(mv, resultType, "additiveIdentity", getMethodDescriptor(resultType), false);
    pop(mv);
  }

  @Override
  public MethodVisitor operate(MethodVisitor mv)
  {
    addFactor(mv);
    return mv;
  }

  public void addFactor(MethodVisitor mv)
  {
    invokeMethod(mv, generatedType, "add", getMethodDescriptor(generatedType, generatedType, int.class), false);
  }

}
