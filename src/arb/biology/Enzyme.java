package arb.biology;

/**
 * Any of several complex {@link Protein}s that are produced by {@link Cell}s
 * and act as {@link Catalyst}s in specific {@link BiochemicalReaction}s
 * 
 * Enzymes (/ˈɛnzaɪmz/) are proteins that act as biological {@link Catalyst}
 * (biocatalysts). Catalysts accelerate {@link ChemicalReaction}. The molecules
 * upon which enzymes may act are called substrates, and the enzyme converts the
 * substrates into different molecules known as products. Almost all metabolic
 * processes in the {@link Cell} need enzyme catalysis in order to occur at
 * rates fast enough to sustain life. : 8.1 Metabolic pathways depend upon
 * enzymes to catalyze individual steps. The study of enzymes is called
 * enzymology and the field of pseudoenzyme analysis recognizes that during
 * evolution, some enzymes have lost the ability to carry out biological
 * catalysis, which is often reflected in their amino acid sequences and unusual
 * 'pseudocatalytic' properties.
 * 
 * Enzymes are known to catalyze more than 5,000 biochemical reaction types.
 * Other biocatalysts are catalytic RNA molecules, called ribozymes. Enzymes'
 * specificity comes from their unique three-dimensional structures.
 * 
 * @see <a href="
 */
public interface Enzyme extends
                        Protein,
                        Catalyst
{

}
