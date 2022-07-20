package arb.operators;

import arb.*;
import arb.functions.complex.*;

/**
 * <h1>Dynamical interpretation of eigenvalues of the transfer operator)</h1>
 * 
 * 1. All eigenvalues of the transfer operator have modulus less than or equal
 * to one.<br>
 * 2. The invariant probability densities of T are the non-negative h ∈ L1(μ)
 * s.t. ̂ T h = h and ∫ hdμ = 1. We call hdμ an acip(<b>absolutely continuous
 * invariant probability measure</b>). <br>
 * 3. If ̂ T has an acip and 1 is a simple eigenvalue of ̂ T , then the acip is
 * ergodic. “Simple” means that dim{g ∈ L1 : ̂ T g = g} = 1. <br>
 * 4. If ̂ T has an acip and 1 is simple, and all other eigenvalues of ̂ T have
 * modulus strictly smaller than one, then the acip is weak mixing. <br>
 * 5. If T is probability preserving and mixing, then ̂ T has exactly one
 * eigenvalue on the unit circle, equal to one, and this eigenvalue is simple.
 * (Be careful not to confuse L1-eigenvalues with L2-eigenvalues.)<br>
 * 
 * @see https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf
 * 
 * @param <F>
 */
public class TransferOperator<F extends ComplexFunction> implements
                             LinearOperator,
                             ComplexFunction
{

  @Override
  public ComplexFunction adjoint()
  {
    // FIXME: does this need to be split into a left-adjoint and a right-adjoint
    // that takes an argument? probably a rhetorical question
    return new Composition(f,
                           null);
  }

  public TransferOperator(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    int inverseBranchCount = f.getInverseBranchCount();
    try ( Complex a = new Complex();)
    {
      for (int branch = 0; branch < inverseBranchCount; branch++)
      {
        ComplexFunction finverse             = f.inverse(branch);
        ComplexFunction finverseDifferential = finverse.differential();
        assert false : "TODO: finish";
        // finverseDifferential.evaluate(z, order, prec, w)
      }
    }
    // TODO Auto-generated method stub
    return null;
  }

}
