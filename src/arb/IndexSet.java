package arb;

import arb.domains.Domain;

public interface IndexSet<X extends Field> extends
                         Set<X>,
                         Domain<X>
{

}
