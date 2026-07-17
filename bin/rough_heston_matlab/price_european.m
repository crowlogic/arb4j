function [call_price, put_price] = price_european(S0, K, T, H, lambda, theta, nu, rho, r)
% Rough Heston pricer wrapper (sigurdroemer/rough_heston, native MATLAB)
% Issue #1200 interface:
%   price_european(S0, K, T, H, lambda, theta, nu, rho, r)
% Prints a single line:  call_price put_price
%
% Convention (sigurdroemer): theta -> v_bar (long-run variance),
%   nu -> xi (vol-of-vol), alpha = H + 1/2
%
% Requires: MATLAB with Financial Toolbox (blsimpv), Optimization Toolbox
%   and the 'rough_heston_matlab/functions' directory on the path.
%
% Call as a script from the command line:
%   matlab -batch "price_european(100,100,1,0.3,2,0.04,0.3,-0.7,0.1)"

v_0 = theta;    % initial variance = long-run variance by default
alpha = H + 0.5;
N = 252;

addpath(fullfile(fileparts(mfilename('fullpath')), 'functions'));

[call_price, call_iv] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, theta, nu, rho, true,  K, T, 'N', N, 'r', r);
[put_price,  put_iv ] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, theta, nu, rho, false, K, T, 'N', N, 'r', r);

fprintf('%.12f %.12f\n', call_price, put_price);
end
