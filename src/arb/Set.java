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
 * @see <a href="https://en.wikipedia.org/wiki/Set_(mathematics)">Wikipedia</a>
 */
public interface Set<X>
{
  public default boolean contains( X element )
  {
    assert false : "contains should be implemented by " + getClass();
    return false;
  }
}
