pkg load financial;
addpath('/home/crow/git/crowlogic/arb4j/bin/rough_heston_matlab');
addpath('/home/crow/git/crowlogic/arb4j/bin/rough_heston_matlab/functions');
addpath('/home/crow/git/crowlogic/arb4j/bin/octshim');

S0 = 1; r = 0;
models = {
  "M1", 0.12, 0.1,  0.3156, 0.331, -0.681;
  "M2", 0.30, 2.0,  0.04,   0.3,   -0.7;
};
expiries = [1/252, 1/52, 1.0];
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2];

fprintf('case_id,model,H,lam,theta,nu,rho,T,K,octave_call,octave_put\n');
for m = 1:size(models, 1)
    label = models{m, 1};
    H     = models{m, 2};
    lam_  = models{m, 3};
    theta = models{m, 4};
    nu    = models{m, 5};
    rho   = models{m, 6};
    for T = expiries
        for K = strikes
            [c, p] = price_european(S0, K, T, H, lam_, theta, nu, rho, r);
            case_id = cstrcat(label, '_T', num2str(T, '%.8f'), '_K', num2str(K, '%.3f'));
            fprintf('%s,%s,%.6f,%.6f,%.6f,%.6f,%.6f,%.8f,%.3f,%.12f,%.12f\n', ...
                case_id, label, H, lam_, theta, nu, rho, T, K, c, p);
        end
    end
end
