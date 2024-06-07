package arb.logic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Term;
import arb.language.Word;

/**
 *
 * <pre>
clause: A logical formula in conjunctive normal form which has the schema

   p₁ ∧ ... ∧ pₘ ⇒ q₁ ∨ ... ∨ qₙ

or equivalently

   ~p₁ ∨ ... ∨ ~pₘ ∨ q₁ ∨ ... ∨ qₙ

where pᵢ and qᵢ are atoms and the operators ~, ∧, ∨, ⇒ are connectives symbolized by
    
     ~ for negation
     
     ∧ for conjunction 
     
     ∨ for disjunction
     
 and
    ⇒
       for implication
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Clause<W extends Word,
              S extends Sentence<? extends W>,
              P extends Proposition<? extends W, ? extends S>> extends
                       Term<S, P, W>
{

}
