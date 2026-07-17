function [q, err] = integral(f, a, b, varargin)

abstol = [];
reltol = [];
arrayvalued = false;
waypoints = [];
idx = 1;
while idx < numel(varargin)
    prop = varargin{idx};
    if ~ischar(prop)
        error('integral: property must be a string');
    end
    val = varargin{idx+1};
    switch lower(prop)
        case 'abstol'
            abstol = val;
        case 'reltol'
            reltol = val;
        case 'arrayvalued'
            arrayvalued = val;
        case 'waypoints'
            waypoints = val;
    end
    idx = idx + 2;
end

if ~arrayvalued
    arrayvalued = true;
end

opts = {};
if ~isempty(abstol), opts = [opts, {'AbsTol'}, {abstol}]; end
if ~isempty(reltol), opts = [opts, {'RelTol'}, {reltol}]; end
if nargout >= 2
    if ~isempty(waypoints)
        [q, err] = quadgk(f, a, b, opts{:}, 'Waypoints', waypoints);
    else
        [q, err] = quadgk(f, a, b, opts{:});
    end
else
    if ~isempty(waypoints)
        q = quadgk(f, a, b, opts{:}, 'Waypoints', waypoints);
    else
        q = quadgk(f, a, b, opts{:});
    end
end

end
