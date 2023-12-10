package arb.expressions;

import arb.Real;
import arb.RealIterator;
import arb.functions.real.RealFunction;

/**
 * TODO: https://github.com/crowlogic/arb4j/issues/277: modify
 * {@link Expression} {@link Compiler} to generate code that allocates
 * intermediate variables this way
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre> 
 */
public class ImprovedIntermediateVariableHandlingExample implements
                                                         RealFunction
{
  public Real         c0                           = new Real("2",
                                                              128);
  public Real         c1                           = new Real("1",
                                                              128);
  public Real         α;
  public Real         β;
  public Real         intermediateVariables        = Real.newVector(25);
  public RealIterator intermediateVariableIterator = intermediateVariables.iterator();

  public Real alloc()
  {
    return intermediateVariableIterator.next();
  }

  public Real l0  = alloc();
  public Real l1  = alloc();
  public Real l2  = alloc();
  public Real l3  = alloc();
  public Real l4  = alloc();
  public Real l5  = alloc();
  public Real l6  = alloc();
  public Real l7  = alloc();
  public Real l8  = alloc();
  public Real l9  = alloc();
  public Real l10 = alloc();
  public Real l11 = alloc();
  public Real l12 = alloc();
  public Real l13 = alloc();
  public Real l14 = alloc();
  public Real l15 = alloc();
  public Real l16 = alloc();
  public Real l17 = alloc();
  public Real l18 = alloc();
  public Real l19 = alloc();
  public Real l20 = alloc();
  public Real l21 = alloc();
  public Real l22 = alloc();
  public Real l23 = alloc();
  public Real l24 = alloc();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return c0.mul(in, bits, result)
             .add(α, bits, l0)
             .add(β, bits, l1)
             .sub(c1, bits, l2)
             .mul(α.pow(c0, bits, l3)
                   .sub(β.pow(c0, bits, l4), bits, l5)
                   .add(c0.mul(in, bits, l6)
                          .add(α, bits, l7)
                          .add(β, bits, l8)
                          .sub(c0, bits, l9)
                          .mul(c0.mul(in, bits, l10).add(α, bits, l11).add(β, bits, l12), bits, l13),
                        bits,
                        l14),
                  bits,
                  l15)
             .div(c0.mul(in, bits, l16)
                    .mul(in.add(α, bits, l17).add(β, bits, l18), bits, l19)
                    .mul(c0.mul(in.sub(c1, bits, l20), bits, l21).add(α, bits, l22).add(β, bits, l23), bits, l24),
                  bits,
                  result);
  }

  public void close()
  {
    c0.close();
    c1.close();
    intermediateVariables.close();
  }
}