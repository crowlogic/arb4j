/**
 * A Java API for <a href="http://arblib.org">flint/arblib</a>.
 * 
 * @param <R>
 * 
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms of the
 */
module arb4j
{
  requires java.base;

  requires transitive java.desktop;
  requires transitive java.instrument;
  requires transitive java.logging;
  requires transitive javafx.base;
  requires transitive javafx.fxml;
  requires transitive javafx.graphics;
  requires transitive javafx.controls;
  requires transitive javafx.swing;
  requires transitive junit;
  requires transitive jlatexmath;
  requires transitive jdk.unsupported;
  requires transitive jdk.jshell;
  requires transitive io.fair_acc.chartfx;
  requires transitive io.fair_acc.dataset;
  requires transitive org.objectweb.asm;
  requires transitive org.objectweb.asm.util;
  requires transitive org.objectweb.asm.commons;
  requires transitive org.yaml.snakeyaml;
  requires transitive org.fxyz3d.core;
  requires transitive guru.nidi.graphviz;

  
  exports arb;
  exports arb.expressions.context;
  exports arb.shell;
  exports arb.expressions.viz;
  exports arb.theorems;
  exports arb.annotations;
  exports arb.language;
  exports arb.logic;
  exports arb.documentation;
  exports arb.documentation.concepts;
  exports arb.documentation.annotations;
  exports arb.documentation.references;
  exports arb.utensils.text.latex;
  exports arb.equations;
  exports arb.expressions;
  exports arb.expressions.nodes;
  exports arb.expressions.nodes.nary;
  exports arb.expressions.nodes.binary;
  exports arb.expressions.nodes.unary;
  exports arb.algebra;
  exports arb.geometry;
  exports arb.differential.geometry;
  exports arb.domains;
  exports arb.exceptions;
  exports arb.physics;
  exports arb.physics.particles;
  exports arb.functions;
  exports arb.utensils.text.tables;
  exports arb.utensils.text.trees;
  exports arb.functions.polynomials;
  exports arb.functions.polynomials.orthogonal;
  exports arb.functions.polynomials.orthogonal.complex;
  exports arb.functions.polynomials.orthogonal.real;
  exports arb.functions.rational;
  exports arb.functions.real;
  exports arb.functions.complex;
  exports arb.functions.complex.numbertheoretic;
  exports arb.functions.complex.hyperbolic;
  exports arb.functions.integer;
  exports arb.groups;
  exports arb.space.bornological;
  exports arb.space.topological;
  exports arb.measure;
  exports arb.stochastic.processes;
  exports arb.stochastic.processes.correlationfunctions;
  exports arb.utensils;
  exports arb.viz;
  exports arb.documentation.concepts.linearoperators.spectraltheory;
  exports arb.documentation.concepts.stochastic;
  exports arb.documentation.concepts.stochastic.randomfields.isotropy;

}