"""Bakshi-Madan pricer from first principles."""
import mpmath as mp
mp.mp.dps = 30


def heston_logcf(v, T, V0, theta, lam, nu, rho):
    v = mp.mpc(v)
    iv = 1j * v
    a = lam - rho * nu * iv
    d = mp.sqrt(a * a + nu * nu * (iv + v * v))
    g = (a - d) / (a + d)
    em = mp.exp(-d * T)
    C = lam * theta / nu**2 * ((a - d) * T - 2 * mp.log((1 - g * em) / (1 - g)))
    D = (a - d) / nu**2 * ((1 - em) / (1 - g * em))
    return C + D * V0


def phi(v, T, params):
    return mp.exp(heston_logcf(v, T, *params))


def bakshi_madan_call(S0, K, r, T, phi_func):
    k = mp.log(K / S0) - r * T
    def integrand1(u):
        u = mp.mpf(u)
        val = mp.exp(-1j * u * k) * phi_func(u - 1j, T) / (1j * u)
        return val.real
    def integrand0(u):
        u = mp.mpf(u)
        val = mp.exp(-1j * u * k) * phi_func(u, T) / (1j * u)
        return val.real
    I1 = mp.quad(integrand1, [0, 200])
    I0 = mp.quad(integrand0, [0, 200])
    Pi1 = mp.mpf("0.5") + I1 / mp.pi
    Pi0 = mp.mpf("0.5") + I0 / mp.pi
    return S0 * Pi1 - K * mp.exp(-r * T) * Pi0


if __name__ == "__main__":
    S0 = mp.mpf("100"); K = mp.mpf("100"); r = mp.mpf("0"); T = mp.mpf("0.25")
    params = (mp.mpf("0.04"), mp.mpf("0.04"), mp.mpf("1.0"),
              mp.mpf("0.3"), mp.mpf("-0.7"))
    phi_func = lambda v, T_: phi(v, T_, params)
    C = bakshi_madan_call(S0, K, r, T, phi_func)
    print(f"Bakshi-Madan:  C = {float(C):.10f}")
