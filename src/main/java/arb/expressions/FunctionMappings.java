package arb.expressions;

import java.util.HashMap;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 */
public class FunctionMappings 
{
  public final HashMap<String, FunctionMapping<?,?>> map = new HashMap<>();

  @SuppressWarnings("unchecked")
  public <D,R> FunctionMapping<D, R> get(String functionName)
  {
    return (FunctionMapping<D, R>) map.get(functionName);
  }

  public boolean isEmpty()
  {
    return map.isEmpty();
  }

}
