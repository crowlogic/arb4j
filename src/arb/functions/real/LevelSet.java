package arb.functions.real;

import arb.Real;
import arb.Set;
import arb.functions.Function;
import arb.geometry.curves.LevelCurve;
import arb.geometry.surfaces.LevelHyperSurface;
import arb.geometry.surfaces.LevelSurface;
import arb.topology.Fiber;

/**
 * A {@link LevelSet} of a {@link Real}-valued {@link Function} of n
 * {@link Real} variables is a {@link Set} where the function takes on a given
 * constant value <b>c</b>, that is:
 * 
 * L_c(f)={(x[1], … , x[n] ) ∣ f ( x[1] , … , x[n] ) = c } <br>
 * 
 * When the number of independent variables is two, a {@link LevelSet} is called
 * a {@link LevelCurve}, also known as <i>contour line</i> or <i>isoline</i>; so
 * a {@link LevelCurve} is the set of all {@link Real}-valued solutions of an
 * equation in two variables x[1] and x[2]. <br>
 * 
 * 
 * When n = 3, a {@link LevelSet} is called a {@link LevelSurface} (or
 * isosurface); so a LevelSurface is the set of all {@link Real}-valued roots of
 * an equation in three variables, x[1], x[2], and x[3]. For higher values of n,
 * the level set is a {@link LevelHyperSurface} of all {@link Real}-valued roots
 * of an equation in n > 3 variables.
 * 
 * A {@link LevelSet} is a special case of a {@link Fiber}
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Level_set">LevelSet@Wikipedia</a>
 */
public interface LevelSet<F extends RealFunction> extends
                         Fiber
{

}
