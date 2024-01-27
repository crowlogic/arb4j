/**
 * A high-performance Java API for <a href="http://arblib.org">arblib</a>
 * 
 * @see <a href="https://github.com/crowlogic/arb4j/">the arb4j homepage on
 *      github</a> /** arb4j is made available under the terms of the Business
 *      Source License™ v1.1 ©2023 which can be found in the root directory of
 *      this project in a file named License.pdf, License.txt, or License.tm
 *      which are the pdf, text, and TeXmacs format of the same document
 *      respectively.
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
  requires transitive j.text.utils;
  requires transitive jlatexmath;
  requires transitive jdk.unsupported;
  requires transitive org.objectweb.asm;
  requires transitive org.objectweb.asm.util;
  requires transitive jdk.jshell;
  requires transitive io.fair_acc.chartfx;
  requires transitive io.fair_acc.dataset;
  requires transitive io.fair_acc.bench;
  requires transitive org.fxyz3d.core;
  requires transitive vineflower;

  
  exports arb;
  exports arb.documentation;
  exports arb.expressions;
  exports arb.expressions.decompiler;
  exports arb.expressions.nodes;
  exports arb.expressions.nodes.binary;
  exports arb.expressions.nodes.unary;
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
  exports arb.functions.polynomials;
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
  exports arb.measure;
  exports arb.stochastic;
  exports arb.stochastic.processes;
  exports arb.stochastic.processes.correlationfunctions;
  exports arb.stochastic.processes.integrators;
  exports arb.utensils;
  exports arb.viz;

}