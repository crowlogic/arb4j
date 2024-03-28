package arb.language;

import arb.logic.Proposition;

/**
 * 8: (logic) the first {@link Term} of a {@link Proposition}
 * 
 * @param <P>
 */
public interface Subject<W extends Word,
              S extends Sentence<W>,
              P extends Proposition<? extends W, ? extends S>> extends
                        Term<S, P, W>
{

}
