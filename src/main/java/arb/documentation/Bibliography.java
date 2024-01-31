package arb.documentation;

/**
 * A list of {@link Reference}s
 * 
 * 
 */
public class Bibliography extends
                          AbstractBibliography
{
  public static Book    functionalAnalysisRieszNagy        = new Book("Frigyes Riesz and Béla Sz.-Nagy",
                                                                      "Functional Analysis",
                                                                      "2012").setPublisher("Dover Publications")
                                                                             .setSeries("Dover Books on Mathematics");

  public static Book    functionalAnalysisYosida           = new Book("吉田 耕作(Kōsaku Yosida)",
                                                                      "Functional Analysis",
                                                                      "1995").setPublisher("Springer Berlin Heidelberg")
                                                                             .setSeries("Classics in Mathematics")
                                                                             .setEdition("Reprint of the 1980 Edition");

  public static Book    linearHilbertSpaceTransforms       = new Book("Marshall Harvey Stone",
                                                                      "Linear Transformations in Hilbert Space",
                                                                      "1932").setEdition("4th Printing (1951)")
                                                                             .setVolume("XV")
                                                                             .setSeries("Colloquium Publications")
                                                                             .setPublisher("American Mathematical Society")
                                                                             .setAddress("501 West 116th Street");

  public static Article orthopolyFourierTransforms         = new Article("Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                                         "The finite Fourier transform of classical polynomials",
                                                                         "2015",
                                                                         "Journal of the Australian Mathematical Society",
                                                                         "98",
                                                                         "145--160").setPublisher("Cambridge University Press");

  public static Book    randomMatrices                     = new Book("Madan Lal Mehta",
                                                                      "Random Matrices",
                                                                      "2004").setEdition("3rd")
                                                                             .setSeries("Pure and Applied Mathematics")
                                                                             .setVolume("142");

  public static Book    skewOrthogonalRandomMatrices       = new Book("Saugata Ghosh",
                                                                      "Skew-Orthogonal Polynomials and Random Matrix Theory",
                                                                      "2009").setSeries("CRM Monograph Series")
                                                                             .setVolume("28")
                                                                             .setPublisher("American Mathematical Society");

  public static Book    stationaryAndRelatedProcesses      = new Book("Stationary and Related Processes: Sample Function Properties and Their Applications",
                                                                      "Harald Cramér and M.R. Leadbetter",
                                                                      "1967").setSeries("Wiley Series in Probability and Mathematical Statistics");

  public static Book    stationaryCorrelationFunctions     = new Book("Correlation Theory of Stationary and Related Random Functions",
                                                                      "Yaglom, A.M.",
                                                                      "1987").setSeries("Applied Probability")
                                                                             .setPublisher("Springer New York")
                                                                             .setVolume("I: Basic Results");

  public static Book    stochasticFiniteElements           = new Book("Ghanem, Roger G. and Spanos, Pol D.",
                                                                      "Stochastic finite elements: a spectral approach",
                                                                      "1991").setPublisher("Springer-Verlag")
                                                                             .setAddress("Berlin, Heidelberg");

  public static Book    stochasticProcessInferenceTheory   = new Book("Malempati M. Rao",
                                                                      "Stochastic Processes: Inference Theory",
                                                                      "2014").setPublisher("Springer")
                                                                             .setEdition("2nd")
                                                                             .setSeries("Springer Monographs in Mathematics");

  public static Book    stochasticQuantumMechanicalMethods = new Book("Stochastic Methods in Quantum Mechanics",
                                                                      "Stanley P. Gudder",
                                                                      "1979").setSeries("North Holland Series in Probability and Applied Mathematics")
                                                                             .setPublisher("Elsevier North Holland");

  public static void main(String args[])
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
  };

}
