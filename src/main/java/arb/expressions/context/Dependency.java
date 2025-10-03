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
  public String                   variableName;
  public List<String>             dependencies        = new ArrayList<>(); // was
                                                                           // constructionDependencies
  public List<String>             reverseDependencies = new ArrayList<>(); // was fieldAssignments
  public FunctionMapping<?, ?, ?> functionMapping;

  public Dependency(FunctionMapping<?, ?, ?> functionMapping)
  {
    this.variableName    = functionMapping.functionName;
    this.functionMapping = functionMapping;
  }

  public Dependency(Dependency dep)
  {
    this.variableName        = dep.variableName;
    this.dependencies        = dep.dependencies;
    this.reverseDependencies = dep.reverseDependencies;
    this.functionMapping     = dep.functionMapping;
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