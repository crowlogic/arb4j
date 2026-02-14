package arb.expressions.context;

import java.util.*;

import arb.expressions.Expression;
import arb.expressions.FunctionMapping;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Dependency
{
  public String                   variableName;
  public List<String>             dependencies = new ArrayList<>();
  public List<String>             provisions   = new ArrayList<>();
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
    this.dependencies    = dep.dependencies;
    this.provisions      = dep.provisions;
    this.functionMapping = dep.functionMapping;
  }

  @Override
  public String toString()
  {
    return String.format("DependencyInfo[variableName=%s, dependencies=%s, provisions=%s]",
                         variableName,
                         dependencies,
                         provisions);
  }

  public List<String> getAssignments(String className,
                                     HashMap<String, FunctionMapping<?, ?, ?>> referencedFunctions)
  {
    return provisions.stream()
                     .filter(key -> referencedFunctions.containsKey(key) && !key.equals(className))
                     .toList();
  }

}