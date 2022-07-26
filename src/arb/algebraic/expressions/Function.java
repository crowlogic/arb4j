package arb.algebraic.expressions;

/**
 * TODO: harmonize this with {@link arb.functions.Function} and its descendants
 * 
 * @param <T>
 */
@FunctionalInterface
public interface Function<T>
{
  public float evaluate(FunctionInvocation<T> c);
}