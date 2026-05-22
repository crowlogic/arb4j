import arb.Real;
import arb.Complex;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.complex.ComplexFunction;

/**
 * Default arb4j smoke: exercises native arb arithmetic, the expression
 * compiler (Unicode-rich source → JVM bytecode), and a non-trivial
 * functional (the Riccati–Müntz–Padé tanh oracle). Prints PASS/FAIL lines;
 * exits non-zero if any check fails.
 */
public class Smoke
{
  static int failures = 0;

  static void check(String what, double got, double want, double tol)
  {
    boolean ok = Math.abs(got - want) <= tol;
    System.out.printf("%s %s: got=%.15g want=%.15g%n", ok ? "PASS" : "FAIL", what, got, want);
    if (!ok) failures++;
  }

  public static void main(String[] args)
  {
    int bits = 128;

    // 1. Native arb arithmetic.
    try (Real a = new Real(); Real b = new Real(); Real r = new Real())
    {
      a.set("2", bits); b.set("3", bits);
      a.add(b, bits, r);
      check("Real 2+3", r.doubleValue(), 5.0, 1e-30);
    }

    // 2. Expression compiler: Unicode body → bytecode → evaluate.
    RealFunction f = RealFunction.express("x➔x^2+1");
    check("express x²+1 at 3", f.eval(3), 10.0, 1e-30);

    // 3. Built-in special function via expression compiler.
    RealNullaryFunction tanh1 = RealNullaryFunction.express("tanh(1)");
    Real tanhVal = new Real();
    tanh1.evaluate(bits, tanhVal);
    check("tanh(1)", tanhVal.doubleValue(), 0.7615941559557649, 1e-12);

    // 4. Riccati–Müntz–Padé functional: y'=1-y², y(0)=0 → tanh.
    try (RiccatiMuntzPadeFunctional eq =
           new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "1", "0", "-1"))
    {
      Complex zero = new Complex(); zero.set("0", bits);
      ComplexFunction approx = eq.evaluate(zero, 1, bits, null);
      Complex t = new Complex(); t.set("1", bits);
      Complex y = new Complex();
      approx.evaluate(t, 1, bits, y);
      check("RiccatiMuntzPade tanh(1)", y.getReal().doubleValue(), 0.7615941559557649, 1e-12);
    }

    System.out.println(failures == 0 ? "SMOKE OK" : "SMOKE FAILED (" + failures + ")");
    System.exit(failures == 0 ? 0 : 1);
  }
}
