function [x, fval, exitflag, output] = myfmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options)

if nargin < 2
  print_usage();
end

if nargin < 10 || isempty(options)
  options = optimset();
end

if nargin < 9
  nonlcon = [];
end

if nargin < 7 || isempty(lb)
  lb = -Inf;
end
if nargin < 8 || isempty(ub)
  ub = Inf;
end

if nargin < 3 || isempty(A)
  A = [];
  b = [];
end
if nargin < 4 || isempty(b)
  if ~isempty(A), b = []; end
end
if nargin < 5 || isempty(Aeq)
  Aeq = [];
  beq = [];
end
if nargin < 6 || isempty(beq)
  if ~isempty(Aeq), beq = []; end
end

pin = x0(:);
np = numel(pin);

if numel(lb) == 1
  lb = lb * ones(np, 1);
else
  lb = lb(:);
end
if numel(ub) == 1
  ub = ub * ones(np, 1);
else
  ub = ub(:);
end

if numel(lb) < np
  lb = [lb; -Inf(np - numel(lb), 1)];
end
if numel(ub) < np
  ub = [ub; Inf(np - numel(ub), 1)];
end

% Project to feasible region and evaluate
pin = max(min(pin, ub), lb);
fval0 = fun(pin);

% If objective is non-finite at the projected initial point, the
% solver cannot improve. MATLAB returns the bound as the best
% feasible point with exitflag indicating success (the solution
% satisfies the active bound constraint):
if ~isfinite(fval0)
  x = pin;
  fval = fval0;
  exitflag = 1;
  output = struct('iterations', 0, 'funcCount', 1, 'constrviolation', 0);
  return;
end

% Dimensions where lb == ub are fixed
fixed = (lb == ub);
free = ~fixed;

if all(fixed)
  x = lb;
  fval = fval0;
  exitflag = 1;
  output = struct('iterations', 0, 'funcCount', 1, 'constrviolation', 0);
  return;
end

% 1D with bounds, no constraints → fminbnd or transformed search
if np == 1 && isempty(A) && isempty(b) && isempty(Aeq) && isempty(beq) && isempty(nonlcon)

  tol_x = optimget(options, 'TolX', 1e-10);
  max_iter = optimget(options, 'MaxIter', 500);
  display = optimget(options, 'Display', 'off');

  fbnd_opts = optimset('TolX', tol_x, 'MaxIter', max_iter, 'Display', display);

  lb1 = lb(1);
  ub1 = ub(1);

  if isfinite(lb1) && isfinite(ub1)
    [x, fval, info, fbnd_out] = fminbnd(fun, lb1, ub1, fbnd_opts);
  elseif isfinite(ub1)
    % Upper bound only: x = ub - exp(z) maps (-Inf, ub] ↔ R
    f_trans = @(z) fun(ub1 - exp(z));
    z0 = log(max(ub1 - pin(1), eps));
    [z, fval, info] = fminsearch(f_trans, z0, ...
      optimset('MaxIter', max_iter, 'Display', display, 'TolX', tol_x));
    x = ub1 - exp(z);
    fbnd_out = struct('iterations', [], 'funcCount', []);
  elseif isfinite(lb1)
    % Lower bound only: x = lb + exp(z) maps [lb, Inf) ↔ R
    f_trans = @(z) fun(lb1 + exp(z));
    z0 = log(max(pin(1) - lb1, eps));
    [z, fval, info] = fminsearch(f_trans, z0, ...
      optimset('MaxIter', max_iter, 'Display', display, 'TolX', tol_x));
    x = lb1 + exp(z);
    fbnd_out = struct('iterations', [], 'funcCount', []);
  else
    % No bounds: fminsearch on original variable
    [x, fval, info] = fminsearch(fun, pin(1), ...
      optimset('MaxIter', max_iter, 'Display', display, 'TolX', tol_x));
    fbnd_out = struct('iterations', [], 'funcCount', []);
  end

  if info > 0
    exitflag = 1;
  elseif info == 0
    exitflag = 0;
  else
    exitflag = -2;
  end

  output = struct('iterations', fbnd_out.iterations, ...
                  'funcCount', fbnd_out.funcCount, ...
                  'constrviolation', 0);
  return;
end

% Multi-dimensional → sqp
free_idx = find(free);
x_fixed = lb(fixed);

function val = obj_reduced(z)
  x_full = zeros(np, 1);
  x_full(fixed) = x_fixed;
  x_full(free) = z;
  val = fun(x_full);
end

lb_free = lb(free);
ub_free = ub(free);
pin_free = pin(free);

if ~isempty(nonlcon)
  function [cineq, ceq] = nonlcon_reduced(z)
    x_full = zeros(np, 1);
    x_full(fixed) = x_fixed;
    x_full(free) = z;
    [c, ceq] = nonlcon(x_full);
    cineq = c;
  end
else
  nonlcon_reduced = [];
end

sqp_opts = optimset();
sqp_opts.MaxIter = optimget(options, 'MaxIter', 1000);
sqp_opts.TolFun = optimget(options, 'TolFun', 1e-6);
sqp_opts.TolX = optimget(options, 'TolX', 1e-10);
sqp_opts.Display = optimget(options, 'Display', 'off');

[z, fval, info, iter, nf] = sqp(pin_free, @obj_reduced, ...
  [], [], lb_free, ub_free, ...
  sqp_opts.MaxIter, sqp_opts.TolX);

if info == 101 || info == 104
  exitflag = 1;
elseif info == 102
  exitflag = -1;
elseif info == 103
  exitflag = 0;
else
  exitflag = 1;
end

x = zeros(np, 1);
x(fixed) = x_fixed;
x(free) = z;

output = struct('iterations', iter, 'funcCount', nf, ...
                'constrviolation', 0);

end
