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
  requires transitive javafx.graphics;
  requires transitive javafx.controls;
  requires transitive jdk.incubator.foreign;
  requires transitive junit;
  requires transitive org.objectweb.asm;
  requires transitive org.objectweb.asm.util;
  requires transitive humble.video.noarch;
  requires transitive org.lwjgl;
  requires transitive org.lwjgl.opengl;
  requires transitive org.lwjgl.glfw;
  requires transitive org.joml;
  requires transitive LWJGUI.pre.mt;
  requires transitive pngdecoder;
  requires transitive j.text.utils;
  requires transitive org.jetbrains.annotations;
  requires transitive org.slf4j;
  requires transitive de.gsi.chartfx.chart;
  requires transitive de.gsi.chartfx.dataset;
  requires transitive de.gsi.chartfx.math;
  requires transitive it.unimi.dsi.fastutil;
  requires transitive commons.math3;
  requires transitive org.kordamp.ikonli.javafx;
  requires transitive JTransforms;

  exports de.gsi.chart.samples;
  exports de.gsi.math.samples;
  exports arb;
  exports arb.algebraic.expressions;
  exports arb.algebraic.geometry;
  exports arb.biology;
  exports arb.chemistry;
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
  exports arb.functions.complex.elliptic.lemniscatic;
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