package arb.documentation;

import static arb.utensils.Utensils.throwOrWrap;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import arb.documentation.references.Reference;

/**
 * See {@link Bibliography} for an example implementation.. just declare the
 * {@link Reference}s as public member variables and the {@link #toString()}
 * method will harness the power of Java's reflection API to generate a BiBTeX
 * representation without having to otherwise manually build a list of all the
 * references
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
    return getReferences().map(field -> getReference(field).cite(field.getName())).collect(Collectors.joining("\n\n"));
  }

  protected Stream<Field> getReferences()
  {
    return getFieldStream().filter(field -> getReference(field) != null).toList().stream();
  }

  protected Stream<Field> getFieldStream()
  {
    return Stream.of(getClass().getFields());
  }

  protected Reference getReference(Field field)
  {
    Reference reference = null;
    try
    {
      reference = (Reference) field.get(this);
    }
    catch (IllegalArgumentException | IllegalAccessException e)
    {
      throwOrWrap(e);
    }
    return reference;
  }

  /**
   * Generate citation using reflection based on field mapping
   */
  public static String generateCitation(Reference reference, String key, Map<String, String> fieldMapping)
  {
    String        citationType = reference.getCitationType();

    StringBuilder citation     = new StringBuilder("@").append(citationType).append("{").append(key);

    for (Map.Entry<String, String> entry : fieldMapping.entrySet())
    {
      try
      {
        String value = getFieldValue(reference, entry.getValue());
        citation.append(Reference.conditionallyInsertField(entry.getKey(), value));
      }
      catch (Exception e)
      {
        System.err.println("Error accessing field "
                           + entry.getValue()
                           + " in "
                           + reference.getClass().getSimpleName()
                           + ": "
                           + e.getMessage());
      }
    }

    citation.append("}");
    return citation.toString().replace(",}", "}");
  }

  private static String getFieldValue(Object obj, String methodName) throws Exception
  {
    Method method = obj.getClass().getMethod(methodName);
    Object value  = method.invoke(obj);

    // Handle AtomicReference
    if (value instanceof AtomicReference)
    {
      value = ((AtomicReference<?>) value).get();
    }

    return value != null ? value.toString() : null;
  }
}
