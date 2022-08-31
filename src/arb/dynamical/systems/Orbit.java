package arb.dynamical.systems;

import arb.SubSet;
import arb.geometry.curves.Curve;
import arb.geometry.surfaces.RiemannSurface;

/**
 * An orbit is a collection of points related by the evolution function of the
 * {@link DynamicalSystem}. It can be understood as the subset of
 * {@link PhaseSpace} covered by the trajectory of the dynamical system under a
 * particular set of initial conditions, as the system evolves. <br>
 * 
 * As phase space trajectory is uniquely determined for any given set of phase
 * space coordinates, it is not possible for different orbits to intersect in
 * phase space, therefore the set of all orbits of a dynamical system is a
 * partition of the phase space. <br>
 * 
 * Understanding the properties of orbits by using topological methods is one of
 * the objectives of the modern theory of dynamical systems.
 * 
 * For discrete-time dynamical systems, the orbits are sequences; for real
 * dynamical systems, the orbits are {@link Curve}s; and for holomorphic
 * dynamical systems, the orbits are {@link RiemannSurface}.<br>
 * 
 * Орбіта – це сукупність точок, пов’язаних функцією еволюції
 * {@link DynamicalSystem}. Його можна розуміти як підмножину {@link PhaseSpace}
 * охоплюється траєкторією динамічної системи за певного набору початкових умов
 * у міру розвитку системи. <br>
 * 
 * Оскільки траєкторія фазового простору однозначно визначається для будь-якого
 * даного набору координат фазового простору, різні орбіти не можуть
 * перетинатися у фазовому просторі, тому набір усіх орбіт динамічної системи є
 * розділом фазового простору. <br>
 * 
 * Розуміння властивостей орбіт за допомогою топологічних методів є одним із
 * завдань сучасної теорії динамічних систем.
 * 
 * Для динамічних систем з дискретним часом орбіти є послідовностями; для
 * реальних динамічних систем орбітами є {@link Curve}; а для голоморфних
 * динамічних систем орбіти {@link RiemannSurface}.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Orbit_(dynamics)">Orbit@Wikipedia</a>
 *
 */
public interface Orbit<DS extends DynamicalSystem> extends
                      SubSet<PhaseSpace<DS>>
{

}
