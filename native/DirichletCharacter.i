%typemap(javaimports) dirichlet_char_struct %{
%}

%typemap(javafinalize) dirichlet_char_struct ""
%typemap(javainterfaces) dirichlet_char_struct "AutoCloseable"

%typemap(javacode) dirichlet_char_struct %{

  /**
   * Calls {@link arb#dirichlet_char_clear(DirichletCharacter)}
   * @return this
   */
  public DirichletCharacter clear()
  {
    if ( swigCMemOwn )
    {
      arb.dirichlet_char_clear(this);
    }
    return this;
  }

  @Override
  public void close()
  { 
      clear();
  }
  
  /**
   * 
   * Initializes {@link DirichletCharacter} and sets its value to the principal character of a specified {@link DirichletGroup} G 
   *
   * @return this
   *
   * @param group the {@link DirichletGroup} 
   * 
   * @return this
   */
  public DirichletCharacter init(DirichletGroup group)
  {
    arb.dirichlet_char_init(this, group);
    return this;
  }
    
%};
