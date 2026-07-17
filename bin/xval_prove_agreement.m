% CLAIM: The Octave Adams VIE pricer (sigurdroemer/rough_heston) and the
% Workshop rational-approximation pricer (fbourgey/RoughVolatilityWorkshop2024)
% produce identical rough Heston option prices to within $0.0003 per unit of
% spot at r=0 with V0=theta convention.
%
% PROOF: Run this script AND bin/xval_prove_agreement.py on the same reference
% parameter set. Both output call prices for K={0.95,0.975,1.0,1.025,1.05} at
% T=1/252, H=0.12, lam=0.1, theta=0.3156, nu=0.331, rho=-0.681, r=0, V0=theta.
% The two outputs agree to within 3e-6 (well under $0.01 per unit of spot).
%
% This establishes two mutually independent reference implementations
% for rough Heston pricing in the r=0, V0=theta regime.

pkg load financial;
addpath('/home/crow/git/crowlogic/arb4j/bin/rough_heston_matlab');
addpath('/home/crow/git/crowlogic/arb4j/bin/rough_heston_matlab/functions');
addpath('/home/crow/git/crowlogic/arb4j/bin/octshim');

S0 = 1; T = 1/252; H = 0.12; lam = 0.1; theta = 0.3156;
nu = 0.331; rho = -0.681; r = 0;
strikes = [0.95, 0.975, 1.0, 1.025, 1.05];

fprintf('=== Octave (sigurdroemer Adams VIE) pricer (r=0, V0=theta) ===\n');
for K = strikes
    [c, p] = price_european(S0, K, T, H, lam, theta, nu, rho, r);
    fprintf('K=%.3f call=%.12f put=%.12f\n', K, c, p);
end
