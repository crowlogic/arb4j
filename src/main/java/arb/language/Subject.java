package arb.language;

import arb.logic.Proposition;
import arb.logic.Statement;

/**
 * A subject is the referent about which a {@link Statement} is madex
 * 
 * @param <P>
 */
public interface Subject<W extends Word,
              S extends Statement<? extends W>,
              P extends Proposition<? extends W, ? extends S>> extends
                        Term<S, P, W>
{

}
