package arb.music;

import java.util.List;

/**
 * Represents a set of notes played together.
 */
public interface Chord extends
                       MusicalElement
{
  List<Note> getNotes();

}
