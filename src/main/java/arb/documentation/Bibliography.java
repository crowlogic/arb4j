package arb.documentation;

public class Bibliography
{
  public static void main(String args[])
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
  }

  public final Book stochasticFiniteElements = new Book("Ghanem, Roger G. and Spanos, Pol D.",
                                                        "Stochastic finite elements: a spectral approach",
                                                        "1991").setPublisher("Springer-Verlag")
                                                               .setAddress("Berlin, Heidelberg");

  @Override
  public String toString()
  {
    // FIXME: todo: use reflection to automatically assign the names based on the
    // name of the variable to which it is assignedf
    return stochasticFiniteElements.cite("stochasticFiniteElements");
  }

}
