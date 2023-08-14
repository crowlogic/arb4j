package arb.annotations;

import java.lang.annotation.*;

import arb.operators.NormalOperator;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Commutative
{
  Class<? extends NormalOperator> adjoint();
}
