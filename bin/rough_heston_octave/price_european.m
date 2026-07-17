#!/usr/bin/octave -q
# Rough Heston pricer wrapper (sigurdroemer/rough_heston, Octave port)
# Issue #1200 interface:
#   price_european.m S0 K T H lambda theta nu rho r
# Prints a single line:  call_price put_price
# Convention (sigurdroemer): v_0 and v_bar are VARIANCES, alpha = H + 1/2
#   theta -> v_bar (long-run variance), nu -> xi (vol-of-vol), lambda -> lambda
args = argv();
S0    = str2double(args{1});
K     = str2double(args{2});
T     = str2double(args{3});
H     = str2double(args{4});
lambda= str2double(args{5});
v_bar = str2double(args{6});   # theta: long-run variance
xi    = str2double(args{7});   # nu: vol-of-vol
rho   = str2double(args{8});
r     = str2double(args{9});

v_0 = v_bar;                   # initial variance = long-run variance by default
alpha = H + 0.5;
beta = [];                     # auto (optimal contour per Lord-Kahl)

script_dir = fileparts(mfilename('fullpath'));
addpath(script_dir);
addpath(strcat(script_dir, '/functions'));
pkg load optim;
pkg load financial;

# Adaptive N: double N until price stabilizes (delta == 0 at machine precision)
N = 252;
last_call = NaN;
last_put = NaN;

while true
    call_price = NaN; put_price = NaN;
    try
        [call_price, ~] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, v_bar, xi, rho, true,  K, T, 'N', N, 'r', r, 'beta', beta);
        [put_price,  ~] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, v_bar, xi, rho, false, K, T, 'N', N, 'r', r, 'beta', beta);
    catch
        call_price = NaN;
        put_price = NaN;
    end
    if isnan(call_price) || isnan(put_price)
        N = N * 2;
        continue;
    end
    if call_price == last_call && put_price == last_put && ~isnan(last_call)
        break;
    end
    last_call = call_price;
    last_put = put_price;
    N = N * 2;
end

if isnan(call_price) || isnan(put_price)
    error('RoughHestonOctave: no convergence at N=%d', N);
end

printf("%.12f %.12f\n", call_price, put_price);
