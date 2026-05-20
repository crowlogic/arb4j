package arb.utensils;

import java.io.IOException;
import java.nio.file.*;

public class LatexDemangler
{
  public static String fix(String s)
  {
    StringBuilder out = new StringBuilder();
    int           i   = 0;
    while (i < s.length())
    {
      // Display math \[ ... \] -> $$ ... $$
      if (i < s.length() - 1 && s.charAt(i) == '\\' && s.charAt(i + 1) == '[')
      {
        int end = s.indexOf("\\]", i + 2);
        if (end != -1)
        {
          out.append("$$").append(s.substring(i + 2, end)).append("$$");
          i = end + 2;
          continue;
        }
      }
      // Inline math \( ... \) -> $ ... $ (and flatten newlines)
      if (i < s.length() - 1 && s.charAt(i) == '\\' && s.charAt(i + 1) == '(')
      {
        int end = s.indexOf("\\)", i + 2);
        if (end != -1)
        {
          String body = s.substring(i + 2, end).replaceAll("\\s*\\n\\s*", " ").trim();
          out.append("$").append(body).append("$");
          i = end + 2;
          continue;
        }
      }
      // Regular character
      out.append(s.charAt(i));
      i++;
    }
    return out.toString();
  }

  public static void main(String[] args) throws IOException
  {
    if (args.length < 1)
    {
      System.err.format("Usage: java %s <input.md> [output.md]\n", LatexDemangler.class);
      return;
    }
    Path in  = Paths.get(args[0]);
    Path out = args.length >= 2 ? (Paths.get(args[1])) : (Paths.get(args[0] + ".demangled.md"));
    Files.writeString(out, fix(Files.readString(in)));
    System.out.println("Wrote: " + out.toAbsolutePath());
  }
}
