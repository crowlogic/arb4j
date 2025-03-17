package arb.physics;

import java.util.Iterator;
import java.util.List;
import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Axiom;
import arb.logic.Clause;
import arb.logic.LogicalConnective;
import arb.logic.Proposition;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WightmanAxioms implements
                            Iterable<Axiom>
{

  @Override
  public Iterator<Axiom> iterator()
  {
    List<Axiom> asList = List.of(new Axiom()
    {

      @Override
      public <C extends Clause<Word, Sentence<Word>, Proposition<Word, Sentence<Word>>>> Stream<? extends C> structure()
      {
        assert false : "TODO";
        return null;
      }

      @Override
      public boolean evaluate()
      {
        assert false : "TODO: Auto-generated method stub";
        return false;
      }

      @Override
      public Proposition<Word, Sentence<Word>> negate()
      {
        assert false : "TODO: Auto-generated method stub";
        return null;
      }

      @Override
      public Proposition<Word, Sentence<Word>> combine(LogicalConnective logicalConnective,
                                                       Proposition<Word, Sentence<Word>> proposition)
      {
        assert false : "TODO: Auto-generated method stub";
        return null;
      }
    });
    return asList.iterator();
  }

}
