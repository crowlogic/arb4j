package arb.algebraic.expressions;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Opcodes;

public class CustomClassWriter
{

  ClassReader         reader;
  ClassWriter         writer;
  FieldAdder          fieldAdder;
  InterfaceAdder      interfaceAdder;
  MethodPublicizer    methodPublicizier;
  static final String CLASSNAME = "java.lang.Integer";
  static final String CLONEABLE = "java/lang/Cloneable";

  public CustomClassWriter()
  {

    try
    {
      reader = new ClassReader(CLASSNAME);
      writer = new ClassWriter(reader,
                               0);

    }
    catch (IOException ex)
    {
      Logger.getLogger(CustomClassWriter.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public CustomClassWriter(byte[] contents)
  {
    reader = new ClassReader(contents);
    writer = new ClassWriter(reader,
                             0);
  }

  public static void main(String[] args)
  {
    CustomClassWriter ccw = new CustomClassWriter();
    ccw.publicizeMethod();
  }

  public byte[] addField()
  {
    fieldAdder = new FieldAdder("aNewBooleanField",
                                Opcodes.ACC_PUBLIC,
                                writer);
    reader.accept(fieldAdder, 0);
    return writer.toByteArray();
  }

  public byte[] publicizeMethod()
  {
    methodPublicizier = new MethodPublicizer(writer);
    reader.accept(methodPublicizier, 0);
    return writer.toByteArray();
  }

  public byte[] addInterface()
  {
    interfaceAdder = new InterfaceAdder(writer);
    reader.accept(interfaceAdder, 0);
    return writer.toByteArray();
  }

}
