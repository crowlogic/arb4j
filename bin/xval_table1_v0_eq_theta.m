pkg load financial;
addpath('/home/crow/git/crowlogic/arb4j/bin/rough_heston_matlab');
addpath('/home/crow/git/crowlogic/arb4j/bin/rough_heston_matlab/functions');
addpath('/home/crow/git/crowlogic/arb4j/bin/octshim');

S0 = 1; T = 1/252; H = 0.12; lam = 0.1; theta = 0.3156;
nu = 0.331; rho = -0.681; r = 0;
strikes = [0.95, 0.975, 1.0, 1.025, 1.05];

for K = strikes
    [c, p] = price_european(S0, K, T, H, lam, theta, nu, rho, r);
    fprintf('%.3f\t%.12f\t%.12f\n', K, c, p);
end
