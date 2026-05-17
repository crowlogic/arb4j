package arb.functions.polynomials.orthogonal;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.List;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.Sequence;
import arb.functions.polynomials.PolynomialSequence;
import arb.functions.polynomials.SequenceIterator;

/**
 * All orthogonal polynomials can be expressed by specifying 3
 * {@link Sequence}s<br>
 * <br>
 * Pₙ₊₁(𝑥) = (Aₙ*x+Bₙ)*Pₙ(x) - Cₙ*Pₙ₋₁(x)<br>
 * <br>
 * where {@link #A()} and {@link #C()}'s elements should be {@link Nonnegative}
 * and {@link #B()}'s values can have any sign where Pₙ(𝑥) represents the nth
 * polynomial in the sequence and {@link #A}ₙ , {@link #B}ₙ, and {@link #C}ₙ are
 * given by<br>
 * 
 * <pre>
 * Aₙ=∫𝑥Pₙ(𝑥)²w(𝑥)d𝑥/∫Pₙ(𝑥)²w(𝑥)d𝑥≥0
 * Bₙ=∫Pₙ₊₁(𝑥)w(𝑥)d𝑥/∫Pₙ(𝑥)²w(𝑥)d𝑥
 * Cₙ=∫Pₙ(𝑥)²w(𝑥)d𝑥/∫Pₙ₋₁(𝑥)²w(𝑥)d𝑥≥0
 *
 * where w(x) is the {@link #orthogonalityMeasure()} defined over  {@link #domainOfOrthogonality()}, the  {@link Domain} of 
 * integration over which the elements of this {@link OrthogonalPolynomialSequence} are mutually orthogonal 
 * with respect to.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class RecurrentlyGeneratedOrthogonalPolynomialSequence<R, V, E extends AutoCloseableAssignable<? extends E>> extends
                                                                      OrthogonalPolynomialSequence<R, V, E> implements
                                                                      Initializable
{

  @Override
  public List<E> enumerate(int i, int j)
  {
    assert false : "TODO: fill the cache entry if its not there";
    return null;
  }

  @Override
  public String toString()
  {
    return String.format("%s[context=%s, initialized=%s, A=%s, B=%s, C=%s, P=%s]", getClass().getSimpleName(), context, initialized, A, B, C, P);
  }


  public Class<E>                 elementType;

  public E                        p0;

  public E                        p1;

  public Context                  context;

  private boolean                 initialized;

  private Sequence<R>             A;

  private Sequence<R>             B;

  private Sequence<R>             C;

  public PolynomialSequence<R, E> P;

  public RecurrentlyGeneratedOrthogonalPolynomialSequence(Class<E> elementType)
  {
    this(elementType, null);
  }

  /**
   * Construct sharing an externally-supplied {@link Context}. When {@code
   * sharedContext} is non-null, the OPS registers p0 and p1 into the supplied
   * context and reuses it instead of creating a fresh one. This is required
   * when the OPS needs to reference function mappings that live in the
   * caller's context (e.g. the Riccati moment functional's {@code m} sequence,
   * whose expression depends on {@code a}, {@code p}, {@code q}, {@code r},
   * {@code μ} all registered in the caller's context). A fresh context would
   * lose those mappings, so the inner self-instance of the recursive S
   * sequence would have no way to resolve {@code m} on lazy initialize.
   */
  public RecurrentlyGeneratedOrthogonalPolynomialSequence(Class<E> elementType, Context sharedContext)
  {
    this.elementType = elementType;
    p0               = newElement().setName("p0");
    p1               = newElement().setName("p1");
    if (sharedContext != null)
    {
      sharedContext.registerVariable(p0);
      sharedContext.registerVariable(p1);
      context = sharedContext;
    }
    else
    {
      context = new Context(p0,
                            p1);
    }
  }

  public E newElement()
  {
    try
    {
      return elementType.getConstructor().newInstance();
    }
    catch (Throwable e)
    {
      wrapOrThrow(e);
      return null;
    }
  }

  protected abstract Sequence<R> A();

  protected abstract Sequence<R> B();

  protected abstract Sequence<R> C();

  @Override
  public E evaluate(Integer n, int order, int bits, E res)
  {
    if (!initialized)
    {
      initialize();
    }
    return P.evaluate(n, order, bits, res);

  }

  @Override
  public void initialize()
  {
    assert !initialized : "already initialized";
    A           = A();
    B           = B();
    C           = C();
    P           = PolynomialSequence.express("P", "n➔when(n=0,p0,n=1,p1,else,(A(n-1)*x+B(n-1))*P(n-1)-C(n-1)*P(n-2))", context, coDomainType());
    initialized = true;
  }

  @Override
  public SequenceIterator<E> iterator()
  {
    return new SequenceIterator<E>(this);
  }

}