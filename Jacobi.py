import sympy as sp
import numpy as np
import matplotlib.pyplot as plt

# Define variable and parameters
x = sp.Symbol('x')
alpha = -sp.Rational(1, 2)
beta = -sp.Rational(1, 2)
n_polynomials = 5

# Generate symbolic Jacobi polynomials with rational coefficients
poly_expressions = []
for n in range(n_polynomials):
    poly = sp.jacobi(n, alpha, beta, x)
    poly_expressions.append(poly)
    print(f"P_{n}(x) = {poly}")

# Convert to Poly objects to extract coefficients if needed
poly_coeffs = []
for n in range(n_polynomials):
    coeffs = sp.Poly(poly_expressions[n], x).all_coeffs()
    poly_coeffs.append(coeffs)
    print(f"P_{n} coefficients: {coeffs}")

# Plot the polynomials
x_vals = np.linspace(-1, 1, 400)
plt.figure(figsize=(10, 6))

for n in range(n_polynomials):
    # Convert symbolic expression to a lambda function with numpy support
    f = sp.lambdify(x, poly_expressions[n], modules=['numpy'])
    y_vals = f(x_vals)
    # Check if y_vals is a scalar and repeat it to match x_vals length
    if np.isscalar(y_vals):
        y_vals = np.full_like(x_vals, y_vals, dtype=np.float64)
    else:
        y_vals = np.array(y_vals).flatten()
    plt.plot(x_vals, y_vals, label=f'P_{n}')

plt.title('First Five Jacobi Polynomials (α=β=-1/2)')
plt.xlabel('x')
plt.ylabel('P_n(x)')
plt.grid(True)
plt.legend()
plt.show()
