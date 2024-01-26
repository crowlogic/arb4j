package arb.documentation;

import java.lang.reflect.Field;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Bibliography
{
  public static void main(String args[])
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
  }

  public final Reference orthogonalPolynomialFourierTransforms = new Article("Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                                             "The finite Fourier transform of classical polynomials",
                                                                             "2015",
                                                                             "Journal of the Australian Mathematical Society",
                                                                             "98",
                                                                             "145--160").setPublisher("Cambridge University Press");

  public final Book      stochasticFiniteElements              = new Book("Ghanem, Roger G. and Spanos, Pol D.",
                                                                          "Stochastic finite elements: a spectral approach",
                                                                          "1991").setPublisher("Springer-Verlag")
                                                                                 .setAddress("Berlin, Heidelberg");

  public final Book      stochasticProcessInferenceTheory      = new Book("Stochastic Processes: Inference Theory",
                                                                          "Malempati M. Rao",
                                                                          "2014").setPublisher("Springer")
                                                                                 .setEdition("2nd")
                                                                                 .setSeries("Springer Monographs in Mathematics");

  @Override
  public String toString()
  {
    return getReferenceFields().map(field -> getReference(field).cite(field.getName()))
                               .collect(Collectors.joining("\n\n"));
  }

  private Stream<Field> getReferenceFields()
  {
    return Stream.of(Bibliography.class.getFields())
                 .filter(field -> Reference.class.isAssignableFrom(field.getType()) && getReference(field) != null);
  }

  private Reference getReference(Field field)
  {
    Reference reference;
    try
    {
      reference = (Reference) field.get(Bibliography.this);
    }
    catch (IllegalArgumentException | IllegalAccessException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return reference;
  };

}
