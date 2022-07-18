package arb.expression;

@FunctionalInterface
public interface Function<T>
{
  public float evaluate(FunctionalExpressionContext<T> c);
}