package arb.utensils;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Dependency
{
  public final String       variableName;
  public final List<String> dependencies        = new ArrayList<>(); // was constructionDependencies
  public final List<String> reverseDependencies = new ArrayList<>(); // was fieldAssignments

  public Dependency(String name)
  {
    this.variableName = name;
  }

  @Override
  public String toString()
  {
    return String.format("DependencyInfo[variableName=%s, dependencies=%s, reverseDependencies=%s]",
                         variableName,
                         dependencies,
                         reverseDependencies);
  }
}