package arb.expressions.context;

import java.util.*;

import arb.expressions.Expression;
import arb.expressions.FunctionMapping;

/**
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Dependency
{
  public String                   variableName;
  public List<String>             dependsOn   = new ArrayList<>();
  public List<String>             providesFor = new ArrayList<>();
  public FunctionMapping<?, ?, ?> functionMapping;

  public Expression<?, ?, ?> getExpression()
  {
    return functionMapping.expression;
  }

  public Dependency(FunctionMapping<?, ?, ?> functionMapping)
  {
    this.variableName    = functionMapping.functionName;
    this.functionMapping = functionMapping;
  }

  public Dependency(Dependency dep)
  {
    this.variableName    = dep.variableName;
    this.dependsOn       = dep.dependsOn;
    this.providesFor     = dep.providesFor;
    this.functionMapping = dep.functionMapping;
  }

  @Override
  public String toString()
  {
    return String.format("DependencyInfo[variableName=%s, dependencies=%s, provisions=%s]", variableName, dependsOn, providesFor);
  }

  public List<String> getAssignments(String className, Map<String, FunctionMapping<?, ?, ?>> referencedFunctions)
  {
    return providesFor.stream().filter(key -> referencedFunctions.containsKey(key) && !key.equals(className)).toList();
  }

}