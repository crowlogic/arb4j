package arb.algebra;

import java.util.function.BinaryOperator;

import arb.Field;
import arb.groups.LieGroup;
import arb.topological.spaces.VectorSpace;

/**
 * <pre>
   A Lie algebra is a vector space 𝔤  over some field F  
   together with a binary operation 
       
              [ ⋅ , ⋅ ] : 𝔤 × 𝔤 → 𝔤 :

    Bilinearity,

        [ a x + b y , z ] = a [ x , z ] + b [ y , z ] , 
        [ z , a x + b y ] = a [ z , x ] + b [ z , y ] 

    for all scalars a, b in F and all elements x, y, z in 𝔤 .

    Alternativity,

        [x,x]=0   ∀x∈𝔤

    The Jacobi identity,

        [ x , [ y , z ] ] + [ y , [ z , x ] ] + [ z , [ x , y ] ] = 0 

    for all x, y, z in 𝔤

  Using bilinearity to expand the Lie bracket [ x + y , x + y ] [x+y,x+y] 
  and using alternativity  shows that  [x,y]+[y,x]=0 for all elements 
  x, y in 𝔤 showing that bilinearity and alternativity together imply

    Anticommutativity,

        [ x , y ] = − [ y , x ] ,

    for all elements x , y in g. If the field's characteristic is not 2 
    then anticommutativity implies alternativity, since it implies 
    [ x , x ] = − [ x , x ] .

     t is customary to denote a Lie algebra by a lower-case fraktur letter. 
     
      If a Lie algebra is associated with a {@link LieGroup}, then the algebra is 
      denoted by the fraktur version of the group: for example the Lie algebra 
      of SU(n) is 𝔰𝔲(n) 
      
 * </pre>
 *
 * @param <F>
 * @param <B>
 */
public interface LieAlgebra<F extends Field, B extends BinaryOperator<F>> extends
                           VectorSpace<F>
{
  B getLieBracket();
}
