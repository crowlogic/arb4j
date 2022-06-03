
package arb.viz;

import static java.lang.System.*;

import java.awt.*;
import java.awt.geom.*;
import java.awt.image.*;
import java.io.*;
import java.util.concurrent.*;
import java.util.function.*;

import javax.swing.*;

import arb.viz.rendering.*;
import io.humble.video.*;
import io.humble.video.Codec.CodecCapability;
import io.humble.video.awt.*;

public class ComplexFunctionAnimator<P extends ComplexFunctionRenderer>
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
  private ExecutorService       frameEncodingThread;
  private P                     plotter;

  public static void
         main(String[] args) throws InterruptedException, IOException, AWTException, NoninvertibleTransformException
  {
    int       framesPerSecond = 30;
    int       secondsLong     = 5;
    final int frameCount      = framesPerSecond * secondsLong;
    SRenderer  plotter         = new SRenderer();
    plotter.color_mode  = 5;
    plotter.displayMode = Part.Blend;
    IntConsumer                       frameParameterAssigner = frame ->
                                                             {
                                                               double proportion = (double) frame
                                                                             / (double) frameCount;
                                                               double scale      = 0.1 + secondsLong * proportion;
                                                               System.out.format("Setting scale to %f\n", scale);
                                                               plotter.function.scale.set(scale);
                                                             };
    ComplexFunctionAnimator<XRenderer> animator               = new ComplexFunctionAnimator(plotter,
                                                                                           frameParameterAssigner,
                                                                                           frameCount);
    String                            codec                  = "ffv1";
    animator.renderAnimatedSequence("hmm.avi", "avi", codec, secondsLong, framesPerSecond);
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

  public BufferedImage renderFunction(int i) throws NoninvertibleTransformException, IOException
  {

    out.println("Rendering frame " + i + " of " + frameCount);

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

      tidyUp();
    }
    finally
    {
      muxer.close();
    }
    System.out.println("Finished creating " + muxer.getURL());
  }

  protected void tidyUp() throws InterruptedException
  {
    frameEncodingThread.shutdown();
    frameEncodingThread.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);
    flushCache();
  }

  protected void prepareEncoder(String codecname, double seconds) throws InterruptedException, IOException
  {
    format = muxer.getFormat();
    locateCodec(codecname);
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
  }

  protected void locateCodec(String codecname)
  {
    if (codecname != null)
    {
      codec = Codec.findEncodingCodecByName(codecname);
    }
    else
    {
      codec = Codec.findEncodingCodec(format.getDefaultVideoCodecId());
    }
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
    encodeFrame(i, renderFunction(i));
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

      do
      {
        encoder.encode(packet, picture);
        if (packet.isComplete())
        {
          muxer.write(packet, false);
        }
      }
      while (packet.isComplete());

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

    if (sourceImage.getType() == targetType)
    {
      image = sourceImage;
    }
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