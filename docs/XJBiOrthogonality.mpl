with(Physics):

X := (n, y) -> simplify(int(ChebyshevT(n, x)*exp(-x*I*y), x = -1 .. 1)):

# Bi-orthogonality 
int(X(n, y)*BesselJ(m, y), y = -infinity .. infinity) = KroneckerDelta[n,m]*Pi*(-I)^n + KroneckerDelta[n, 0]*Pi;

