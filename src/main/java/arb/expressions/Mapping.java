package arb.expressions;

import java.util.Objects;

import arb.functions.Function;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 */
public final class Mapping<D, R>
{
  public Class<?> functionInterface;

  @Override
  public String toString()
  {
    return String.format("Mapping[name=%s, func=%s, domain=%s, range=%s, functionInterface=%s]",
                         name,
                         func,
                         domain != null ? domain.getName() : null,
                         range != null ? range.getName() : null,
                         functionInterface);
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(domain, name, range);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Mapping<?, ?> other = (Mapping<?, ?>) obj;
    return Objects.equals(domain, other.domain) && Objects.equals(name, other.name)
                  && Objects.equals(range, other.range);
  }

  public String         name;

  public Function<?, ?> func;

  public Class<?>       domain;

  public Class<?>       range;

}