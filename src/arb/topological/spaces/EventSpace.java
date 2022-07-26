package arb.topological.spaces;

/**
 * An event is a set of outcomes of an experiment (a subset of the sample space)
 * to which a probability is assigned. A single outcome may be an element of
 * many different events, and different events in an experiment are usually not
 * equally likely, since they may include very different groups of outcomes. An
 * event consisting of only a single outcome is called an elementary event or an
 * atomic event; that is, it is a singleton set. An event S is said to occur if
 * S contains the outcome x of the experiment (or trial) (that is, if x ∈ S ).
 * The probability (with respect to some probability measure) that an event S S
 * occurs is the probability that S contains the outcome x of an experiment
 * (that is, it is the probability that x ∈ S . An event defines a complementary
 * event, namely the complementary set (the event not occurring), and together
 * these define a Bernoulli trial: did the event occur or not?
 * 
 * Typically, when the sample space is finite, any subset of the sample space is
 * an event (that is, all elements of the power set of the sample space are
 * defined as events). However, this approach does not work well in cases where
 * the sample space is uncountably infinite. So, when defining a probability
 * space it is possible, and often necessary, to exclude certain subsets of the
 * sample space from being events
 * 
 * @param <X>
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Event_(probability_theory)">Wikipedia</a>
 */
public interface EventSpace<X> extends
                           Space<X>
{

}
