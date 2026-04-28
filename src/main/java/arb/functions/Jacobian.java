package arb.functions;

import java.lang.reflect.Array;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Jacobian of a {@link Function} with respect to a caller-specified, caller-ordered
 * subset of its parameters. The Jacobian itself is a {@link Function} whose co-domain
 * is an array of the source function's co-domain type, so re-application yields a
 * Hessian without any new machinery.
 *
 * <p>The implementing source function decides how to produce each partial — symbolic
 * differentiation against its own {@code Context}, ARB jets at the named variable,
 * or any other technique appropriate to that function. The caller never sees those
 * details: the public surface is the array of partials, each itself a {@link Function},
 * evaluated through the standard {@code evaluate(t, order, bits, result)} path.
 *
 * @param <D> domain
 * @param <R> co-domain of the source function
 * @param <F> the source function type
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class Jacobian<D, R, F extends Function<D, R>> implements
                     Function<D, R[]>
{
  public final F          source;
  public final String[]   variables;
  public final F[]        partials;

  @SuppressWarnings("unchecked")
  public Jacobian(F source, String[] variables, F[] partials)
  {
    this.source    = source;
    this.variables = variables;
    this.partials  = partials;
  }

  @Override
  public R[] evaluate(D t, int order, int bits, R[] result)
  {
    assert result != null : "result must be preallocated; pass an array of length " + variables.length;
    assert result.length == variables.length : "result.length=" + result.length
                                                + " does not match variables.length=" + variables.length;
    for (int i = 0; i < variables.length; i++)
    {
      partials[i].evaluate(t, order, bits, result[i]);
    }
    return result;
  }

  @Override
  public Class<D> domainType()
  {
    return source.domainType();
  }

  @SuppressWarnings("unchecked")
  public R[] newCoDomainInstance(int bits)
  {
    Class<R> componentType = source.coDomainType();
    R[] arr = (R[]) Array.newInstance(componentType, variables.length);
    for (int i = 0; i < variables.length; i++)
    {
      arr[i] = partials[i].newCoDomainInstance();
    }
    return arr;
  }

  @Override
  public String getName()
  {
    String n = source.getName();
    return (n == null ? "" : n) + "/∂(" + String.join(",", variables) + ")";
  }

  @Override
  public String toString()
  {
    String n = source.getName() == null ? "f" : source.getName();
    return "∂" + n + "/∂(" + String.join(",", variables) + ")";
  }

  @Override
  public String typeset()
  {
    StringBuilder sb = new StringBuilder("\\frac{\\partial ");
    sb.append(source.getName() == null ? "f" : source.getName());
    sb.append("}{\\partial(");
    for (int i = 0; i < variables.length; i++)
    {
      if (i > 0)
      {
        sb.append(",");
      }
      sb.append(variables[i]);
    }
    sb.append(")}");
    return sb.toString();
  }

  @Override
  public void close()
  {
    for (F p : partials)
    {
      if (p != null && p != source)
      {
        p.close();
      }
    }
  }
}
