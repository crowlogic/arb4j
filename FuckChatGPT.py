import numpy as np
import matplotlib.pyplot as plt
from scipy.special import poch, jv, sqrt

def lambda_k(k):
        return sqrt((4 * k + 1) / np.pi) / poch(k + 0.5, 0.5)**2
    
    def j(n, y):
            return jv(n + 0.5, y) * sqrt(np.pi / (2 * y))
        
        def psi(n, y):
                return sqrt((4 * n + 1) / np.pi) * (-1)**n * j(2 * n, y)
            
            def K(m, y):
                    summation = sum(lambda_k(k) * psi(k, y) for k in range(m + 1))
                        return summation
                    
                    # Plotting
                    y = np.linspace(0.5, 40, 400)
                    K_10_y = [K(10, yi) for yi in y]
                    BesselJ_0_y = jv(0, y)
                    
                    plt.plot(y, K_10_y, label='K(10, y)')
                    plt.plot(y, BesselJ_0_y, label='BesselJ(0, y)')
                    plt.legend()
                    plt.xlabel('y')
                    plt.ylabel('Function value')
                    plt.title('Plot of K(10, y) and BesselJ(0, y)')
                    plt.grid(True)
                    plt.show()
                    
                    