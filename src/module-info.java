/**
 * @see <a href="https://github.com/crowlogic/arb4j/">the arb4j page on
 *      github</a>
 */
module arb4j
{
  requires transitive jdk.incubator.foreign;
  requires transitive java.desktop;
  requires transitive humble.video.noarch;
  requires transitive lwjgl3.awt;
  requires transitive org.lwjgl;
  requires transitive org.lwjgl.opengl;
  requires transitive org.lwjgl.glfw;
  requires transitive junit;
  requires transitive hamcrest.core;
  requires java.base;
  requires transitive java.logging;
  requires transitive org.objectweb.asm;
  requires transitive org.objectweb.asm.util;
  requires transitive java.instrument;

  exports arb;
  exports arb.topological;
  exports arb.geometry;
  exports arb.stochastic;
  exports arb.stochastic.processes;
  exports arb.topological.spaces;
  exports arb.measure;
  exports arb.curves;
  exports arb.algebraic.geometry;
  exports arb.domains;
  exports arb.utensils;
  exports arb.functions;
  exports arb.functions.polynomials.orthogonal;
  exports arb.functions.real;
  exports arb.functions.real.dynamics;
  exports arb.functions.complex;
  exports arb.functions.complex.numbertheoretic;
  exports arb.functions.complex.elliptic;
  exports arb.functions.complex.hyperbolic;
  exports arb.functions.complex.dynamics;
  exports arb.functions.complex.lemniscatic;
  exports arb.functions.complex.trigonometric;
  exports arb.operators;
  exports arb.geometry.surfaces;
  exports arb.differential.geometry;
  exports arb.differential.homotopy;
  exports arb.viz;
  exports arb.viz.gl;
  exports arb.viz.rendering;
  exports arb.groups;
  exports arb.dynamical.systems;
  exports arb.exceptions;
  exports arb.theoretical;
  exports arb.theoretical.physics;
  exports arb.nature.physics.forces;
}