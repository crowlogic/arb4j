package arb.expressions;

import arb.Complex;
import arb.ComplexMatrix;
import arb.Integer;
import arb.functions.integer.ComplexSequence;
import junit.framework.TestCase;

/**
 * Pin the compiled-expression form of the Müntz–Padé numerator
 * back-substitution
 *
 * <pre>
 *   p_n = a_n + Σ_{j=1..n-1} q_j · a_{n-j},   n = 1..M
 * </pre>
 *
 * with q exposed to the expression as the column-vector view of an M×1
 * {@link ComplexMatrix} via the bracket-subscript syntax {@code q[j]}.
 */
public class MuntzNumeratorBackSubstTest extends
                                         TestCase
{

  public static void testHandWorked()
  {
    int             bits = 128;

    // a_k = k via the expression language itself — no Java sequence wrapper.
    Context         ctx  = new Context();
    ComplexSequence a    = ComplexSequence.express("a", "k➔k", ctx);
    ctx.registerFunction("a", a);

    // q_1 = 10, q_2 = 100, q_3 = 1000 — column-1 matrix as a vector.
    try ( ComplexMatrix qMat = ComplexMatrix.newMatrix(3, 1))
    {
      qMat.setName("q");
      qMat.get(0, 0).set(10, 0);
      qMat.get(1, 0).set(100, 0);
      qMat.get(2, 0).set(1000, 0);
      ctx.registerVariable(qMat);

      ComplexSequence p = ComplexSequence.express("P", "n➔a(n)+sum(j➔q[j]·a(n-j){j=1..n-1})", ctx);

      // Expected:
      // p_1 = a_1 = 1
      // p_2 = a_2 + q_1·a_1 = 2 + 10·1 = 12
      // p_3 = a_3 + q_1·a_2 + q_2·a_1 = 3 + 10·2 + 100·1 = 123
      try ( Complex r  = new Complex();
            Integer n_ = new Integer())
      {
        p.evaluate(n_.set(1), 1, bits, r);
        assertEquals("p_1 real",
                     1.0,
                     r.getReal().doubleValue(),
                     1e-30);
        assertEquals("p_1 imag",
                     0.0,
                     r.getImag().doubleValue(),
                     1e-30);

        p.evaluate(n_.set(2), 1, bits, r);
        assertEquals("p_2 real",
                     12.0,
                     r.getReal().doubleValue(),
                     1e-30);

        p.evaluate(n_.set(3), 1, bits, r);
        assertEquals("p_3 real",
                     123.0,
                     r.getReal().doubleValue(),
                     1e-30);
      }
    }
  }
}
