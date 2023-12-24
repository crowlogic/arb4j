package arb.expressions;

import java.util.HashMap;

import arb.HasName;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of the arb4j project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 */
public class Variables

{
  public final HashMap<String, Object> map = new HashMap<>();

  @SafeVarargs
  public <A extends HasName> Variables(A... variables)
  {
    for (A variable : variables)
    {
      map.put(variable.getName(), variable);
    }
  }

  public Object register(String name, Object field)
  {
    return map.put(name, field);
  }

  @SuppressWarnings("unchecked")
  public <R> R get(String name)
  {
    return (R) map.get(name);
  }

  @SuppressWarnings("unchecked")
  public <R> R put(String name, R variable)
  {
    return (R) map.put(name, variable);
  }

}
