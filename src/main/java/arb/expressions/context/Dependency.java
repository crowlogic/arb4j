package arb.expressions.context;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import arb.expressions.FunctionMapping;

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

  public List<String> getAssignments(String className,
                                     HashMap<String, FunctionMapping<?, ?, ?>> referencedFunctions)
  {
    return reverseDependencies.stream()
                              .filter(key -> referencedFunctions.containsKey(key)
                                            && !key.equals(className))
                              .toList();
  }

}