package arb.functions;

public interface Functional<DOMAIN,
              CODOMAIN,
              FUNC extends Function<? extends DOMAIN, ? extends CODOMAIN>> extends
                           Function<DOMAIN, FUNC>
{

  @SuppressWarnings("hiding")
  public static <D,
                C,
                F extends Function<? extends D, ? extends C>,
                G extends Functional<? extends D, ? extends C, ? extends F>>
         G
         express(Class<? extends D> domainClass,
                 Class<? extends F> coDomainFunctionClass,
                 Class<? extends G> functionalClass,
                 String expression)
  {
    return Function.express(domainClass, coDomainFunctionClass, functionalClass, expression);
  }

}
