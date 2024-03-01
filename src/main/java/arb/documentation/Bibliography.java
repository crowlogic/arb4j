package arb.documentation;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import arb.documentation.references.Article;
import arb.documentation.references.Book;
import arb.documentation.references.Miscellaneous;
import arb.documentation.references.Reference;

/**
 * A list of {@link Reference}s
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Bibliography extends
                          AbstractBibliography
{
  public static Book          lecturesOnDifferentialAndIntegralEquations              = new Book("Lectures on Differential and Integral Equations","吉田 耕作(Kōsaku Yosida)","1960").setSeries("Pure and Applied Mathematics").setVolume("X").setPublisher("Interscience Publishers, a division of John Wiley & Sons Inc.)").setAddress("New York/London/Sydney");

  public static Article       isotropyPrevalenceInSpatialStatistics                   = new Article("Why is isotropy so prevalent in spatial statistics?",
                                                                                                    "Chunsheng Ma",
                                                                                                    "2007",
                                                                                                    "Proceedings of the American Mathematical Society",
                                                                                                    "135",
                                                                                                    "865–871").setNumber("3")
                                                                                                              .setPublisher("American Mathematical Society");

  public static Article       stochasticProcessesAsCurvesInHilbertSpace               = new Article("Stochastic processes as curves in Hilbert space",
                                                                                                    "Harald Cramér",
                                                                                                    "1964",
                                                                                                    "Theory of Probability & Its Applications",
                                                                                                    "9",
                                                                                                    "169–179").setNumber("2")
                                                                                                              .setPublisher("SIAM");

  public static Article       skewOrthogonalPolynomialsAndRandomMatrixTheory          = new Article("Generalized Christoffel-Darboux formula for skew-orthogonal polynomials and random matrix theory",
                                                                                                    "Saugata Ghosh",
                                                                                                    "2006",
                                                                                                    "Journal of Physics A: mathematical and General",
                                                                                                    "39",
                                                                                                    "8775").setNumber("28")
                                                                                                           .setPublisher("IOP Publishing");

  public static Article       orthogonalPolynomialsAndQuadraticExtremalProblems       = new Article("Orthogonal Polynomials and Quadratic Extremal Problems",
                                                                                                    "McDougall, J",
                                                                                                    "2002",
                                                                                                    "Transactions of the American Mathematical Society",
                                                                                                    "354",
                                                                                                    "2341--2357").setNumber("6");

  public static Article       orthogonalPolynomialsAndSingularSturmLiouvilleSystemsI  = new Article("Orthogonal polynomials and Singular Sturm-Liouville Systems, I",
                                                                                                    "Littlejohn, Lance L and Krall, Allan M",
                                                                                                    "1986",
                                                                                                    "The Rocky Mountain Journal of Mathematics",
                                                                                                    "16",
                                                                                                    "435--479").setNumber("3");

  public static Book          stochasticProcessesHarmonizableTheory                   = new Book("Stochastic Processes: Harmonizable Theory",
                                                                                                 "M.M. Rao",
                                                                                                 "2020").setPublisher("World Scientific Publishing Co. Pte. Ltd.")
                                                                                                        .setAddress("Hackensack, NJ")
                                                                                                        .setSeries("Series on Multivariate Analysis")
                                                                                                        .setVolume("12")
                                                                                                        .setIsbn("9789811213656");

  public static Article       theApproximateSolutionOfRiccatiEquation                 = new Article("The Approximate Solution of Riccati's Equation",
                                                                                                    "F. Max Stein and R. G. Huffstutler",
                                                                                                    "1966",
                                                                                                    "SIAM Journal on Numerical Analysis",
                                                                                                    "3",
                                                                                                    "425-434").setNumber("3");

  public static Article       newBesselFunctionIdentity                               = new Article("Circular motion analogue Unruh effect in a 2+1 thermal bath: robbing from the rich and giving to the poor",
                                                                                                    "D Bunney, Cameron R and Louko, Jorma",
                                                                                                    "2023",
                                                                                                    "Classical and Quantum Gravity",
                                                                                                    "40",
                                                                                                    "155001 (27 pages)").setNumber("15");

  public static Article       theDistributionOfCertainMatrixEnsemblesEigenvalues      = new Article("On the distribution of eigenvalues of certain matrix ensembles",
                                                                                                    "{Bogomolny}, E. and {Bohigas}, O. and {Pato}, M.~P.",
                                                                                                    "1997",
                                                                                                    "Physical Review E",
                                                                                                    "55",
                                                                                                    "6707-6718").setNumber("6");

  public static Article       theBesselPolynomialMoments                              = new Article("The Besel Polynomial Moment Problem",
                                                                                                    "A.M. Krall",
                                                                                                    "1981",
                                                                                                    "Acta Mathematica Academiae Scientiarum Hungarica",
                                                                                                    "38",
                                                                                                    "105-107");

  public static Book          extremesOfRandomProcesses                               = new Book("Extremes and Related Properties of Random Sequences and Processes",
                                                                                                 "Georg Lindgren, Holger Rootzén, and M. R. Leadbetter",
                                                                                                 "1983").setSeries("Springer Series in Statistics")
                                                                                                        .setPublisher("Springer-Verlag New York Inc.");

  public static Book          functionalAnalysisRieszNagy                             = new Book("Functional Analysis",
                                                                                                 "Frigyes Riesz and Béla Sz.-Nagy",
                                                                                                 "2012").setPublisher("Dover Publications")
                                                                                                        .setSeries("Dover Books on Mathematics")
                                                                                                        .setEdition("unabridged republication of 1955");

  public static Book          functionalAnalysisYosida                                = new Book("Functional Analysis",
                                                                                                 "吉田 耕作(Kōsaku Yosida)",
                                                                                                 "1995").setPublisher("Springer Berlin Heidelberg")
                                                                                                        .setSeries("Classics in Mathematics")
                                                                                                        .setEdition("Reprint of the 1980 Edition");

  public static Book          introductionToQuantumGravitationalEffects               = new Book("Introduction to quantum effects in gravity",
                                                                                                 "Viatcheslav Mukhanov, Sergei Winitzki",
                                                                                                 "2007").setEdition("1ˢᵗ")
                                                                                                        .setPublisher("Cambridge University Press");

  public static Book          linearHilbertSpaceTransforms                            = new Book("Linear Transformations in Hilbert Space",
                                                                                                 "Marshall Harvey Stone",
                                                                                                 "1932").setEdition("4th Printing (1951)")
                                                                                                        .setVolume("XV")
                                                                                                        .setSeries("Colloquium Publications")
                                                                                                        .setPublisher("American Mathematical Society")
                                                                                                        .setAddress("501 West 116th Street");

  public static Miscellaneous oeisA001790                                             = new Miscellaneous("A001790 Numerators in the expansion of $\\frac{1}{\\sqrt{1-x}}$",
                                                                                                          "OEIS Foundation Inc.",
                                                                                                          "2024",
                                                                                                          "\\url{http://oeis.org/A001790}",
                                                                                                          "This sequence gives the numerators of the Maclaurin series of the "
                                                                                                                        + "Lorentz factor (see Wikipedia link) of $\\frac{1}{\\sqrt{1-b^2}} = \\frac{dt}{d\\tau}$ "
                                                                                                                        + "where $b=\\frac{u}{c}$ is the velocity in terms of the speed of light c, "
                                                                                                                        + "u is the velocity as observed in the reference frame where time "
                                                                                                                        + "t is measured and tau is the proper time. "
                                                                                                                        + "- Stephen Crowley, Apr 03 2007",
                                                                                                          "http://oeis.org/A001790");

  public static Book          oneParameterSemigroups                                  = new Book("One-Parameter Semigroups",
                                                                                                 "E.B. Davies",
                                                                                                 "1980").setPublisher("Academic Press")
                                                                                                        .setAddress("111 Fifth Avenue New York, New York 10003")
                                                                                                        .setSeries("L.M.S. Monographs");

  public static Article       finiteFourierTransformsOfClassicalOrthogonalPolynomials = new Article("The finite Fourier transform of classical polynomials",
                                                                                                    "Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                                                                    "2015",
                                                                                                    "Journal of the Australian Mathematical Society",
                                                                                                    "98",
                                                                                                    "145--160").setPublisher("Cambridge University Press");

  public static Book          probabilityAndSchrödingersMechanics                     = new Book("Probability and Schrödingers Mechanics",
                                                                                                 "David B. Cook",
                                                                                                 "2002").setPublisher("World Scientific");

  public static Book          psychologyOfMathematicalInvention                       = new Book("The Psychology of Invention in the Mathematical Field",
                                                                                                 "Jacques Hadamard",
                                                                                                 "1954").setSeries("Dover books on advanced mathematics")
                                                                                                        .setEdition("enlarged, unaltered, and unabridged reprint of the 1949")
                                                                                                        .setPublisher("Dover publications, Inc.")
                                                                                                        .setAddress("180 Varick Street New York, N.Y. 10014");

  public static Book          randomMatrices                                          = new Book("Random Matrices",
                                                                                                 "Madan Lal Mehta",
                                                                                                 "2004").setEdition("3rd")
                                                                                                        .setSeries("Pure and Applied Mathematics")
                                                                                                        .setVolume("142");

  public static Article       randomProcessWithStationaryIncrements                   = new Article("A note on processes with random stationary increments",
                                                                                                    "Haimeng Zhang and Chunfeng Huang",
                                                                                                    "2014",
                                                                                                    "Statistics and Probabiltiy Letters",
                                                                                                    "94",
                                                                                                    "153-161");

  public static Article       simpleSymbolManipulation                                = new Article("ALGLIB, a simple symbol-manipulation package",
                                                                                                    "J. M. Shearer and M. A. Wolfe",
                                                                                                    "1985",
                                                                                                    "Communications of the ACM",
                                                                                                    "28",
                                                                                                    "820–825").setNumber("8");

  public static Book          skewOrthogonalRandomMatrices                            = new Book("Skew-Orthogonal Polynomials and Random Matrix Theory",
                                                                                                 "Saugata Ghosh",
                                                                                                 "2009").setSeries("CRM Monograph Series")
                                                                                                        .setVolume("28")
                                                                                                        .setPublisher("American Mathematical Society");

  public static Book          stationaryAndRelatedProcesses                           = new Book("Stationary and Related Processes: Sample Function Properties and Their Applications",
                                                                                                 "Harald Cramér and M.R. Leadbetter",
                                                                                                 "1967").setSeries("Wiley Series in Probability and Mathematical Statistics");

  public static Book          stationaryCorrelationFunctions                          = new Book("Correlation Theory of Stationary and Related Random Functions",
                                                                                                 "Yaglom, A.M.",
                                                                                                 "1987").setSeries("Applied Probability")
                                                                                                        .setPublisher("Springer New York")
                                                                                                        .setVolume("I: Basic Results");

  public static Book          stochasticFiniteElements                                = new Book("Stochastic finite elements: a spectral approach",
                                                                                                 "Ghanem, Roger G. and Spanos, Pol D.",
                                                                                                 "1991").setPublisher("Springer-Verlag")
                                                                                                        .setAddress("Berlin, Heidelberg");

  public static Book          stochasticProcessInferenceTheory                        = new Book("Stochastic Processes: Inference Theory",
                                                                                                 "Malempati M. Rao",
                                                                                                 "2014").setPublisher("Springer")
                                                                                                        .setEdition("2nd")
                                                                                                        .setSeries("Springer Monographs in Mathematics");

  public static Book          stochasticQuantumMechanicalMethods                      = new Book("Stochastic Methods in Quantum Mechanics",
                                                                                                 "Stanley P. Gudder",
                                                                                                 "1979").setSeries("North Holland Series in Probability and Applied Mathematics")
                                                                                                        .setPublisher("Elsevier North Holland");

  public static void main(String args[]) throws IOException
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
    Path path = Paths.get("docs/refs2.bib");
    Files.write(path, bibiography.toString().getBytes());
    System.out.println("wrote " + path);
  }
}
