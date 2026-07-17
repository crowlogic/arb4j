addpath(genpath(pwd));
pkg load optim;
S0=100;K=100;T=0.5;H=0.05;lambda=1.5;v_bar=0.02;xi=0.4;rho=-0.5;r=0;
v_0=v_bar; alpha=H+0.5; N=252; beta=[];
[call_price, call_iv] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, v_bar, xi, rho, true,  K, T, 'N', N, 'r', r, 'beta', beta);
[put_price,  put_iv ] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, v_bar, xi, rho, false, K, T, 'N', N, 'r', r, 'beta', beta);
printf("UPSTREAM %.12f %.12f\n", call_price, put_price);
