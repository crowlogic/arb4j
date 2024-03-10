package arb.expressions.nodes.nary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.functions.Function;

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