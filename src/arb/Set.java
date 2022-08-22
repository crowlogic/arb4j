package arb;

/**
 * A set is the mathematical model for a collection of different things; a set
 * contains elements or members, which can be mathematical objects of any kind:
 * numbers, symbols, points in space, lines, other geometrical shapes,
 * variables, or even other sets. The set with no element is the empty set; a
 * set with a single element is a singleton. A set may have a finite number of
 * elements or be an infinite set. Two sets are equal if they have precisely the
 * same elements.
 * 
 * Sets are ubiquitous in modern mathematics. Indeed, set theory, more
 * specifically Zermelo–Fraenkel set theory, has been the standard way to
 * provide rigorous foundations for all branches of mathematics since the first
 * half of the 20th century.
 * 
 * Another take on the concept of a set is the following: An aggregate,
 * totality, collection of any {@link Object}s whatever, called its elements,
 * which have a common characteristic property. "A set is many, conceivable to
 * us as one" (G. Cantor). This is not in a true sense a logical definition of
 * the notion of a set, rather it is just an explanation (because defining the
 * notion means finding a generic idea to which the given idea belongs as a
 * species; but a set is, unfortunately, itself a broad notion in mathematics
 * and logic). In this connection it is possible either to give a list of the
 * elements of the set, an enumeration of it, or to give a rule for determining
 * whether or not a given object belongs to the set considered, a description of
 * it (moreover, the first is really acceptable only when the question concerns
 * finite sets).
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Set_(mathematics)">Wikipedia</a>
 * @see <a href="https://encyclopediaofmath.org/wiki/Set">The Encyclopedia of
 *      Mathematics wiki</a>
 */
public interface Set<X>
{
  public default boolean contains(X element)
  {
    assert false : "contains should be implemented by " + getClass();
    return false;
  }
}
