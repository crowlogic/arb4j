package arb.expressions.nodes.nary;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * Parse represent and generate bytecodes for the sum mod 2 operator where the
 * syntax is ⨊f(k){k=a…b} and the characters between the ⨊ and { characters are
 * compiled as a sub-expression as a function from the {@link Integer} index
 * {@link Variable} to whatever type is output by default or requested by
 * whatever is requesting its generation. <br>
 * <br>
 * <i><i>A notable feature of the modulo 2 operation is that if n mod 2 = 1 then n is an
 * odd number otherwise n is an even number</i><br>
 * 
 * 
 * @param <D> domain
 * @param <R> range
 * @param <F> {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ModuloSum<D, R, F extends Function<D, R>> extends
                      NAryOperation<D, R, F>
{

  public ModuloSum(Expression<D, R, F> expression, String identity, String prefix, String operation, String symbol)
  {
    super(expression,
          identity,
          prefix,
          operation,
          symbol);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    super.generate(mv, resultType);
    assert false : String.format("TODO: apply modulo %d operation", mod);
    return mv;
  }

  int mod;

  public ModuloSum(Expression<D, R, F> expression, String symbol, int mod)
  {
    super(expression,
          "additiveIdentity",
          "sum",
          "add",
          symbol);
    assert mod > 0 : "modulus must be >0 but it was attempting to be " + mod;
    this.mod = mod;
  }

}