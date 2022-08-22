package arb.biology;

import java.util.stream.Stream;

/**
 * The cell (from the Latin word cellula meaning 'small room'[1]) is the basic
 * structural and functional unit of life forms. Every cell consists of a
 * cytoplasm enclosed within a membrane, which contains many biomolecules such
 * as {@link Protein} and nucleic acids.
 * 
 * Cells can acquire specified function and carry out various tasks within the
 * cell such as replication, DNA repair, protein synthesis, and motility. Cells
 * are capable of specialization and mobility within the cell. Most cells are
 * measured in micrometers due to their small size
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Cell_(biology)">Wikipedia</a>
 *
 */
public interface Cell
{
  /**
   * 
   * @return a {@link Stream} of {@link Protein}s produced by this cell
   */
  public Stream<Protein> produce();
}
