package arb.documentation;

import arb.documentation.references.Reference;

public abstract class Example
{
 public Example(Reference reference, String name, String number, String page)
  {
    super();
    this.reference = reference;
    this.name      = name;
    this.number    = number;
    this.page      = page;
  }

public Reference reference;
 
 public String name;
 
 public String number;
 
 public String page;
 
}
