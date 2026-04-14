package arb.expressions.nodes;

import java.util.ArrayList;

import arb.functions.Function;

/**
 * A group of nodes that compute equivalent subexpressions — the standard term
 * from value numbering and congruence closure. Membership is determined by
 * {@link Node#isEquivalentTo(Node)}: two nodes belong to the same
 * {@link CongruenceClass} if one is equivalent to the canonical (first) member.
 * 
 * <p>
 * Extends {@link ArrayList} so all list operations are inherited directly.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class CongruenceClass<D, R, F extends Function<? extends D, ? extends R>> extends
                             ArrayList<Node<D, R, F>>
{
  public final String key;

  public CongruenceClass(String key)
  {
    this.key = key;
  }

  public Node<D, R, F> canonical()
  {
    return get(0);
  }

  public Class<?> type()
  {
    return canonical().type();
  }

  public boolean isRedundant()
  {
    return size() >= 2;
  }
}
