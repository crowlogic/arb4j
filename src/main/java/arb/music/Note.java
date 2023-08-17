package arb.music;

import arb.Real;

/**
 * Represents an individual musical note.
 */
public interface Note extends
                      MusicalElement
{
  Real getPitch();

  Real getDuration();

  int getVelocity();
}
