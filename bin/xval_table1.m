pkg load financial;
addpath(fullfile(fileparts(mfilename('fullpath')), 'rough_heston_matlab'));
addpath(fullfile(fileparts(mfilename('fullpath')), 'rough_heston_matlab', 'functions'));
addpath(fullfile(fileparts(mfilename('fullpath')), 'octshim'));

% Published Reference Table 1
% Model: H=0.12 (μ=α=H+½=0.62), λ=0.1, ρ=-0.681,
%        θ=0.3156, ν=0.331, V₀=0.0392, S₀=1, r=0, T=1/252
S0 = 1; T = 1/252; H = 0.12; alpha = H + 0.5;
lam = 0.1; v_bar = 0.3156; xi = 0.331; rho = -0.681;
r = 0; v0 = 0.0392; N = 252;
strikes = [0.95, 0.975, 1.0, 1.025, 1.05];

fprintf('=== MATLAB (Octave) — Reference Table 1 ===\n');
fprintf('Parameters: S0=1, T=1/252, H=0.12 (α=0.62), λ=0.1, ρ=-0.681,\n');
fprintf('            θ=0.3156, ν=0.331, V₀=0.0392, r=0\n\n');
fprintf('Strike\tCall\t\tPut\t\tIV\n');
for K = strikes
    [c, civ] = NumericalIntegrationRoughHeston(S0, v0, alpha, lam, v_bar, xi, rho, true,  K, T, 'N', N, 'r', r);
    [p, piv] = NumericalIntegrationRoughHeston(S0, v0, alpha, lam, v_bar, xi, rho, false, K, T, 'N', N, 'r', r);
    fprintf('%.3f\t%.12f\t%.12f\t%.6f\n', K, c, p, civ);
end
