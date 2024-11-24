package arb.documentation;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import arb.documentation.references.Article;
import arb.documentation.references.Book;
import arb.documentation.references.MastersThesis;
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
  public static Article       stationaryGaussianProcessSampleFunctionProperties             =
                                                                                new Article("Local Properties of the Sample Functions of Stationary Gaussian Processes",
                                                                                            "Yu. K. Belyaev",
                                                                                            "1960",
                                                                                            "Theory of Probability and its Applications",
                                                                                            "5",
                                                                                            "117-120").setNumber("1")
                                                                                                      .setVolume("5");
  
  public static Book          probabilityTheoryI                                            =
                                                 new Book("Probability Theory I",
                                                          "M. Loève",
                                                          "1977",
                                                          null).setEdition("4th").setPublisher("Springer-Verlag");

  public static Article       quadraticDirichletSpaceExtremals                              =
                                                               new Article("A Quadratic Extremal Problem on the Dirichlet Space",
                                                                           "Stephen D. Fisher",
                                                                           "1995",
                                                                           "Complex Variables",
                                                                           "26",
                                                                           "367-380");

  public static Article       towardsStandardModelWithoutTheHiggsBoson                      =
                                                                       new Article("Towards Standard Model without the Higgs boson",
                                                                                   "A. Sevostyanov",
                                                                                   "2008",
                                                                                   "arXiv:hep-th/0702149v1",
                                                                                   "",
                                                                                   "",
                                                                                   "");

  public static Article       gauntCoeffecientsSphericalHarmonicsRecurrenceRelation         =
                                                                                    new Article("Evaluation of the Gaunt Coefficients by Using Recurrence Relations for Spherical Harmonics",
                                                                                                "{\\\"O}zay, Selda",
                                                                                                "2023",
                                                                                                "S{\\\"u}leyman Demirel University Faculty of Arts and Science Journal of Science",
                                                                                                "18",
                                                                                                "213-222",
                                                                                                "").setNumber("3");

  public static Article       rkhsTutorialSurvey                                            =
                                                 new Article("Reproducing Kernel Hilbert Space, Mercer's Theorem, Eigenfunctions, Nystr\\\"om Method, and Use of Kernels in Machine Learning: Tutorial and Survey",
                                                             "Benyamin Ghojogh and Ali Ghodsi and Fakhri Karray and Mark Crowley",
                                                             "2021",
                                                             "https://arxiv.org/abs/2106.08443",
                                                             "",
                                                             "",
                                                             "");

  public static Article       mercerTheoremForRKHSOnNonCompactSets                          =
                                                                   new Article("Mercer theorem for RKHS on noncompact sets",
                                                                               "Hongwei Sun",
                                                                               "2005",
                                                                               "Journal of Complexity",
                                                                               "21",
                                                                               "337-349");

  public static Article       groupsSpecialFunctionsAndRiggedHilbertSpaces                  =
                                                                           new Article("Groups, Special Functions, and Rigged Hilbert Spaces",
                                                                                       "Celeghini, Enrico and Gadella, Manuel and del Olmo, Mariano A",
                                                                                       "2019",
                                                                                       "Axioms",
                                                                                       "3",
                                                                                       "89",
                                                                                       "MDPI");

  public static Article       bilinearOrthogonalExpansionsAndIntegralOperatorSpectra        =
                                                                                     new Article("Bilinear biorthogonal expansions and the spectrum of an integral operator",
                                                                                                 "Abreu, Lu{\\'\\i}s Daniel and Ciaurri, {\\'O}scar and Varona, Juan Luis",
                                                                                                 "2009",
                                                                                                 "Pr{\\'e}-Publica{\\c{c}}{\\~o}es DMUC",
                                                                                                 "",
                                                                                                 "").setNumber("09-32");

  public static Article       theRayleighRitzMethodForIntegralCovarianceOperatorEigenspaces =
                                                                                            new Article("Eigenvalues approximation of integral covariance operators with applications to weighted $L^2$ statistics",
                                                                                                        "Ebner, Bruno, María Dolores Jiménez-Gamero, and Bojana Milošević",
                                                                                                        "2024",
                                                                                                        "arXiv preprint",
                                                                                                        "2408.08064",
                                                                                                        "Aug 15");

  public static Article       besselChebyshevDuality                                        =
                                                     new Article("Duality between Bessel Functions and Chebyshev Polynomials in Expansions of Functions",
                                                                 "Alfred Wünsche",
                                                                 "2023",
                                                                 "Advances in Pure Mathematics",
                                                                 "13",
                                                                 "504-536").setNumber("8");

  public static Article       shiftedJacobiPolynomialIntegralOperationalMatrix              =
                                                                               new Article("The shifted Jacobi polynomial integral operational matrix for solving Riccati differential equation of fractional order",
                                                                                           "A. Neamaty and B. Agheli and R. Darzi",
                                                                                           "2015",
                                                                                           "Applications and Applied Mathematics: An International Journal (AAM)",
                                                                                           "10",
                                                                                           "878-892").setNumber("2");
  public static Article       orthonormalExpansionsForTranslationInvariantKernels           =
                                                                                  new Article("Orthonormal expansions for translation-invariant kernels",
                                                                                              "Filip Tronarp, Toni Karvonen",
                                                                                              "2024",
                                                                                              "Journal of Approximation Theory",
                                                                                              "302",
                                                                                              "106055");

  public static Article       karhunenLoeveExpansionNote                                    =
                                                         new Article("A brief note on the Karhunen-Loève expansion",
                                                                     "Alen Alexanderian",
                                                                     "2015",
                                                                     "arXiv preprint arXiv:1509.07526",
                                                                     null,
                                                                     null);

  public static Article       nonCommutativeOrbitSpaceGeometry                              =
                                                               new Article("The Geometry of the Orbit Space for Non-Abelian Gauge Theories",
                                                                           "I M Singer",
                                                                           "1981",
                                                                           "Physica Scripta",
                                                                           "24",
                                                                           "817").setNumber("5");

  public static Article       betaIntegralsAndOrthogonalPolynomials                         =
                                                                    new Article("Beta integrals and the associated orthogonal polynomials",
                                                                                "Askey, R.",
                                                                                "1989",
                                                                                "Number Theory 1987 Madras Conference Proceedings",
                                                                                "",
                                                                                "84-121");

  public static Article       harmonizableAndVBoundedProcesses                              =
                                                               new Article("A Note on Harmonizable and V-Bounded Processes",
                                                                           "Yûichirô Kakihara",
                                                                           "1985",
                                                                           "Journal of Multivariate Analysis",
                                                                           "16",
                                                                           "140-156");

  public static Article       onCompactOperators                                            =
                                                 new Article("On compact operators",
                                                             "Alexanderian, Alen",
                                                             "2013",
                                                             "Journal of Mathematical Analysis and Applications",
                                                             "18",
                                                             "5-36").setNumber("2");

  public static Miscellaneous gaussianProcessIntroduction                                   =
                                                          new Miscellaneous("Introduction to Gaussian Processes",
                                                                            "Steven P. Lalley",
                                                                            "2013",
                                                                            "https://galton.uchicago.edu/$\\sim$elalley/Courses/386/GaussianProcesses.pdf",
                                                                            "",
                                                                            "");

  public static Article       uniformlyConvergentBesselFunctionExpansions                   =
                                                                          new Article("Convergent expansions of the Bessel functions in terms of elementary functions",
                                                                                      "José L. López",
                                                                                      "2018",
                                                                                      "Advances in Computational Mathematics",
                                                                                      "44",
                                                                                      "277-294").setPublisher("Springer");

  public static Article       modifiedLommelPolynomials                                     =
                                                        new Article("Asymptotic Expansion of the Modified Lommel Polynomials $h_{n,ν}(x)$ and Their Zeros",
                                                                    "K.F. Lee, R. Wong",
                                                                    "2014",
                                                                    "Proceedings of the American Mathematical Society",
                                                                    "142",
                                                                    "3953-3964").setNumber("11");

  public static Book          orthogonalPolynomials                                         =
                                                    new Book("Orthogonal Polynomials",
                                                             "Gábor Szegő",
                                                             "1975",
                                                             null).setPublisher("American Mathematical Society")
                                                                  .setAddress("Providence, RI")
                                                                  .setIsbn("0821810235, 9780821810231");

  public static Book          chernSelectedPapersIV                                         =
                                                    new Book("Selected Papers of Shiing-Shen Chern IV",
                                                             "Shiing-Shen Chern",
                                                             "1989",
                                                             "463").setPublisher("Springer New York, NY")
                                                                   .setIsbn("978-1-4614-9085-2")
                                                                   .setSeries("Springer Collected Works in Mathematics")
                                                                   .setEdition("1")
                                                                   .setVolume("XV");

  public static Article       theBesselPolynomials                                          =
                                                   new Article("A New Class of Orthogonal Polynomials: The Bessel Polynomials",
                                                               "H.L. Krall and Orrin Frink",
                                                               "1949",
                                                               "Transactions of the American Mathematical Society",
                                                               "65",
                                                               "100-115").setNumber("1");

  public static Article       isotropicCharacteristicFunctions                              =
                                                               new Article("A Class of Isotropic Distributions in $\\mathbb{R}_n$ and Their Characteristic Functions",
                                                                           "Simeon M. Berman",
                                                                           "1978",
                                                                           "Pacific Journal of Mathematics",
                                                                           "78",
                                                                           "No. 1");

  public static Book          besselFunctionTreatise                                        =
                                                     new Book("A Treatise on the Theory of Bessel Functions",
                                                              "G.N. Watson",
                                                              "1944").setPublisher("Cambridge University Press")
                                                                     .setEdition("2nd");

  public static Article       classicalOrthogonalPolynomialReproducingKernels               =
                                                                              new Article("A new property of reproducing kernels for classical orthogonal polynomials",
                                                                                          "F. Alberto Grünbaum",
                                                                                          "1983",
                                                                                          "Journal of Mathematical Analysis and Applications",
                                                                                          "95",
                                                                                          "491-500").setNumber("2")
                                                                                                    .setPublisher("Elsevier");

  public static Book          correlationTheoryOfStationaryRandomProcesses                  =
                                                                           new Book("Correlation Theory of Stationary and Related Random Functions",
                                                                                    "Yaglom, A.M.",
                                                                                    "1987").setSeries("Applied Probability")
                                                                                           .setPublisher("Springer New York")
                                                                                           .setVolume("I: Basic Results");

  public static Article       finiteFourierTransforms                                       =
                                                      new Article("The finite Fourier transform of classical polynomials",
                                                                  "Dixit, Atul and Jiu, Lin and Moll, Victor H and Vignat, Christophe",
                                                                  "2015",
                                                                  "Journal of the Australian Mathematical Society",
                                                                  "98",
                                                                  "145--160").setPublisher("Cambridge University Press");

  public static Book          functionalAnalysisRieszNagy                                   =
                                                          new Book("Functional Analysis",
                                                                   "Frigyes Riesz and Béla Sz.-Nagy",
                                                                   "2012").setPublisher("Dover Publications")
                                                                          .setSeries("Dover Books on Mathematics")
                                                                          .setEdition("unabridged republication of 1955");

  public static Book          functionalAnalysisYosida                                      =
                                                       new Book("Functional Analysis",
                                                                "吉田 耕作(Kōsaku Yosida)",
                                                                "1995").setPublisher("Springer Berlin Heidelberg")
                                                                       .setSeries("Classics in Mathematics")
                                                                       .setEdition("Reprint of the 1980 Edition");

  public static Article       isotropyPrevalenceInSpatialStatistics                         =
                                                                    new Article("Why is isotropy so prevalent in spatial statistics?",
                                                                                "Chunsheng Ma",
                                                                                "2007",
                                                                                "Proceedings of the American Mathematical Society",
                                                                                "135",
                                                                                "865–871").setNumber("3")
                                                                                          .setPublisher("American Mathematical Society");

  public static Book          lecturesOnDifferentialAndIntegralEquations                    =
                                                                         new Book("Lectures on Differential and Integral Equations",
                                                                                  "吉田 耕作(Kōsaku Yosida)",
                                                                                  "1960").setPublisher("Interscience Publishers/John Wiley & Sons Inc.")
                                                                                         .setAddress("New York/London/Sydney")
                                                                                         .setSeries("Pure and Applied Mathematics")
                                                                                         .setVolume("X");

  public static Book          linearHilbertSpaceTransforms                                  =
                                                           new Book("Linear Transformations in Hilbert Space",
                                                                    "Marshall Harvey Stone",
                                                                    "1932").setEdition("4th Printing (1951)")
                                                                           .setVolume("XV")
                                                                           .setSeries("Colloquium Publications")
                                                                           .setPublisher("American Mathematical Society")
                                                                           .setAddress("501 West 116th Street");

  public static Article       lommelAndBesselPolynomials                                    =
                                                         new Article("On Lommel and Bessel polynomials",
                                                                     "David Dickinson",
                                                                     "1954",
                                                                     "Proceedings of the American Mathematical Society",
                                                                     "5",
                                                                     "946-956");

  public static Book          oneParameterSemigroups                                        =
                                                     new Book("One-Parameter Semigroups",
                                                              "E.B. Davies",
                                                              "1980").setPublisher("Academic Press")
                                                                     .setAddress("111 Fifth Avenue New York, New York 10003")
                                                                     .setSeries("L.M.S. Monographs");

  public static Article       orthogonalPolynomialsAndQuadraticExtremalProblems             =
                                                                                new Article("Orthogonal Polynomials and Quadratic Extremal Problems",
                                                                                            "McDougall, J",
                                                                                            "2002",
                                                                                            "Transactions of the American Mathematical Society",
                                                                                            "354",
                                                                                            "2341--2357").setNumber("6");

  public static Article       orthogonalPolynomialsAndSingularSturmLiouvilleSystemsI        =
                                                                                     new Article("Orthogonal polynomials and Singular Sturm-Liouville Systems, I",
                                                                                                 "Littlejohn, Lance L and Krall, Allan M",
                                                                                                 "1986",
                                                                                                 "The Rocky Mountain Journal of Mathematics",
                                                                                                 "16",
                                                                                                 "435--479").setNumber("3");

  public static Book          outOfThisWorld                                                =
                                             new Book("Out of This World: Thinking Fourth Dimensionally",
                                                      "Neville Goddard",
                                                      "2010").setPublisher("Martino Fine Books")
                                                             .setAddress("Eastford, CT")
                                                             .setEdition("Reprint of First 1949 Edition");

  public static Book          psychologyOfMathematicalInvention                             =
                                                                new Book("The Psychology of Invention in the Mathematical Field",
                                                                         "Jacques Hadamard",
                                                                         "1954").setSeries("Dover books on advanced mathematics")
                                                                                .setEdition("enlarged, unaltered, and unabridged reprint of the 1949")
                                                                                .setPublisher("Dover publications, Inc.")
                                                                                .setAddress("180 Varick Street New York, N.Y. 10014");

  public static Article       randomProcessWithStationaryIncrements                         =
                                                                    new Article("A note on processes with random stationary increments",
                                                                                "Haimeng Zhang and Chunfeng Huang",
                                                                                "2014",
                                                                                "Statistics and Probabiltiy Letters",
                                                                                "94",
                                                                                "153-161");

  public static Article       simpleSymbolManipulation                                      =
                                                       new Article("ALGLIB, a simple symbol-manipulation package",
                                                                   "J. M. Shearer and M. A. Wolfe",
                                                                   "1985",
                                                                   "Communications of the ACM",
                                                                   "28",
                                                                   "820–825").setNumber("8");

  public static Book          specialFunctionsOfMathematicalPhysics                         =
                                                                    new Book("Formulas and Theorems for the Special Functions of Mathematical Physics",
                                                                             "Wilhelm Magnus, Fritz Oberhettinger, Raj Pal Soni",
                                                                             "1966").setPublisher("Springer")
                                                                                    .setSeries("Die Grundlehren der mathematischen Wissenschaften in Einzeldarstellungen")
                                                                                    .setVolume("52")
                                                                                    .setEdition("VIII, 508 p. ; 24 cm. 3rd enl. ed.");

  public static MastersThesis spectralMethodsInGaussianProcessApproximations                =
                                                                             new MastersThesis("Spectral Methods in Gaussian Process Approximations",
                                                                                               "David R. Burt",
                                                                                               "2018").setUniversity("University of Cambridge")
                                                                                                      .setDepartment("Emmanuel College")
                                                                                                      .setDegree("Master of Philosophy")
                                                                                                      .setAddress("Cambridge, UK");

  public static Book          stationaryAndRelatedStochasticProcesses                       =
                                                                      new Book("Stationary and Related Processes: Sample Function Properties and Their Applications",
                                                                               "Harald Cramér and M.R. Leadbetter",
                                                                               "1967").setSeries("Wiley Series in Probability and Mathematical Statistics");

  public static Book          stochasticFiniteElements                                      =
                                                       new Book("Stochastic finite elements: a spectral approach",
                                                                "Ghanem, Roger G. and Spanos, Pol D.",
                                                                "1991").setPublisher("Springer-Verlag")
                                                                       .setAddress("Berlin, Heidelberg");

  public static Article       stochasticProcessesAsCurvesInHilbertSpace                     =
                                                                        new Article("Stochastic processes as curves in Hilbert space",
                                                                                    "Harald Cramér",
                                                                                    "1964",
                                                                                    "Theory of Probability & Its Applications",
                                                                                    "9",
                                                                                    "169–179").setNumber("2")
                                                                                              .setPublisher("SIAM");

  public static Book          stochasticProcessesHarmonizableTheory                         =
                                                                    new Book("Stochastic Processes: Harmonizable Theory",
                                                                             "M.M. Rao",
                                                                             "2020").setPublisher("World Scientific Publishing Co. Pte. Ltd.")
                                                                                    .setAddress("Hackensack, NJ")
                                                                                    .setSeries("Series on Multivariate Analysis")
                                                                                    .setVolume("12")
                                                                                    .setIsbn("9789811213656");

  public static Book          stochasticProcessesInferenceTheory                            =
                                                                 new Book("Stochastic Processes: Inference Theory",
                                                                          "Malempati M. Rao",
                                                                          "2014").setPublisher("Springer")
                                                                                 .setEdition("2nd")
                                                                                 .setSeries("Springer Monographs in Mathematics");

  public static Book          stochasticQuantumMechanicalMethods                            =
                                                                 new Book("Stochastic Methods in Quantum Mechanics",
                                                                          "Stanley P. Gudder",
                                                                          "1979").setSeries("North Holland Series in Probability and Applied Mathematics")
                                                                                 .setPublisher("Elsevier North Holland");

  public static Article       theBesselPolynomialMoments                                    =
                                                         new Article("The Besel Polynomial Moment Problem",
                                                                     "A.M. Krall",
                                                                     "1981",
                                                                     "Acta Mathematica Academiae Scientiarum Hungarica",
                                                                     "38",
                                                                     "105-107");

  public static Article       singularSelfAdjointDifferentialOperationExpansion             =
                                                                                new Article("The Expansion Theorem for Singular Self-Adjoint Linear Differential Operators",
                                                                                            "Norman Levinson",
                                                                                            "1954",
                                                                                            "Annals of Mathematics, Second Series",
                                                                                            "59",
                                                                                            "300-315").setNumber("2");

  public static Book          schrödingerOperatorTheoryTopics                               =
                                                              new Book("Topics in the Theory of Schrödinger Operators",
                                                                       "Araki, H. and Ezawa, H.",
                                                                       "2004").setSeries("G - Reference,Information and Interdisciplinary Subjects Series")
                                                                              .setPublisher("World Scientific");

  public static Article       voroninUniversalityTheoremForTheRiemannZetaFunction           =
                                                                                  new Article("On the Voronin’s universality theorem for the Riemann zeta-function",
                                                                                              "Ramunas Garunkštis",
                                                                                              "2003",
                                                                                              "Fizikos ir Matematikos Fakulteto Mokslinio Seminaro Darbai.(Proceedings of Scientific Seminar of the Faculty of Physics and Mathematics)",
                                                                                              "6",
                                                                                              "29-33").setPublisher("Siauliu Univ. Leidykla, Vilnius. (Siauliai Univ. Publishing house, Vilnius.)");

  public static Article       waveFunctionOfTheUniverse                                     =
                                                        new Article("Wave function of the Universe",
                                                                    "J.B. Hartle and S.W. Hawking",
                                                                    "1983",
                                                                    "Physical Review D",
                                                                    "28",
                                                                    "2965-2975").setNumber("12");

  public static Book          whittakerAndWatsonCourseOfModernAnalysis                      =
                                                                       new Book("A course of modern analysis: an introduction to the general theory of infinite processes and of analytic functions; with an account of the principal transcendental functions",
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
