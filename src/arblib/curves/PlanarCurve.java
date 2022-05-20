package arblib.curves;

import arblib.*;

public interface PlanarCurve extends
                             ComplexFunction
{

  /**
   * 
   * @return 1 if this function is invertible with a unique inverse
   */
  public default int getInverseBranchCount()
  {
    return 1;
  }

  /**
   * get an inverse branch 
   * 
   * @param branch starting at 0 which is the principal and only branch for
   *               properly invertible functions
   * 
   * @return the n-th branch of the inverse function
   */
  public default ComplexFunction getInverseFunction(int branch)
  {
    throw new UnsupportedOperationException(getClass() + " needs to implement this method");
  }

}
