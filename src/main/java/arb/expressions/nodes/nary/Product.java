package arb.expressions.nodes.nary;

import static arb.utensils.Utensils.getMethodDescriptor;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
    super(expression,
          "multiplicativeIdentity",
          "product",
          "mul");
  }


}
