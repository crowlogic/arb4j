package arb.music;

import java.util.List;

/**
 * Represents a track containing multiple sequences.
 */
public interface Track {
    List<Sequence> getSequences();
}
