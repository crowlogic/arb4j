package arb.viz;

import static java.lang.System.out;

import java.awt.*;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.*;
import java.util.function.IntConsumer;

import javax.swing.JFrame;

import arb.Real;
import arb.viz.rendering.XRenderer;
import io.humble.video.*;
import io.humble.video.awt.MediaPictureConverter;
import io.humble.video.awt.MediaPictureConverterFactory;

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

  @SuppressWarnings("resource")
  public static void
         main(String[] args) throws InterruptedException, IOException, AWTException, NoninvertibleTransformException
  {
    int       framesPerSecond = 30;
    int       secondsLong     = 10;
    final int frameCount      = framesPerSecond * secondsLong;
    XRenderer renderer        = new XRenderer();
    renderer.colorMode   = 1;
    renderer.displayMode = Part.Phase;
    Real                               scaleStart             = new Real().one().div(2, 128);
    Real                               scaleStop              = new Real().set("3", 128);
    Real                               scaleLen               = scaleStop.sub(scaleStart, 128, new Real());
    Real                               dt                     = new Real().one()
                                                                          .div(framesPerSecond, 128, new Real());
    Real                               dscale                 = scaleLen.div(frameCount, 128);
    Real                               scale                  = new Real().set(scaleStart);
    Real                               motion                 = new Real();
    IntConsumer                        frameParameterAssigner = frame ->
                                                              {
                                                                double percentComplete = (double) frame
                                                                              / (double) frameCount;
                                                                scale.add(dscale, 128, scale);
                                                                System.out.format("Setting scale to %s of %s at %.3f%% complete on frame#%d\n",
                                                                                  scale.toString(10),
                                                                                  scaleStop.toString(10),
                                                                                  percentComplete,
                                                                                  frame);
                                                                renderer.function.f.a.set(scale);
                                                              };
    ComplexFunctionAnimator<XRenderer> animator               = new ComplexFunctionAnimator(renderer,
                                                                                            frameParameterAssigner,
                                                                                            frameCount);
    animator.renderAnimatedSequence(renderer.function.toString() + ".avi", secondsLong, framesPerSecond);
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
    BufferedImage image = plotter.render();
    image = convertToType(image, BufferedImage.TYPE_3BYTE_BGR);
    System.gc();
    return image;
  }

  public void
         renderAnimatedSequence(String filename, int seconds, int framesPerSecond) throws AWTException,
                                                                                   InterruptedException,
                                                                                   IOException,
                                                                                   NoninvertibleTransformException
  {
    renderAnimatedSequence(filename, "avi", "ffv1", seconds, framesPerSecond);
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
    System.out.println("Starting creation of " + filename + " ...");
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