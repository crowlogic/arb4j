package arb.expressions.context;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
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