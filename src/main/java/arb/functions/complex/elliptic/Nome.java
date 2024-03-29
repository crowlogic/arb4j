package arb.functions.complex.elliptic;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * The {@link Nome} is defined by
 * 
 * q = e^(i*π*τ) where τ is the <b>half-period ratio</b> defined by
 * τ=i*(K'/K)=ω₂/ω₁
 * 
 * where K and iK′ are the <b>quarter periods</b>, and (ω₁,ω₂) is the
 * {@link FundamentalPeriodPair}. The {@link Nome} can be parameterized by any
 * of these quantities; conversely, any one of these quantities can be taken as
 * functions of the {@link Nome}.
 * 
 * Each of them uniquely determines the others when 0<q<1. That is, when 0<q<1
 * the mappings between these various functions are both 1-to-1 and onto, and so
 * can be inverted: the quarter periods, the half-periods and the half-period
 * ratio can be explicitly written as functions of the {@link Nome}.
 * 
 * For general {@link Complex} q ∈ C with 0 < | q | < 1, τ is not a
 * single-valued function of q.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Nome extends
                      EllipticFunction
{

}
