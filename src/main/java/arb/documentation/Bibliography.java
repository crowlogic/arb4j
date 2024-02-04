package arb.documentation;

/**
 * A list of {@link Reference}s
 * 
 * @Electronic{oeisA001790, author = {OEIS Foundation Inc.}, title = {A001790
 *                          Numerators in (the) expansion of 1/sqrt(1-x)}, year
 *                          = {2024}, url = {https://oeis.org/A001790}, note =
 *                          {This sequence gives the numerators of the Maclaurin
 *                          series of the Lorentz factor (see Wikipedia link) of
 *                          1/sqrt(1-b^2) = dt/dtau where b=u/c is the velocity
 *                          in terms of the speed of light c, u is the velocity
 *                          as observed in the reference frame where time t is
 *                          measured and tau is the proper time. - Stephen
 *                          Crowley, Apr 03 2007}}
 * 
 */
public class Bibliography extends
                          AbstractBibliography
{
  public static Electronic oeisA001790                           = new Electronic("A001790 Numerators in (the) expansion of 1/sqrt(1-x)",
                                                                                  "OEIS Foundation Inc.",
                                                                                  "2024",
                                                                                  "https://oeis.org/A001790",
                                                                                  "This sequence gives the numerators of the Maclaurin series of the Lorentz factor (see Wikipedia link) of 1/sqrt(1-b^2) = dt/dtau where b=u/c is the velocity in terms of the speed of light c, u is the velocity as observed in the reference frame where time t is measured and tau is the proper time. - Stephen Crowley, Apr 03 2007");

  public static Book       extremesOfRandomProcesses             = new Book("Extremes and Related Properties of Random Sequences and Processes",
                                                                            "Georg Lindgren, Holger Rootzén, and M. R. Leadbetter",
                                                                            "1983").setSeries("Springer Series in Statistics")
                                                                                   .setPublisher("Springer-Verlag New York Inc.");

  public static Book       functionalAnalysisRieszNagy           = new Book("Functional Analysis",
                                                                            "Frigyes Riesz and Béla Sz.-Nagy",
                                                                            "2012").setPublisher("Dover Publications")
                                                                                   .setSeries("Dover Books on Mathematics");

  public static Book       functionalAnalysisYosida              = new Book("Functional Analysis",
                                                                            "吉田 耕作(Kōsaku Yosida)",
                                                                            "1995").setPublisher("Springer Berlin Heidelberg")
                                                                                   .setSeries("Classics in Mathematics")
                                                                                   .setEdition("Reprint of the 1980 Edition");

  public static Book       linearHilbertSpaceTransforms          = new Book("Linear Transformations in Hilbert Space",
                                                                            "Marshall Harvey Stone",
                                                                            "1932").setEdition("4th Printing (1951)")
                                                                                   .setVolume("XV")
                                                                                   .setSeries("Colloquium Publications")
                                                                                   .setPublisher("American Mathematical Society")
                                                                                   .setAddress("501 West 116th Street");

  public static Book       oneParameterSemigroups                = new Book("One-Parameter Semigroups",
                                                                            "E.B. Davies",
                                                                            "1980").setPublisher("Academic Press")
                                                                                   .setAddress("111 Fifth Avenue New York, New York 10003")
                                                                                   .setSeries("L.M.S. Monographs");

  public static Article    orthopolyFourierTransforms            = new Article("The finite Fourier transform of classical polynomials",
                                                                               "Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                                               "2015",
                                                                               "Journal of the Australian Mathematical Society",
                                                                               "98",
                                                                               "145--160").setPublisher("Cambridge University Press");

  public static Book       probabilityAndSchrödingersMechanics   = new Book("Probability and Schrödingers Mechanics",
                                                                            "David B. Cook",
                                                                            "2002").setPublisher("World Scientific");

  public static Book       psychologyOfMathematicalInvention     = new Book("The Psychology of Invention in the Mathematical Field",
                                                                            "Jacques Hadamard",
                                                                            "1954").setSeries("Dover books on advanced mathematics")
                                                                                   .setEdition("enlarged, unaltered, and unabridged 1949 edition reprint")
                                                                                   .setPublisher("Dover publications, Inc.")
                                                                                   .setAddress("180 Varick Street New York, N.Y. 10014");

  public static Book       randomMatrices                        = new Book("Random Matrices",
                                                                            "Madan Lal Mehta",
                                                                            "2004").setEdition("3rd")
                                                                                   .setSeries("Pure and Applied Mathematics")
                                                                                   .setVolume("142");

  public static Article    randomProcessWithStationaryIncrements = new Article("A note on processes with random stationary increments",
                                                                               "Haimeng Zhang and Chunfeng Huang",
                                                                               "2014",
                                                                               "Statistics and Probabiltiy Letters",
                                                                               "94",
                                                                               "153-161");

  public static Article    simpleSymbolManipulation              = new Article("ALGLIB, a simple symbol-manipulation package",
                                                                               "J. M. Shearer and M. A. Wolfe",
                                                                               "1985",
                                                                               "Communications of the ACM",
                                                                               "28",
                                                                               "820–825").setNumber("8");

  public static Book       skewOrthogonalRandomMatrices          = new Book("Skew-Orthogonal Polynomials and Random Matrix Theory",
                                                                            "Saugata Ghosh",
                                                                            "2009").setSeries("CRM Monograph Series")
                                                                                   .setVolume("28")
                                                                                   .setPublisher("American Mathematical Society");

  public static Book       stationaryAndRelatedProcesses         = new Book("Stationary and Related Processes: Sample Function Properties and Their Applications",
                                                                            "Harald Cramér and M.R. Leadbetter",
                                                                            "1967").setSeries("Wiley Series in Probability and Mathematical Statistics");

  public static Book       stationaryCorrelationFunctions        = new Book("Correlation Theory of Stationary and Related Random Functions",
                                                                            "Yaglom, A.M.",
                                                                            "1987").setSeries("Applied Probability")
                                                                                   .setPublisher("Springer New York")
                                                                                   .setVolume("I: Basic Results");

  public static Book       stochasticFiniteElements              = new Book("Stochastic finite elements: a spectral approach",
                                                                            "Ghanem, Roger G. and Spanos, Pol D.",
                                                                            "1991").setPublisher("Springer-Verlag")
                                                                                   .setAddress("Berlin, Heidelberg");

  public static Book       stochasticProcessInferenceTheory      = new Book("Stochastic Processes: Inference Theory",
                                                                            "Malempati M. Rao",
                                                                            "2014").setPublisher("Springer")
                                                                                   .setEdition("2nd")
                                                                                   .setSeries("Springer Monographs in Mathematics");

  public static Book       stochasticQuantumMechanicalMethods    = new Book("Stochastic Methods in Quantum Mechanics",
                                                                            "Stanley P. Gudder",
                                                                            "1979").setSeries("North Holland Series in Probability and Applied Mathematics")
                                                                                   .setPublisher("Elsevier North Holland");

  public static void main(String args[])
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
  };

}
