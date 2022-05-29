
package arb.graphing;

import static java.lang.System.*;

import java.awt.*;
import java.awt.geom.*;
import java.awt.image.*;
import java.io.*;
import java.util.concurrent.*;
import java.util.function.*;

import javax.swing.*;

import arb.graphing.plots.*;
import io.humble.video.*;
import io.humble.video.awt.*;

public class ComplexFunctionAnimator<P extends ComplexFunctionPlotter>
{
  private IntConsumer frameParameterAssigner;
  private int         width;
  private int         height;

  public ComplexFunctionAnimator(P plotter,
                                 IntConsumer frameParameterAssigner,
                                 int frameCount) throws NoninvertibleTransformException
  {
    this.plotter                = plotter;
    frameEncodingThread         = Executors.newSingleThreadExecutor();
    this.frameParameterAssigner = frameParameterAssigner;
    this.frameCount             = frameCount;
    this.width                  = plotter.width;
    this.height                 = plotter.height;
  }

  private JFrame                frame;
  Robot                         robot;
  private Rectangle             screenbounds;
  private Rational              framerate;
  private Muxer                 muxer;
  private MuxerFormat           format;
  private Codec                 codec;
  private Encoder               encoder;
  private PixelFormat.Type      pixelformat;
  private MediaPictureConverter converter;
  private MediaPicture          picture;
  private MediaPacket           packet;
  public int                    frameCount;
  private double                maxSize;
  private ExecutorService       frameEncodingThread;
  private P                     plotter;

  public static void
         main(String[] args) throws InterruptedException, IOException, AWTException, NoninvertibleTransformException
  {
    final int frameCount = 500;
    SPlotter  plotter    = new SPlotter();
    plotter.displayMode = Part.Blend;
    int                               duration               = 5;
    IntConsumer                       frameParameterAssigner = frame ->
                                                             {
                                                               double scale = 0.1 + duration * ((double) frame
                                                                             / (double) frameCount);
                                                               System.out.format("Setting scale to %f\n", scale);
                                                               plotter.function.scale.assign(scale);
                                                             };
    ComplexFunctionAnimator<SPlotter> animator               = new ComplexFunctionAnimator(plotter,
                                                                                           frameParameterAssigner,
                                                                                           frameCount);
    animator.renderAnimatedSequence("hmm.avi", "avi", "ffv1", duration, frameCount / duration);
    animator.close();
    System.exit(777);
  }

  private void close()
  {
    frameEncodingThread.shutdownNow();
    plotter.close();
  }

  protected static void printInstalledCodecs()
  {
    for (Codec codec : Codec.getInstalledCodecs())
    {
      System.out.println("codec: " + codec);
    }
  }

  public BufferedImage renderFunction(int i, int frameCount) throws NoninvertibleTransformException, IOException
  {

    out.println("Drawing frame " + i + "/" + frameCount);

    BufferedImage image = convertToType(plotter.render(), BufferedImage.TYPE_3BYTE_BGR);

    System.gc();
    return image;
  }

  public void renderAnimatedSequence(String filename,
                                     String formatname,
                                     String codecname,
                                     int seconds,
                                     int framesPerSecond) throws AWTException,
                                                          InterruptedException,
                                                          IOException,
                                                          NoninvertibleTransformException
  {

    robot        = new Robot();
    screenbounds = new Rectangle(width,
                                 height);
    framerate    = Rational.make(1, framesPerSecond);
    muxer        = Muxer.make(filename, null, formatname);
    try
    {
      prepareEncoder(codecname, seconds);

      for (int i = 0; i < frameCount; i++)
      {
        renderAndEncodeFrame(i);
      }

      System.out.println("Shutting down");
      frameEncodingThread.shutdown();
      System.out.println("Waiting on shutdown");

      frameEncodingThread.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);
      System.out.println("Everything is shutdown.. flushing cache");
      flushCache();
      System.out.println("Cache is flushed");
    }
    finally
    {
      muxer.close();
    }
    System.out.println("Finished animating sequence");
  }

  protected void prepareEncoder(String codecname, double seconds) throws InterruptedException, IOException
  {
    format = muxer.getFormat();
    if (codecname != null)
    {
      codec = Codec.findEncodingCodecByName(codecname);
    }
    else
    {
      codec = Codec.findEncodingCodec(format.getDefaultVideoCodecId());
    }

    encoder = Encoder.make(codec);
    encoder.setWidth(screenbounds.width);
    encoder.setHeight(screenbounds.height);
    pixelformat = PixelFormat.Type.PIX_FMT_YUV420P;
    encoder.setPixelFormat(pixelformat);
    encoder.setTimeBase(framerate);
    if (format.getFlag(MuxerFormat.Flag.GLOBAL_HEADER))
    {
      encoder.setFlag(Encoder.Flag.FLAG_GLOBAL_HEADER, true);
    }
    encoder.open(null, null);
    muxer.addNewStream(encoder);
    muxer.open(null, null);
    converter = null;
    picture   = MediaPicture.make(encoder.getWidth(), encoder.getHeight(), pixelformat);
    picture.setTimeBase(framerate);

    packet     = MediaPacket.make();
    frameCount = (int) (seconds / framerate.getDouble());
    maxSize    = 5;
  }

  private void flushCache()
  {
    do
    {
      encoder.encode(packet, null);
      if (packet.isComplete())
      {
        muxer.write(packet, false);
      }
    }
    while (packet.isComplete());
  }

  protected void renderAndEncodeFrame(int i) throws NoninvertibleTransformException, IOException
  {
    frameParameterAssigner.accept(i);
    encodeFrame(i, renderFunction(i, frameCount));
  }

  protected void encodeFrame(int i, final BufferedImage screen)
  {
    frameEncodingThread.execute(() ->
    {
      if (converter == null)
      {
        converter = MediaPictureConverterFactory.createConverter(screen, picture);
      }
      converter.toPicture(picture, screen, i);

      System.out.println("Writing frame# " + i);
      do
      {
        encoder.encode(packet, picture);
        if (packet.isComplete())
        {
          muxer.write(packet, false);
        }
      }
      while (packet.isComplete());

      System.out.println("Wrote frame# " + i);

    });
  }

  /**
   * Convert a {@link BufferedImage} of any type, to {@link BufferedImage} of a
   * specified type. If the source image is the same type as the target type, then
   * original image is returned, otherwise new image of the correct type is
   * created and the content of the source image is copied into the new image.
   * 
   * @param sourceImage the image to be converted
   * @param targetType  the desired BufferedImage type
   * 
   * @return a BufferedImage of the specifed target type.
   * 
   * @see BufferedImage
   */

  public static BufferedImage convertToType(BufferedImage sourceImage, int targetType)
  {
    BufferedImage image;

    // if the source image is already the target type, return the source image

    if (sourceImage.getType() == targetType)
      image = sourceImage;

    // otherwise create a new image of the target type and draw the new
    // image

    else
    {
      image = new BufferedImage(sourceImage.getWidth(),
                                sourceImage.getHeight(),
                                targetType);
      image.getGraphics().drawImage(sourceImage, 0, 0, null);
    }

    return image;
  }

}