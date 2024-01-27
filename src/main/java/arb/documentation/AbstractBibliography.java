package arb.documentation;

import java.lang.reflect.Field;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * See {@link Bibliography} for an example implementation.. just declare the
 * {@link Reference}s as public member variables and the this{@link #toString()}
 * method will harness the power of Java's reflection API to generate a BiBTeX
 * representation without having to otherwise manually build a list of all the
 * references
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 */
public abstract class AbstractBibliography
{

  public AbstractBibliography()
  {
    super();
  }

  @Override
  public String toString()
  {
    return getReferenceFields().map(field -> getReference(field).cite(field.getName()))
                               .collect(Collectors.joining("\n\n"));
  }

  protected Stream<Field> getReferenceFields()
  {
    return getFieldStream().filter(field -> Reference.class.isAssignableFrom(field.getType())
                  && getReference(field) != null);
  }

  protected Stream<Field> getFieldStream()
  {
    return Stream.of(Bibliography.class.getFields());
  }

  protected Reference getReference(Field field)
  {
    Reference reference;
    try
    {
      reference = (Reference) field.get(this);
    }
    catch (IllegalArgumentException | IllegalAccessException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return reference;
  }

}