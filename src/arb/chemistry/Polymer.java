package arb.chemistry;

import java.util.stream.Stream;

/**
 * <pre>
 From The Collaborative International Dictionary of English v.0.48 [gcide]:

  Polymer \Pol"y*mer\, n. [See {Polymeric}.] (Chem.)
     Any one of two or more substances related to each other by
     polymerism; specifically, a substance produced from another
     substance by chemical polymerization. [Formerly also written
     polymere.]
     [1913 Webster]

From WordNet (r) 3.0 (2006) [wn]:

  polymer
      n 1: a naturally occurring or synthetic compound consisting of
           large molecules made up of a linked series of repeated
           simple monomers

From Moby Thesaurus II by Grady Ward, 1.0 [moby-thesaurus]:

  54 Moby Thesaurus words for "polymer":
     acid, acidity, adhesive, agent, alkali, alkalinity, alloisomer,
     anion, antacid, atom, base, biochemical, cast plastic, cation,
     cellulose plastic, chemical, chemical element, chromoisomer,
     compound, copolymer, dimer, element, extruded plastic,
     heavy chemicals, high polymer, homopolymer, hydracid,
     inorganic chemical, ion, isomer, laminate, macromolecule, metamer,
     molded plastic, molding compounds, molecule, monomer, neutralizer,
     nonacid, organic chemical, oxyacid, plastic, protein plastic,
     pseudoisomer, radical, reagent, resin plastic, sulfacid, synthetic,
     synthetic fabric, synthetic rubber, thermoplastic,
     thermosetting plastic, trimer
 * </pre>
 */
public interface Polymer
{
  Stream<Monomer> contents();
}