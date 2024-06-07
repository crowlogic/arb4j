# Load necessary packages
restart;
with(SpecialFunctions):

# Define the Riemann-Siegel theta function symbolically using logarithms
theta := t -> (1/2)*I*(ln(GAMMA(1/2*I*t)) - ln(GAMMA(1/2*(-I)*t))) - (1/2)*log(Pi)*t;

# Calculate the first derivative of theta
theta_prime := D(theta);

# Calculate the second derivative of theta
theta_double_prime := (D@@2)(theta);

# Define the autocorrelation function kappa(t, t) = exp(2*theta(t))
kappa := t -> exp(2*theta(t));

# Define the derivative of kappa with respect to t, evaluated at t
kappa_prime := D(kappa);
kappa_double_prime := (D@@2)(kappa);

# Zero-crossing rate lambda(t) as a function of t
lambda := t -> (1/Pi)*sqrt(kappa_double_prime(t) / kappa(t));

# Display expressions
print(theta(t));
print(theta_prime(t));
print(theta_double_prime(t));
print(lambda(t));