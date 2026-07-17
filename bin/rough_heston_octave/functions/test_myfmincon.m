function test_myfmincon
% Tests for myfmincon — MATLAB-compatible fmincon for Octave
% Run with:  test_myfmincon

pass = 0; fail = 0;

function ok(cond, msg)
  if cond
    pass = pass + 1;
    fprintf('  PASS: %s\n', msg);
  else
    fail = fail + 1;
    fprintf('  FAIL: %s\n', msg);
  end
end

%% 1. lb == ub → return bound
fprintf('\n=== lb == ub ===\n');
[x, fval, exitflag] = myfmincon(@(x)x.^2, 5, [], [], [], [], 3, 3, [], optimset('Display','off'));
ok(x == 3 && fval == 9 && exitflag == 1, 'lb==ub returns bound with exitflag=1');

%% 2. 1D quadratic, both bounds finite
fprintf('\n=== 1D bounded quadratic ===\n');
[x, fval, exitflag] = myfmincon(@(x)(x-2).^2, 0, [], [], [], [], -10, 10, [], optimset('Display','off'));
ok(abs(x-2) < 1e-4 && abs(fval) < 1e-4, '1D quadratic minimum at x=2');

%% 3. 1D upper bound only (lb=-Inf)
fprintf('\n=== Upper bound only ===\n');
[x, fval] = myfmincon(@(x)(x-5).^2, 10, [], [], [], [], [], 6, [], optimset('Display','off'));
ok(x < 6 + 1e-4, 'upper bound only: x satisfies ub');
ok(abs(x-5) < 1e-4, 'upper bound only: min at x=5 (inside bounds)');

%% 4. 1D lower bound only (ub=Inf)
fprintf('\n=== Lower bound only ===\n');
[x, fval] = myfmincon(@(x)(x+3).^2, -10, [], [], [], [], -2, [], [], optimset('Display','off'));
ok(x > -2 - 1e-4, 'lower bound only: x satisfies lb');
ok(abs(x+2) < 1e-4 && abs(fval - 1) < 1e-4, 'lower bound only: min at x=-2 (active bound)');

%% 5. 1D no bounds (both infinite)
fprintf('\n=== No bounds ===\n');
[x, fval] = myfmincon(@(x)(x-10).^2, 0, [], [], [], [], [], [], [], optimset('Display','off'));
ok(abs(x-10) < 1e-4, 'no bounds: min at x=10');

%% 6. Objective returns Inf at bound — return bound
fprintf('\n=== Inf objective at bound ===\n');
f_inf_at_zero = @(x) 1./abs(x);  % Inf at x=0
[x, fval, exitflag] = myfmincon(f_inf_at_zero, 0, [], [], [], [], [], 0, [], optimset('Display','off'));
ok(x == 0 && ~isfinite(fval) && exitflag == 1, 'Inf obj at bound: returns bound with exitflag=1');

%% 7. Objective returns NaN at initial point
fprintf('\n=== NaN objective at start ===\n');
f_nan = @(x) NaN;
[x, fval, exitflag] = myfmincon(f_nan, 3, [], [], [], [], 0, 5, [], optimset('Display','off'));
ok(x == 3 && isnan(fval) && exitflag == 1, 'NaN obj: returns x0 with exitflag=1');

%% 8. Fixed variable (lb==ub) with free variable
fprintf('\n=== Mixed fixed/free ===\n');
f2 = @(x) (x(1)-2)^2 + (x(2)+1)^2;
lb = [3; -Inf];
ub = [3; Inf];
[x, fval] = myfmincon(f2, [0;0], [], [], [], [], lb, ub, [], optimset('Display','off'));
ok(abs(x(1)-3) < 1e-10, 'fixed x1=3');
ok(abs(x(2)+1) < 1e-4, 'free x2=-1');

%% 9. Linear inequality constraint
fprintf('\n=== Linear inequality ===\n');
A = [1, -1]; b = 0;  % x1 >= x2
[x, fval] = myfmincon(@(x)(x(1)-1)^2+(x(2)-1)^2, [5;0], A, b, [], [], [], [], [], optimset('Display','off'));
ok(x(1) >= x(2) - 1e-4, 'linear inequality satisfied');
ok(abs(x(1)-1) < 0.1 || abs(x(2)-1) < 0.1, 'near minimum');

%% 10. Exit flag > 0 on convergence
fprintf('\n=== Exit flag ===\n');
[~, ~, exitflag] = myfmincon(@(x)(x-1)^2, 0, [], [], [], [], -10, 10, [], optimset('Display','off'));
ok(exitflag > 0, 'exitflag > 0 on convergence');

%% Summary
fprintf('\n=== Results: %d pass, %d fail ===\n', pass, fail);
if fail > 0
  error('myfmincon: tests failed');
end
end
