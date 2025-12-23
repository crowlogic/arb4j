  public String allocateIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    Class<?> actualType = type.isInterface() ? scalarType(type) : type;
    String intermediateVariableName = newIntermediateVariable(actualType);
    loadThisFieldOntoStack(methodVisitor, intermediateVariableName, actualType);
    return intermediateVariableName;
  }

  public String
         allocateIntermediateVariable(MethodVisitor methodVisitor, String prefix, Class<?> type)
  {
    Class<?> actualType = type.isInterface() ? scalarType(type) : type;
    String intermediateVariableName = newIntermediateVariable(prefix, actualType);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor),
                       intermediateVariableName,
                       actualType.descriptorString());
    return intermediateVariableName;
  }