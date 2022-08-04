/**
 * A high-performance Java API for arblib, the fantastic and amazing
 * arbitrary-precision ball arithmetic C library, implemented via SWIG
 * 
 * @see <a href="https://github.com/crowlogic/arb4j/">the arb4j homepage on
 *      github</a>
 */
module arb4j
{
  requires java.base;
   
  requires transitive java.desktop;
  requires transitive java.instrument;
  requires transitive java.logging;
  requires transitive jdk.incubator.foreign;
  requires transitive humble.video.noarch;
  requires transitive lwjgl3.awt;
  requires transitive org.lwjgl;
  requires transitive org.lwjgl.opengl;
  requires transitive org.lwjgl.glfw;
  requires transitive junit;
  requires transitive hamcrest.core;
  requires transitive org.objectweb.asm;
  requires transitive org.objectweb.asm.util;
  requires gral.core;

  exports arb;
  exports arb.algebraic.expressions;
  exports arb.algebraic.geometry;
  exports arb.geometry;
  exports arb.geometry.curves;
  exports arb.geometry.surfaces;
  exports arb.geometry.differential;
  exports arb.geometry.differential.homotopy;
  exports arb.domains;
  exports arb.dynamical.systems;
  exports arb.exceptions;
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
  exports arb.groups;
  exports arb.topological;
  exports arb.measures;
  exports arb.mechanics;
  exports arb.mechanics.classical;
  exports arb.mechanics.quantum;
  exports arb.mechanics.relativistic;
  exports arb.mechanics.relativistic.general;
  exports arb.mechanics.relativistic.special;
  exports arb.operators;
  exports arb.physics.forces;
  exports arb.stochastic;
  exports arb.stochastic.processes;
  exports arb.stochastic.processes.integrators;
  exports arb.theoretical;
  exports arb.theoretical.physics;
  exports arb.topological.spaces;
  exports arb.utensils;
  exports arb.viz;
  exports arb.viz.gl;
  exports arb.viz.rendering;
}