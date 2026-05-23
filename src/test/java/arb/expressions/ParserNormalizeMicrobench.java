package arb.expressions;

import org.junit.Test;

/**
 * Microbench for {@link Parser#normalize(String)}. Not asserting timing —
 * just printing nanos so the optimization can be eyeballed.
 */
public class ParserNormalizeMicrobench
{
  @Test
  public void measure()
  {
    String[] samples = new String[] {
      "a:k\u2794v\u2794when(k=1,p(v)/\u0393(\u03bc+1),else,(\u0393((k-1)*\u03bc+1)/\u0393(k*\u03bc+1))*(q(v)*a(k-1)(v)+r(v)*c(k)(v)))",
      "f:n\u2794when(n=0,1,n=1,1,else,f(n-1)+f(n-2))",
      "n\u2794v\u2794when(k\u22642,0,else,\u2211j\u2794a(j)(v)*a(k-1-j)(v){j=1..k-2})",
      "D:Q()\u00b2 \u2212 4\u00b7P()\u00b7R()",
      "\u03c3:j\u2794k\u2794when(j=0,m(k),else,\u03c3(j-1)(k+1) - \u03b1(j-1)*\u03c3(j-1)(k) - \u03b2(j-1)*\u03c3(j-2)(k))",
      "f -> g(2*x) + h(y^3) ... etc",
      "P_n(x) = (1/(2^n * n!)) * d^n/dx^n[(x^2 - 1)^n]"
    };

    // Warmup
    for (int i = 0; i < 50_000; i++) {
      for (String s : samples) Parser.normalize(s);
    }

    // Measure
    int    iters = 200_000;
    long   t0    = System.nanoTime();
    String last  = null;
    for (int i = 0; i < iters; i++) {
      for (String s : samples) last = Parser.normalize(s);
    }
    long total = System.nanoTime() - t0;
    System.out.printf("Parser.normalize: %d iters \u00d7 %d samples = %d calls in %.2fms (%.0fns/call)%n",
      iters, samples.length, iters * samples.length, total / 1e6, (double) total / (iters * samples.length));
    if (last == null) throw new AssertionError();
  }
}
