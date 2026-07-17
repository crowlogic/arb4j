function [x, fval, exitflag, output, lambda, grad, hessian] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options)

if nargin < 3 || isempty(A), A = []; end
if nargin < 4 || isempty(b), b = []; end
if nargin < 5 || isempty(Aeq), Aeq = []; end
if nargin < 6 || isempty(beq), beq = []; end
if nargin < 7, lb = []; end
if nargin < 8, ub = []; end
if nargin < 9, nonlcon = []; end
if nargin < 10, options = []; end

if ~isempty(A) || ~isempty(b) || ~isempty(Aeq) || ~isempty(beq)
    error('fmincon: linear constraints not implemented');
end
if ~isempty(nonlcon)
    error('fmincon: nonlinear constraints not implemented');
end

if isempty(lb), lb = -Inf; end
if isempty(ub), ub = Inf; end

% Handle degenerate case: lb == ub
if isscalar(lb) && isscalar(ub) && lb == ub
    x = lb;
    fval = fun(x);
    exitflag = 1;
    if nargout >= 4, output = struct('iterations',0,'funcCount',1,'algorithm','bounded 1-D'); end
    if nargout >= 5, lambda = []; end
    if nargout >= 6, grad = []; end
    if nargout >= 7, hessian = []; end
    return;
end

% Extract options
maxiter = 1e4;
maxfunevals = 1e4;
tolx = 1e-10;
display = 'off';
if isstruct(options)
    if isfield(options,'MaxIter') && ~isempty(options.MaxIter)
        maxiter = options.MaxIter;
    end
    if isfield(options,'MaxFunEvals') && ~isempty(options.MaxFunEvals)
        maxfunevals = options.MaxFunEvals;
    end
    if isfield(options,'TolX') && ~isempty(options.TolX)
        tolx = options.TolX;
    end
    if isfield(options,'Display') && ~isempty(options.Display)
        display = options.Display;
    end
end

opts = optimset('MaxIter',maxiter,'MaxFunEvals',maxfunevals,'TolX',tolx,'Display',display);

if isfinite(lb) && isfinite(ub)
  [x, fval, exitflag, output] = fminbnd(fun, lb, ub, opts);
else
  [x, fval, exitflag, output] = fminsearch(fun, x0, opts);
  if exitflag == 0
    exitflag = -1;
  else
    exitflag = 1;
  end
end

if nargout >= 5, lambda = []; end
if nargout >= 6, grad = []; end
if nargout >= 7, hessian = []; end

end
