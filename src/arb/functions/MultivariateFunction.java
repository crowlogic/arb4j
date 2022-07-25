package arb.functions;

/**
 * a function of several real variables or real multivariate function is a
 * function with more than one argument, with all arguments being real
 * variables. This concept extends the idea of a function of a real variable to
 * several variables. The "input" variables take real values, while the
 * "output", also called the "value of the function", may be real or complex.
 * However, the study of the complex valued functions may be easily reduced to
 * the study of the real valued functions, by considering the real and imaginary
 * parts of the complex function; therefore, unless explicitly specified, only
 * real valued functions will be considered in this article.
 * 
 * The domain of a function of n variables is the subset of Rn for which the
 * function is defined. As usual, the domain of a function of several real
 * variables is supposed to contain a nonempty open subset of Rn.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Function_of_several_real_variables">Wikipedia</a>
 * @param <Ω> domain
 * @param <X> range
 */
public interface MultivariateFunction<Ω, X> extends
                                     Function<Ω, X>
{
  public int argDim();
}
