package arb.expressions;

import java.util.HashMap;

import arb.Field;

public class Variables<X extends Field<X>> extends
                      HashMap<String, X>
{

  private static final long serialVersionUID = 1L;

  
  @SafeVarargs
  public Variables( X... fields)
  {
    for ( X field : fields )
    {
      String name = field.getName();
      assert name != null : "variable names must not be null";
      put( name, field );
    }
  }
}
