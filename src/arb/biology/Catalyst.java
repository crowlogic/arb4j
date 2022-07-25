package arb.biology;

/**
 * A {@link Substance} that initiates or accelerates a {@link ChemicalReaction}
 * without itself being affected. <br>
 * <br>
 * 
 * 75 Moby Thesaurus words for "catalyst": agent, agent provocateur, agitator,
 * agitprop, alterant, alterative, alterer, author, begetter, beginner,
 * catalysis, catalytic agent, causer, creator, decay, demagogue, dialysis, 
 * dissociation, effector, engenderer, exciter, father, ferment, firebrand,
 * fission, fomenter, generator, goad, hydrolysis, hydrolyst, impetus, impulse,
 * incendiary, incentive, incitation, incitement, inciter, inflamer,
 * innovationist, innovator, inspirer, instigator, introducer, leaven, maker,
 * mischief-maker, modificator, modifier, mother, motivation, mover, originator,
 * parent, photolysis, precursor, prime mover, primum mobile, producer,
 * provocateur, provoker, rabble-rouser, ringleader, rouser, seditionary,
 * seditionist, sire, splitting, spur, stimulant, thermolysis, transformer,
 * transmogrifier, troublemaker, urger, yeast
 */
public interface Catalyst extends
                          Substance
{
  /**
   * Starts a {@link ChemicalReaction}
   * 
   * @return a newly initiated {@link ChemicalReaction}
   */
  public ChemicalReaction initiate();

  /**
   * Accelerates a {@link ChemicalReaction}
   * 
   * @param reaction the {@link ChemicalReaction} to be accelerated
   * 
   * @return reaction for conveniently chaining successive invocations
   */
  public ChemicalReaction accelerate(ChemicalReaction reaction);

}
