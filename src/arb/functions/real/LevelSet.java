package arb.functions.real;

import arb.topology.Fiber;

/**
 * a level set of a real-valued function f of n real variables is a set where
 * the function takes on a given constant value c, that is:
 * 
 * L_c(f)={(x_1, … , x_n ) ∣ f ( x_1 , … , x_n ) = c } <br>
 * 
 * When the number of independent variables is two, a level set is called a
 * level curve, also known as contour line or isoline; so a level curve is the
 * set of all real-valued solutions of an equation in two variables x1 and x2.
 * When n = 3, a level set is called a level surface (or isosurface); so a level
 * surface is the set of all real-valued roots of an equation in three variables
 * x1, x2 and x3. For higher values of n, the level set is a level hypersurface,
 * the set of all real-valued roots of an equation in n > 3 variables.
 * 
 * A level set is a special case of a fiber.
 * 
 * @author crow
 *
 */
public interface LevelSet extends
                          Fiber
{

}
