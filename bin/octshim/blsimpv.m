function Volatility = blsimpv(Price, Strike, Rate, Time, Value, varargin)

% Defaults
Limit = 10;
Yield = 0;
Tolerance = 1e-6;
Class = true; % true=call

% Parse varargin for name-value pairs
i = 1;
while i < numel(varargin)
    name = varargin{i};
    if ~ischar(name)
        % Positional trailing args: Limit, Yield, Tolerance, Class
        switch nargin - 5
            case 1
                Limit = name;
            case 2
                Limit = name;
                Yield = varargin{i+1};
            case 3
                Limit = name;
                Yield = varargin{i+1};
                Tolerance = varargin{i+2};
            case 4
                Limit = name;
                Yield = varargin{i+1};
                Tolerance = varargin{i+2};
                Class = varargin{i+3};
        end
        break;
    end
    val = varargin{i+1};
    switch lower(name)
        case 'yield'
            Yield = val;
        case 'class'
            Class = val;
        case 'limit'
            Limit = val;
        case 'tolerance'
            Tolerance = val;
    end
    i = i + 2;
end

% Convert Class if cell
if iscell(Class)
    if any(strcmpi(Class,'put'))
        Class = false;
    else
        Class = true;
    end
end

% Bisection search for implied volatility
lo = Tolerance;
hi = Limit;
maxiter = 100;

for iter = 1:maxiter
    mid = (lo + hi) / 2;
    [c, p] = blsprice(Price, Strike, Rate, Time, mid, Yield);
    if Class
        fwd = c;
    else
        fwd = p;
    end
    diff = fwd - Value;
    if abs(diff) < Tolerance
        Volatility = mid;
        return;
    end
    if diff > 0
        hi = mid;
    else
        lo = mid;
    end
    if hi - lo < eps(hi)
        break;
    end
end

Volatility = (lo + hi) / 2;

end
