package arb.music;

import java.util.List;

/**
 * mixes multiple tracks
 */
public interface Mixer
{
  Track mix(List<Track> tracks);
}