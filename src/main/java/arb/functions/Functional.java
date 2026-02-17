package arb.functions;

public interface Functional<DOMAIN, CODOMAIN, FUNC extends Function<? extends DOMAIN, ? extends CODOMAIN>> extends
                           Function<DOMAIN, FUNC>
{

}
