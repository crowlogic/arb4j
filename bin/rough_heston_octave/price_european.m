#!/usr/bin/octave -q
args = argv();
S0    = str2double(args{1});
K     = str2double(args{2});
T     = str2double(args{3});
H     = str2double(args{4});
lambda= str2double(args{5});
v_bar = str2double(args{6});
xi    = str2double(args{7});
rho   = str2double(args{8});
r     = str2double(args{9});

v_0 = v_bar;
alpha = H + 0.5;
N = 252;

script_dir = fileparts(mfilename('fullpath'));
addpath(script_dir);
addpath(strcat(script_dir, '/functions'));
pkg load optim;
pkg load financial;

[call_price, call_iv] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, v_bar, xi, rho, true,  K, T, 'N', N, 'r', r);
[put_price,  put_iv ] = NumericalIntegrationRoughHeston(S0, v_0, alpha, lambda, v_bar, xi, rho, false, K, T, 'N', N, 'r', r);

printf("%.12f %.12f\n", call_price, put_price);
