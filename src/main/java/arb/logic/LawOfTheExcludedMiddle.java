package arb.logic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;

/**
 * In logic, the law of excluded middle or the principle of excluded middle
 * states that for every {@link Proposition}, either this proposition or its
 * negation is true. It is one of the <b>three laws of thought</b> along with
 * the law of noncontradiction, and the law of identity; however, no system of
 * logic is built on just these laws, and none of these laws provides inference
 * rules, such as modus ponens or De Morgan's laws. The law is also known as the
 * law / principle of the excluded third, in Latin principium tertii exclusi.
 * Another Latin designation for this law is tertium non datur or "no third
 * [possibility] is given". In classical logic, the law is a {@link Tautology}.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LawOfTheExcludedMiddle<W extends Word, S extends Sentence<? extends W>> extends
                                       Tautology<W, S>
{

}
