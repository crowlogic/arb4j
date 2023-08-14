/**
 * A high-performance Java API for arblib
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
  requires transitive javafx.graphics;
  requires transitive javafx.controls;
  requires transitive junit;
  requires transitive j.text.utils;
  requires transitive de.gsi.chartfx.chart;
  requires transitive de.gsi.chartfx.dataset;
  requires transitive de.gsi.chartfx.math;
  requires transitive jlatexmath;
  requires transitive jdk.unsupported;
  requires transitive org.objectweb.asm;
  requires transitive org.objectweb.asm.util;

  exports arb;
  exports arb.expressions;
  exports arb.expressions.nodes;
  exports arb.annotations;
  exports arb.algebra;
  exports arb.algebraic.geometry;
  exports arb.geometry;
  exports arb.geometry.symplectic;
  exports arb.geometry.curves;
  exports arb.geometry.surfaces;
  exports arb.differential.geometry;
  exports arb.domains;
  exports arb.dynamical.systems;
  exports arb.exceptions;
  exports arb.functions;
  exports arb.operators;
  exports arb.operators.integraltransforms;
  exports arb.functions.polynomials.orthogonal;
  exports arb.functions.real;
  exports arb.functions.complex;
  exports arb.functions.complex.numbertheoretic;
  exports arb.functions.complex.elliptic;
  exports arb.functions.complex.hyperbolic;
  exports arb.functions.complex.dynamics;
  exports arb.functions.complex.trigonometric;
  exports arb.groups;
  exports arb.space.bornological;
  exports arb.space.topological;
  exports arb.topology;
  exports arb.measures;
  exports arb.stochastic;
  exports arb.stochastic.processes;
  exports arb.stochastic.processes.integrators;
  exports arb.utensils;
  exports arb.viz;
  
}