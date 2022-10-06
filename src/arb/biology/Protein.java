package arb.biology;

import java.util.Collection;
import java.util.stream.Stream;

import arb.chemistry.AminoAcid;

/**
 * Proteins are large biomolecules and macromolecules that comprise one or more
 * long chains of amino acid residues. Proteins perform a vast array of
 * functions within organisms, including catalysing metabolic reactions, DNA
 * replication, responding to stimuli, providing structure to cells and
 * organisms, and transporting molecules from one location to another. Proteins
 * differ from one another primarily in their sequence of amino acids, which is
 * dictated by the nucleotide sequence of their genes, and which usually results
 * in protein folding into a specific 3D structure that determines its activity.
 * 
 * <a href="https://en.wikipedia.org/wiki/Protein">Protein@Wikipedia</a>
 */
public interface Protein
{
  Stream<Collection<AminoAcid>> residues();
}
