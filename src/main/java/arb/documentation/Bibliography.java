package arb.documentation;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import arb.documentation.references.Article;
import arb.documentation.references.Book;

/**
 * Bibliography<br>
 * <br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Bibliography extends
                          AbstractBibliography
{
  public static Article variousRandomProcessEnvelopeDefinitions                =
                                                                new Article("On various definitions of the envelope of a random process",
                                                                            "R.S. Langley",
                                                                            "1986",
                                                                            "Journal of Sound and Vibration",
                                                                            "105",
                                                                            "503-512").setNumber("3")
                                                                                      .setPublisher("Elsevier");

  public static Article characterizationOscillatoryProcesses                   =
                                                             new Article("A characterization of oscillatory processes and their prediction",
                                                                         "V. Mandrekar",
                                                                         "1972",
                                                                         "Proceedings of the American Mathematical Society",
                                                                         "32",
                                                                         "280--284").setNumber("1");

  public static Article predictionNonStationaryProcesses                       =
                                                         new Article("On the prediction of non-stationary processes",
                                                                     "N. A. Abdrabbo and M. B. Priestley",
                                                                     "1967",
                                                                     "Journal of the Royal Statistical Society Series B: Statistical Methodology",
                                                                     "29",
                                                                     "570--585").setNumber("3")
                                                                                .setPublisher("Oxford University Press");

  public static Article envelopeUniquenessOscillatoryProcess                   =
                                                             new Article("A uniqueness problem for the envelope of an oscillatory process",
                                                                         "A. M. Hasofer",
                                                                         "1979",
                                                                         "Journal of Applied Probability",
                                                                         "16",
                                                                         "822–829").setNumber("4");

  public static Article envelopeOscillatoryProcessUpcrossings                  =
                                                              new Article("The Envelope of an Oscillatory Process and Its Upcrossings",
                                                                          "A. M. Hasofer and P. Petocz",
                                                                          "1978",
                                                                          "Advances in Applied Probability",
                                                                          "10",
                                                                          "711--716").setNumber("4")
                                                                                     .setPublisher("Applied Probability Trust");
  public static Article oscillatoryHarmonizableProcessEnvelope                 =
                                                               new Article("The envelope of an oscillatory harmonizable process",
                                                                           "Randall J. Swift",
                                                                           "2000",
                                                                           "Journal of Interdisciplinary Mathematics",
                                                                           "3",
                                                                           "83-91");

  public static Article linearPredictionNonStationaryProcesses                 =
                                                               new Article("On the linear prediction problem of certain non-stationary stochastic processes",
                                                                           "Hannu Niemi",
                                                                           "1976",
                                                                           "Mathematica Scandinavica",
                                                                           "39",
                                                                           "146--160").setNumber("1")
                                                                                      .setPublisher("JSTOR");

  public static Article naimarkDilationTheoremRemarks                          =
                                                      new Article("Remarks on Naimark dilation theorem",
                                                                  "Sergiusz Kuźel",
                                                                  "2024",
                                                                  "Canadian Mathematical Bulletin",
                                                                  "67",
                                                                  "469--477").setNumber("2")
                                                                             .setPublisher("Cambridge University Press on behalf of The Canadian Mathematical Society");

  public static Article spectralAnalysisOfAbstractFunctions                    =
                                                            new Article("Spectral Analysis of Abstract Functions",
                                                                        "Yu. A. Rozanov",
                                                                        "1959",
                                                                        "Theory of Probability & Its Applications",
                                                                        "4",
                                                                        "271-287").setNumber("3");

  public static Article stonesTheoremAndCompleteness                           =
                                                     new Article("Stone's theorem and completeness of orthogonal systems",
                                                                 "BD Craven",
                                                                 "1971",
                                                                 "Journal of the Australian Mathematical Society",
                                                                 "12",
                                                                 "211-223").setNumber("2")
                                                                           .setPublisher("Cambridge University Press");

  public static Book    riemannHypothesisEquivalents                           =
                                                     new Book("Equivalents of the Riemann Hypothesis",
                                                              "Kevin A. Broughan",
                                                              "2023").setPublisher("Cambridge University Press")
                                                                     .setVolume("3");

  public static Article symmetrisableFunctionsExpansion                        =
                                                        new Article("Symmetrisable Functions and Their Expansion in Terms of Biorthogonal Functions",
                                                                    "James Mercer",
                                                                    "1920",
                                                                    "Proceedings of the Royal Society of London. Series A, Containing Papers of a Mathematical and Physical Character",
                                                                    "97",
                                                                    "401-413").setNumber("686")
                                                                              .setPublisher("The Royal Society");

  public static Article besselFunctionsAndWaveEquation                         =
                                                       new Article("Bessel Functions and the Wave Equation",
                                                                   "Alberto Torchinsky",
                                                                   "2018",
                                                                   "arXiv preprint arXiv:1812.09265",
                                                                   "",
                                                                   "");

  public static Article analyticStationaryRKHS                                 =
                                               new Article("Reproducing Kernel Hilbert Spaces Associated with Analytic Translation-Invariant Mercer Kernels",
                                                           "Hong-Wei Sun and Ding-Xuan Zhou",
                                                           "2008",
                                                           "Journal of Fourier Analysis and Applications",
                                                           "14",
                                                           "89-101").setNumber("1");

  public static Article newOperationalMatrixFractionalIntegration              =
                                                                  new Article("A New Operational Matrix of Fractional Integration for Shifted Jacobi Polynomials.",
                                                                              "Ali H. Bhrawy, Mohamed Mahmoud Tharwat, Mohammad A. Alghamdi",
                                                                              "2014",
                                                                              "Bulletin of the Malaysian Mathematical Sciences Society",
                                                                              "37",
                                                                              null).setNumber("4");

  public static Book    rkhsIntro                                              =
                                  new Book("An Introduction to the Theory of Reproducing Kernel Hilbert Spaces",
                                           "V.I. Paulsen and M. Raghupathi",
                                           "2016").setPublisher("Cambridge University Press")
                                                  .setIsbn("9781107104099")
                                                  .setSeries("Cambridge Studies in Advanced Mathematics");

  public static Article stationaryLevelCrossingMoments                         =
                                                       new Article("The Moments of the Number of Crossings of a Level by a Stationary Normal Process",
                                                                   "Harald Cramér and M. R. Leadbetter",
                                                                   "1965",
                                                                   "The Annals of Mathematical Statistics",
                                                                   "36",
                                                                   "1656-1663").setNumber("6")
                                                                               .setPublisher("Institute of Mathematical Statistics");

  public static Article radonNikodymWienerDerivatives                          =
                                                      new Article("The Structure of Radon-Nikodym Derivatives with Respect to Wiener and Related Measures",
                                                                  "Thomas Kailath",
                                                                  "1971",
                                                                  "The Annals of Mathematical Statistics",
                                                                  "42",
                                                                  "1054-1067").setNumber("3")
                                                                              .setPublisher("Institute of Mathematical Statistics");

  public static Article measuresEquivalentToWienerMeasure                      =
                                                          new Article("On Measures Equivalent to Wiener Measure",
                                                                      "Thomas Kailath",
                                                                      "1967",
                                                                      "The Annals of Mathematical Statistics",
                                                                      "38",
                                                                      "261-263").setNumber("1")
                                                                                .setPublisher("Institute of Mathematical Statistics");

  public static Article stochasticProcessesFourierTransforms                   =
                                                             new Article("Stochastic processes as Fourier transforms of stochastic measures",
                                                                         "Hannu Niemi",
                                                                         "1975",
                                                                         "Annales Fennici Mathematici",
                                                                         null,
                                                                         null).setNumber("591");

  public static Article harmonicProbabilisticApproachesToTheRiemannHypothesis  =
                                                                              new Article("Harmonic and Probabilistic Approaches to Zeros of Riemann's Zeta Function",
                                                                                          "M. M. Rao",
                                                                                          "2012",
                                                                                          "Stochastic Analysis and Applications",
                                                                                          "30",
                                                                                          "906-915").setNumber("5")
                                                                                                    .setPublisher("Taylor & Francis");

  public static Article levelAndCurveCrossings                                 =
                                               new Article("On Crossings of Levels and Curves by a Wide Class of Stochastic Processes",
                                                           "M. R. Leadbetter",
                                                           "1966",
                                                           "The Annals of Mathematical Statistics",
                                                           "37",
                                                           "260-267").setNumber("1")
                                                                     .setPublisher("Institute of Mathematical Statistics");

  public static Article specialRepresentationsOfWeaklyHarmonizableProcesses    =
                                                                            new Article("Special representations of weakly harmonizable processes",
                                                                                        "Derek K. Chang and M.M. Rao",
                                                                                        "1988",
                                                                                        "Stochastic Analysis and Applications",
                                                                                        "6",
                                                                                        "169-189").setNumber("2")
                                                                                                  .setPublisher("Taylor & Francis");

  public static Article gaussianProcessLevelCrossings                          =
                                                      new Article("On the Number of Intersections of a Level by a Gaussian Stochastic Process. I",
                                                                  "Yu. K. Belyaev",
                                                                  "1966",
                                                                  "Theory of Probability & Its Applications",
                                                                  "11",
                                                                  "106-113").setNumber("1");

  public static Article evolutionWithoutEvolution                              =
                                                  new Article("Evolution without evolution: Dynamics described by stationary observables",
                                                              "D. N. Page and W. K. Wootters",
                                                              "1983",
                                                              "Physical Review D",
                                                              "27",
                                                              "2885–2892").setNumber("12");

  public static Article cramerStochasticProcessTheoryContribution              =
                                                                  new Article("A Contribution to the Theory of Stochastic Processes",
                                                                              "Harald Cramér",
                                                                              "1951",
                                                                              "Proceedings of the Second Berkeley Symposium on Mathematical Statistics and Probability",
                                                                              "2",
                                                                              "329-339");

  public static Article stationaryGaussianProcessSampleFunctionProperties      =
                                                                          new Article("Local Properties of the Sample Functions of Stationary Gaussian Processes",
                                                                                      "Yu. K. Belyaev",
                                                                                      "1960",
                                                                                      "Theory of Probability and its Applications",
                                                                                      "5",
                                                                                      "117-120").setNumber("1")
                                                                                                .setVolume("5");

  public static Article towardsStandardModelWithoutTheHiggsBoson               =
                                                                 new Article("Towards Standard Model without the Higgs boson",
                                                                             "A. Sevostyanov",
                                                                             "2008",
                                                                             "arXiv:hep-th/0702149v1",
                                                                             "",
                                                                             "",
                                                                             "");

  public static Article gauntCoeffecientsSphericalHarmonicsRecurrenceRelation  =
                                                                              new Article("Evaluation of the Gaunt Coefficients by Using Recurrence Relations for Spherical Harmonics",
                                                                                          "{\\\"O}zay, Selda",
                                                                                          "2023",
                                                                                          "S{\\\"u}leyman Demirel University Faculty of Arts and Science Journal of Science",
                                                                                          "18",
                                                                                          "213-222",
                                                                                          "").setNumber("3");

  public static Article mercerTheoremForRKHSOnNonCompactSets                   =
                                                             new Article("Mercer theorem for RKHS on noncompact sets",
                                                                         "Hongwei Sun",
                                                                         "2005",
                                                                         "Journal of Complexity",
                                                                         "21",
                                                                         "337-349");

  public static Article groupsSpecialFunctionsAndRiggedHilbertSpaces           =
                                                                     new Article("Groups, Special Functions, and Rigged Hilbert Spaces",
                                                                                 "Celeghini, Enrico and Gadella, Manuel and del Olmo, Mariano A",
                                                                                 "2019",
                                                                                 "Axioms",
                                                                                 "3",
                                                                                 "89",
                                                                                 "MDPI");

  public static Article bilinearOrthogonalExpansionsAndIntegralOperatorSpectra =
                                                                               new Article("Bilinear biorthogonal expansions and the spectrum of an integral operator",
                                                                                           "Abreu, Lu{\\'\\i}s Daniel and Ciaurri, {\\'O}scar and Varona, Juan Luis",
                                                                                           "2009",
                                                                                           "Pr{\\'e}-Publica{\\c{c}}{\\~o}es DMUC",
                                                                                           "",
                                                                                           "").setNumber("09-32");

  public static Article besselChebyshevDuality                                 =
                                               new Article("Duality between Bessel Functions and Chebyshev Polynomials in Expansions of Functions",
                                                           "Alfred Wünsche",
                                                           "2023",
                                                           "Advances in Pure Mathematics",
                                                           "13",
                                                           "504-536").setNumber("8");

  public static Article shiftedJacobiPolynomialIntegralOperationalMatrix       =
                                                                         new Article("The shifted Jacobi polynomial integral operational matrix for solving Riccati differential equation of fractional order",
                                                                                     "A. Neamaty and B. Agheli and R. Darzi",
                                                                                     "2015",
                                                                                     "Applications and Applied Mathematics: An International Journal (AAM)",
                                                                                     "10",
                                                                                     "878-892").setNumber("2");

  public static Article orthonormalExpansionsForTranslationInvariantKernels    =
                                                                            new Article("Orthonormal expansions for translation-invariant kernels",
                                                                                        "Filip Tronarp, Toni Karvonen",
                                                                                        "2024",
                                                                                        "Journal of Approximation Theory",
                                                                                        "302",
                                                                                        "106055");

  public static Article nonCommutativeOrbitSpaceGeometry                       =
                                                         new Article("The Geometry of the Orbit Space for Non-Abelian Gauge Theories",
                                                                     "I M Singer",
                                                                     "1981",
                                                                     "Physica Scripta",
                                                                     "24",
                                                                     "817").setNumber("5");

  public static Article betaIntegralsAndOrthogonalPolynomials                  =
                                                              new Article("Beta integrals and the associated orthogonal polynomials",
                                                                          "Askey, R.",
                                                                          "1989",
                                                                          "Number Theory 1987 Madras Conference Proceedings",
                                                                          "",
                                                                          "84-121");

  public static Article theBesselPolynomials                                   =
                                             new Article("A New Class of Orthogonal Polynomials: The Bessel Polynomials",
                                                         "H.L. Krall and Orrin Frink",
                                                         "1949",
                                                         "Transactions of the American Mathematical Society",
                                                         "65",
                                                         "100-115").setNumber("1");

  public static Article isotropicCharacteristicFunctions                       =
                                                         new Article("A Class of Isotropic Distributions in $\\mathbb{R}_n$ and Their Characteristic Functions",
                                                                     "Simeon M. Berman",
                                                                     "1978",
                                                                     "Pacific Journal of Mathematics",
                                                                     "78",
                                                                     null).setNumber("1");

  public static Book    besselFunctionTreatise                                 =
                                               new Book("A Treatise on the Theory of Bessel Functions",
                                                        "G.N. Watson",
                                                        "1944").setPublisher("Cambridge University Press")
                                                               .setEdition("2nd");

  public static Book    correlationTheoryOfStationaryRandomProcesses           =
                                                                     new Book("Correlation Theory of Stationary and Related Random Functions",
                                                                              "Yaglom, A.M.",
                                                                              "1987").setSeries("Applied Probability")
                                                                                     .setPublisher("Springer New York")
                                                                                     .setVolume("I: Basic Results");

  public static Article finiteFourierTransforms                                =
                                                new Article("The finite Fourier transform of classical polynomials",
                                                            "Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                            "2015",
                                                            "Journal of the Australian Mathematical Society",
                                                            "98",
                                                            "145--160").setPublisher("Cambridge University Press");

  public static Book    functionalAnalysisRieszNagy                            = new Book("Functional Analysis",
                                                                                          "Frigyes Riesz and Béla Sz.-Nagy",
                                                                                          "2012").setPublisher("Dover Publications")
                                                                                                 .setSeries("Dover Books on Mathematics")
                                                                                                 .setEdition("unabridged republication of 1955");

  public static Book    functionalAnalysisYosida                               = new Book("Functional Analysis",
                                                                                          "吉田 耕作(Kōsaku Yosida)",
                                                                                          "1995").setPublisher("Springer Berlin Heidelberg")
                                                                                                 .setSeries("Classics in Mathematics")
                                                                                                 .setEdition("Reprint of the 1980 Edition");

  public static Article isotropyPrevalenceInSpatialStatistics                  =
                                                              new Article("Why is isotropy so prevalent in spatial statistics?",
                                                                          "Chunsheng Ma",
                                                                          "2007",
                                                                          "Proceedings of the American Mathematical Society",
                                                                          "135",
                                                                          "865–871").setNumber("3")
                                                                                    .setPublisher("American Mathematical Society");

  public static Book    lecturesOnDifferentialAndIntegralEquations             =
                                                                   new Book("Lectures on Differential and Integral Equations",
                                                                            "吉田 耕作(Kōsaku Yosida)",
                                                                            "1960").setPublisher("Interscience Publishers/John Wiley & Sons Inc.")
                                                                                   .setAddress("New York/London/Sydney")
                                                                                   .setSeries("Pure and Applied Mathematics")
                                                                                   .setVolume("X");

  public static Book    linearHilbertSpaceTransforms                           =
                                                     new Book("Linear Transformations in Hilbert Space",
                                                              "Marshall Harvey Stone",
                                                              "1932").setEdition("4th Printing (1951)")
                                                                     .setVolume("XV")
                                                                     .setSeries("Colloquium Publications")
                                                                     .setPublisher("American Mathematical Society")
                                                                     .setAddress("501 West 116th Street");

  public static Article lommelAndBesselPolynomials                             =
                                                   new Article("On Lommel and Bessel polynomials",
                                                               "David Dickinson",
                                                               "1954",
                                                               "Proceedings of the American Mathematical Society",
                                                               "5",
                                                               "946-956");

  public static Book    oneParameterSemigroups                                 = new Book("One-Parameter Semigroups",
                                                                                          "E.B. Davies",
                                                                                          "1980").setPublisher("Academic Press")
                                                                                                 .setAddress("111 Fifth Avenue New York, New York 10003")
                                                                                                 .setSeries("L.M.S. Monographs");

  public static Article randomProcessWithStationaryIncrements                  =
                                                              new Article("A note on processes with random stationary increments",
                                                                          "Haimeng Zhang and Chunfeng Huang",
                                                                          "2014",
                                                                          "Statistics and Probabiltiy Letters",
                                                                          "94",
                                                                          "153-161");

  public static Article simpleSymbolManipulation                               =
                                                 new Article("ALGLIB, a simple symbol-manipulation package",
                                                             "J. M. Shearer and M. A. Wolfe",
                                                             "1985",
                                                             "Communications of the ACM",
                                                             "28",
                                                             "820–825").setNumber("8");

  public static Book    specialFunctionsOfMathematicalPhysics                  =
                                                              new Book("Formulas and Theorems for the Special Functions of Mathematical Physics",
                                                                       "Wilhelm Magnus, Fritz Oberhettinger, Raj Pal Soni",
                                                                       "1966").setPublisher("Springer")
                                                                              .setSeries("Die Grundlehren der mathematischen Wissenschaften in Einzeldarstellungen")
                                                                              .setVolume("52")
                                                                              .setEdition("VIII, 508 p. ; 24 cm. 3rd enl. ed.");

  public static Book    stationaryAndRelatedStochasticProcesses                =
                                                                new Book("Stationary and Related Processes: Sample Function Properties and Their Applications",
                                                                         "Harald Cramér and M.R. Leadbetter",
                                                                         "1967").setSeries("Wiley Series in Probability and Mathematical Statistics");

  public static Article stochasticProcessesAsCurvesInHilbertSpace              =
                                                                  new Article("Stochastic processes as curves in Hilbert space",
                                                                              "Harald Cramér",
                                                                              "1964",
                                                                              "Theory of Probability & Its Applications",
                                                                              "9",
                                                                              "169–179").setNumber("2")
                                                                                        .setPublisher("SIAM");

  public static Book    stochasticProcessesInferenceTheory                     =
                                                           new Book("Stochastic Processes: Inference Theory",
                                                                    "Malempati M. Rao",
                                                                    "2014").setPublisher("Springer")
                                                                           .setEdition("2nd")
                                                                           .setSeries("Springer Monographs in Mathematics");

  public static Book    stochasticQuantumMechanicalMethods                     =
                                                           new Book("Stochastic Methods in Quantum Mechanics",
                                                                    "Stanley P. Gudder",
                                                                    "1979").setSeries("North Holland Series in Probability and Applied Mathematics")
                                                                           .setPublisher("Elsevier North Holland");

  public static Article voroninUniversalityTheoremForTheRiemannZetaFunction    =
                                                                            new Article("On the Voronin’s universality theorem for the Riemann zeta-function",
                                                                                        "Ramunas Garunkštis",
                                                                                        "2003",
                                                                                        "Fizikos ir Matematikos Fakulteto Mokslinio Seminaro Darbai.(Proceedings of Scientific Seminar of the Faculty of Physics and Mathematics)",
                                                                                        "6",
                                                                                        "29-33").setPublisher("Siauliu Univ. Leidykla, Vilnius. (Siauliai Univ. Publishing house, Vilnius.)");

  public static Article waveFunctionOfTheUniverse                              =
                                                  new Article("Wave function of the Universe",
                                                              "James B. Hartle and Stephen W. Hawking",
                                                              "1983",
                                                              "Physical Review D",
                                                              "28",
                                                              "2965-2975").setNumber("12");

  public static Book    whittakerAndWatsonCourseOfModernAnalysis               = new Book("A course of modern analysis",
                                                                                          "Edmund Taylor Whittaker, George Neville Watson",
                                                                                          "1920").setPublisher("University Press");

  public static void main(String args[]) throws IOException
  {
    Bibliography bibiography = new Bibliography();
    System.out.println(bibiography);
    Path path = Paths.get("docs/refs.bib");
    Files.write(path, bibiography.toString().getBytes());
    System.out.println("wrote " + path);
  }
}
