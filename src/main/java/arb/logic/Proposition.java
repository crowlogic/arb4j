package arb.logic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;

/**
 * A proposition is a sentence to which one and only one of the terms true or
 * false can be meaningfully applied. Example 3.1. 1: Some Propositions. “Four
 * is even,”, “4∈{1,3,5}” and “43>21” are propositions. In traditional logic, a
 * declarative statement with a definite truth value is considered a proposition
 * 
 * A proposition is a declarative Statement that is either true or false, but
 * not both. It asserts a fact or a condition that can be unambiguously verified
 * for its truth value. Propositions are fundamental to logic, serving as the
 * basic units of meaning in logical analysis and reasoning.
 * 
 * With propositions, you can:
 * <ul>
 * <li>Evaluate: Determine its truth value (true or false) based on the truth
 * values of its components.</li>
 * <li>Negate: Create a new proposition expressing the opposite truth
 * value.</li>
 * <li>Combine: Use logical connectives (and, or, not, implies, iff) to form new
 * propositions from existing ones.</li>
 * <li>Quantify: Introduce existential or universal quantifiers to express
 * propositions about some or all elements of a domain.</li>
 * <li>Prove: Demonstrate its truth through a series of logically valid steps
 * from axioms and previously proven propositions.</li>
 * <li>Disprove: Show it is false by finding a counterexample or deriving a
 * contradiction.</li>
 * <li>Assume: Temporarily accept its truth for the sake of argument or within a
 * proof by contradiction.</li>
 * <li>Infer: Derive new propositions that logically follow from it.</li>
 * <li>Equivalent Transformations: Apply logical rules to transform it into an
 * equivalent proposition with potentially clearer or more useful form.</li>
 * <li>Analyze Logical Structure: Break it down into simpler components to study
 * its form and content.</li>
 * </ul>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Proposition<W extends Word, S extends Sentence<? extends W>> extends
                            Sentence<W>
{
  public boolean evaluate();

  public Proposition<W, S> negate();

  public Proposition<W, S> combine(LogicalConnective logicalConnective, Proposition<W, S> proposition);

}
