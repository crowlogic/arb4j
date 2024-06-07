%typemap(javaimports) dirichlet_group_struct %{
import static arb.arblib.*;
%}

%typemap(javafinalize) dirichlet_group_struct ""
%typemap(javainterfaces) dirichlet_group_struct "AutoCloseable"

%typemap(javacode) dirichlet_group_struct %{

  /**
   * Calls {@link arb#dirichlet_group_clear(DirichletGroup)}
   * @return this
   */
  public DirichletGroup clear()
  {
    if ( swigCMemOwn )
    {
      dirichlet_group_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  { 
      clear();
  }
  
  public DirichletGroup init(long q)
  {
    dirichlet_group_init(this, q);
    return this;
  }

  public DirichletGroup init(DirichletGroup group, long q)
  {
    dirichlet_subgroup_init(this, group, q);
    return this;
  }
    
%};
