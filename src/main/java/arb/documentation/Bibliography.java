package arb.documentation;

/**
 * A list of {@link Reference}s
 * 
 * 
 */
public class Bibliography extends
                          AbstractBibliography
{
  public Book    functionalAnalysisYosida              = new Book("Functional Analysis",
                                                                  "吉田 耕作(Kōsaku Yosida)",
                                                                  "1995").setPublisher("Springer Berlin Heidelberg")
                                                                         .setSeries("Classics in Mathematics")
                                                                         .setEdition("Reprint of the 1980 Edition");

  public Book    linearTransformationsInHilbertSpace   = new Book("Linear Transformations in Hilbert Space",
                                                                  "Marshall Harvey Stone",
                                                                  "1932").setEdition("4th Printing (1951)")
                                                                         .setVolume("XV")
                                                                         .setSeries("Colloquium Publications")
                                                                         .setPublisher("American Mathematical Society")
                                                                         .setAddress("501 West 116th Street");

  public Article orthogonalPolynomialFourierTransforms = new Article("Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                                     "The finite Fourier transform of classical polynomials",
                                                                     "2015",
                                                                     "Journal of the Australian Mathematical Society",
                                                                     "98",
                                                                     "145--160").setPublisher("Cambridge University Press");

  public Book    functionalAnalysisRieszNagy           = new Book("Functional Analysis",
                                                                  "Frigyes Riesz and Béla Sz.-Nagy",
                                                                  "2012").setPublisher("Dover Publications")
                                                                         .setSeries("Dover Books on Mathematics");

  public Book    stochasticFiniteElements              = new Book("Ghanem, Roger G. and Spanos, Pol D.",
                                                                  "Stochastic finite elements: a spectral approach",
                                                                  "1991").setPublisher("Springer-Verlag")
                                                                         .setAddress("Berlin, Heidelberg");

  public Book    stochasticProcessInferenceTheory      = new Book("Stochastic Processes: Inference Theory",
                                                                  "Malempati M. Rao",
                                                                  "2014").setPublisher("Springer")
                                                                         .setEdition("2nd")
                                                                         .setSeries("Springer Monographs in Mathematics");

  public static void main(String args[])
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
  };

}
