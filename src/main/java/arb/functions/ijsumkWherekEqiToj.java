package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.integer.RealSequenceSequence;

public class ijsumkWherekEqiToj implements
                                RealSequenceSequence,
                                Typesettable,
                                AutoCloseable,
                                Initializable,
                                Named
{
  public boolean isInitialized;
  public Context context = new Context();
  public Real    x;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<RealSequence> coDomainType()
  {
    return RealSequence.class;
  }

  @Override
   public RealSequence evaluate(Integer i, int order, int bits, RealSequence result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         ijsumkWherekEqiTojfunc var10000 = new ijsumkWherekEqiTojfunc();
         var10000.i = i;
         var10000.x = this.x;
         var10000.initialize();
         return var10000;
      }
   }

  @Override
  public RealSequenceSequence derivative()
  {
    return Function.express(Integer.class,
                            RealSequence.class,
                            RealSequenceSequence.class,
                            "_diffi-j-sum(kWherekEqiToj)",
                            "diff(Σk{k=i…j},i)",
                            this.context);
  }

  @Override
  public RealSequenceSequence integral()
  {
    return Function.express(Integer.class,
                            RealSequence.class,
                            RealSequenceSequence.class,
                            "_inti➔j➔sum(k{k=i…j})",
                            "int(Σk{k=i…j},i)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public String getName()
  {
    return "i➔j➔sum(k{k=i…j})";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "i➔Σk{k=i…j}";
  }

  @Override
  public String typeset()
  {
    return "\\sum_{k = i}^{j}{null}";
  }
}
