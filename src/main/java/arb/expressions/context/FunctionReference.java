package arb.expressions.context;

import java.util.*;
import java.util.function.Predicate;

import arb.expressions.Expression;
import arb.expressions.FunctionMapping;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class FunctionReference
{
  public String                   variableName;
  public List<String>             needs    = new ArrayList<>();
  public List<String>             provides = new ArrayList<>();
  public FunctionMapping<?, ?, ?> functionMapping;

  public Expression<?, ?, ?> getExpression()
  {
    return functionMapping.expression;
  }

  public FunctionReference(FunctionMapping<?, ?, ?> functionMapping)
  {
    this.variableName    = functionMapping.functionName;
    this.functionMapping = functionMapping;
  }

  public FunctionReference(FunctionReference dep)
  {
    this.variableName    = dep.variableName;
    this.needs           = dep.needs;
    this.provides        = dep.provides;
    this.functionMapping = dep.functionMapping;
  }

  @Override
  public String toString()
  {
    return String.format("FunctionReference[variableName=%s, needs=%s, provides=%s]",
                         variableName,
                         needs,
                         provides);
  }

  public List<String>
         getReferencedUpstreamFunctions(String className,
                                        HashMap<String, FunctionMapping<?, ?, ?>> referencedFunctions)
  {
    return provides.stream()
                   .filter(referencedUpstreamFunctionPredicate(className, referencedFunctions))
                   .toList();
  }

  protected Predicate<? super String>
            referencedUpstreamFunctionPredicate(String className,
                                                HashMap<String, FunctionMapping<?, ?, ?>> referencedFunctions)
  {
    return functionName -> referencedFunctions.containsKey(functionName)
                  && !functionName.equals(className);
  }

}