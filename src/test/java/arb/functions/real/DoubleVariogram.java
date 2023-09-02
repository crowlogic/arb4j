package arb.functions.real;

public class DoubleVariogram
{
  public static void main(String[] args)
  {
    int      vectorLen = 1000;                 // Length of the vector
    double[] vector    = new double[vectorLen];
    double   meshSize  = 20.0 / (double)vectorLen;

    for (int i = 0; i < vectorLen; i++)
    {
      double x = i * meshSize;
      vector[i] = Math.sin(x);
    }
    int      maxH            = 300;                           // Up to one-third the length of the data

    double[] variogramValues = calculateVariogramForMultipleH(vector, maxH);

    // Print the calculated variogram values
    for (int h = 1; h <= maxH; h++)
    {
      System.out.println("Variogram value for h=" + h + " is " + variogramValues[h - 1]);
    }
  }

  public static double[] calculateVariogramForMultipleH(double[] vector, int maxH)
  {
    double[] variogramValues = new double[maxH];

    for (int h = 1; h <= maxH; h++)
    {
      variogramValues[h - 1] = calculateVariogramForSingleH(vector, h);
    }

    return variogramValues;
  }

  public static double calculateVariogramForSingleH(double[] vector, int h)
  {
    double sumSquaredDifferences = 0.0;
    int    count                 = 0;
    int    n                     = vector.length;

    for (int i = 0; i < n - h; i++)
    {
      double squaredDifference = Math.pow(vector[i + h] - vector[i], 2);
      sumSquaredDifferences += squaredDifference;
      count++;
    }

    return sumSquaredDifferences / count;
  }
}
