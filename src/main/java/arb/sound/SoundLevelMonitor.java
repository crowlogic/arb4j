package arb.sound;

import javax.sound.sampled.*;

/**
 * Samples audio level and prints to in decibels to the console 10 times per second. 
 * 
 */
public class SoundLevelMonitor
{
  static final long RECORD_TIME = 60000; // 1 minute

  TargetDataLine    line;

  AudioFormat getAudioFormat()
  {
    float       sampleRate       = 16000;
    int         sampleSizeInBits = 8;
    int         channels         = 2;
    boolean     signed           = true;
    boolean     bigEndian        = true;
    AudioFormat format           = new AudioFormat(sampleRate,
                                                   sampleSizeInBits,
                                                   channels,
                                                   signed,
                                                   bigEndian);
    return format;
  }

  void start()
  {
    try
    {
      var           format = getAudioFormat();
      DataLine.Info info   = new DataLine.Info(TargetDataLine.class,
                                               format);

      if (!AudioSystem.isLineSupported(info))
      {
        System.out.println("Line not supported");
        System.exit(0);
      }

      line = (TargetDataLine) AudioSystem.getLine(info);
      line.open(format);
      line.start();

      System.out.println("Start capturing...");

      // 10 samples per second = 100ms per sample
      int    bytesPerRead = (int) (format.getSampleRate() * format.getFrameSize() * 0.1);
      byte[] buffer       = new byte[bytesPerRead];

      while (line.isOpen())
      {
        int bytesRead = line.read(buffer,
                                  0,
                                  buffer.length);

        if (bytesRead > 0)
        {
          double level = calculateLevel(buffer,
                                        bytesRead,
                                        format);
          System.out.printf("Level: %.2f\n",
                            level);
        }
      }
    }
    catch (LineUnavailableException ex)
    {
      ex.printStackTrace();
    }
  }

  double calculateLevel(byte[] buffer, int length, AudioFormat format)
  {
    int     bytesPerSample = format.getSampleSizeInBits() / 8;
    boolean bigEndian      = format.isBigEndian();
    int     channels       = format.getChannels();

    int     frames         = length / (bytesPerSample * channels);
    double  sumSquares     = 0;
    int     sampleCount    = 0;

    for (int f = 0; f < frames; f++)
    {
      for (int ch = 0; ch < channels; ch++)
      {
        int index  = (f * channels + ch) * bytesPerSample;
        int sample = 0;

        // signed PCM reconstruction
        if (bytesPerSample == 1)
        {
          sample = buffer[index]; // already signed byte
        }
        else
        {
          if (bigEndian)
          {
            for (int b = 0; b < bytesPerSample; b++)
            {
              sample = (sample << 8) | (buffer[index + b] & 0xFF);
            }
          }
          else
          {
            for (int b = bytesPerSample - 1; b >= 0; b--)
            {
              sample = (sample << 8) | (buffer[index + b] & 0xFF);
            }
          }
        }

        sumSquares += (double) sample * (double) sample;
        sampleCount++;
      }
    }

    if (sampleCount == 0)
      return -Double.MAX_VALUE;

    double rms       = Math.sqrt(sumSquares / sampleCount);

    double fullScale = Math.pow(2.0,
                                format.getSampleSizeInBits() - 1);

    if (rms > 0.0)
      return 20.0 * Math.log10(rms / fullScale);
    else
      return -Double.MAX_VALUE;
  }

  void finish()
  {
    line.stop();
    line.close();
    System.out.println("Finished");
  }

  public static void main(String[] args)
  {
    final SoundLevelMonitor recorder = new SoundLevelMonitor();

    recorder.start();
  }
}
