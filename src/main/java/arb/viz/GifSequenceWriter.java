package arb.viz;

import java.awt.image.RenderedImage;
import java.io.Closeable;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.IIOException;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageTypeSpecifier;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.metadata.IIOMetadata;
import javax.imageio.metadata.IIOMetadataNode;
import javax.imageio.stream.ImageOutputStream;

public final class GifSequenceWriter implements
                                     Closeable
{
  private final ImageWriter     writer;
  private final ImageWriteParam params;
  private final IIOMetadata     metadata;

  public GifSequenceWriter(ImageOutputStream out,
                           int imageType,
                           int delayTimeMs,
                           boolean loopContinuously) throws IOException
  {
    writer = getWriter();
    params = writer.getDefaultWriteParam();
    ImageTypeSpecifier type = ImageTypeSpecifier.createFromBufferedImageType(imageType);
    metadata = writer.getDefaultImageMetadata(type, params);

    String          metaFormat = metadata.getNativeMetadataFormatName();
    IIOMetadataNode root       = (IIOMetadataNode) metadata.getAsTree(metaFormat);

    IIOMetadataNode gfx        = getNode(root, "GraphicControlExtension");
    gfx.setAttribute("disposalMethod", "none");
    gfx.setAttribute("userInputFlag", "FALSE");
    gfx.setAttribute("transparentColorFlag", "FALSE");
    gfx.setAttribute("delayTime", Integer.toString(delayTimeMs / 10));
    gfx.setAttribute("transparentColorIndex", "0");

    IIOMetadataNode appExts = getNode(root, "ApplicationExtensions");
    IIOMetadataNode app     = new IIOMetadataNode("ApplicationExtension");
    app.setAttribute("applicationID", "NETSCAPE");
    app.setAttribute("authenticationCode", "2.0");
    byte[] loop = new byte[]
    { 0x1, (byte) (loopContinuously ? 0x0 : 0x1), 0x0 };
    app.setUserObject(loop);
    appExts.appendChild(app);

    metadata.setFromTree(metaFormat, root);
    writer.setOutput(out);
    writer.prepareWriteSequence(null);
  }

  private static ImageWriter getWriter() throws IIOException
  {
    Iterator<ImageWriter> iter = ImageIO.getImageWritersBySuffix("gif");
    if (!iter.hasNext())
      throw new IIOException("No GIF ImageWriter found");
    return iter.next();
  }

  private static IIOMetadataNode getNode(IIOMetadataNode root, String name)
  {
    for (int i = 0; i < root.getLength(); i++)
    {
      if (root.item(i).getNodeName().equalsIgnoreCase(name))
      {
        return (IIOMetadataNode) root.item(i);
      }
    }
    IIOMetadataNode n = new IIOMetadataNode(name);
    root.appendChild(n);
    return n;
  }

  public void write(RenderedImage img) throws IOException
  {
    writer.writeToSequence(new IIOImage(img,
                                        null,
                                        metadata),
                           params);
  }

  @Override
  public void close() throws IOException
  {
    writer.endWriteSequence();
  }
}