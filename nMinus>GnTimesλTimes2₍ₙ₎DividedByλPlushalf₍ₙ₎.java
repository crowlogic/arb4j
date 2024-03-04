import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.functions.Function;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;

public class nMinus>GnTimesλTimes2₍ₙ₎DividedByλPlushalf₍ₙ₎ implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1;
   public Real λ;
   public RealPolynomial r̅1;
   public Real ℝ1;
   public Real ℝ2;
   public RealPolynomial r̅2;
   public Real ℝ3;
   public Real ℝ4;
   public final G G;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }

      return (G.evaluate(in, order, bits, r̅1))
         .mul(λ.mul(c1, bits, ℝ1).risingFactorial(in, bits, ℝ2), bits, r̅2)
         .div(λ.add(RealConstants.half, bits, ℝ3).risingFactorial(in, bits, ℝ4), bits, result);
   }

   public nMinus_GnTimesλTimes2_ₙ_DividedByλPlushalf_ₙ_/* $VF was: nMinus>GnTimesλTimes2₍ₙ₎DividedByλPlushalf₍ₙ₎*/() {
      G = new JacobiPolynomialSequence();
      c1 = new Integer("2");
      r̅1 = new RealPolynomial();
      ℝ1 = new Real();
      ℝ2 = new Real();
      r̅2 = new RealPolynomial();
      ℝ3 = new Real();
      ℝ4 = new Real();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (λ == null) {
         throw new AssertionError("λ is null");
      } else {
         G.λ = λ;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      r̅1.close();
      ℝ1.close();
      ℝ2.close();
      r̅2.close();
      ℝ3.close();
      ℝ4.close();
   }
}
