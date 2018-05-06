% ***** Function *****
% independent variable
syms x;

% To calculate numerical value, use the double() function

% ***** Area under a curve *****
f = 4 * x - x^2;

disp(AreaUnderCurve(f));

% ***** Volume of revolution *****
f = sqrt(x);
disp(VolumeOfRevolution(f, 0, 4));

% ***** Volume by cylindrical shell *****
f = x^2;
disp(VolumeByCylindricalShell(f, 1, 2));

% ***** Arc length *****
f = (x^2)/2 - log(x)/4;
disp(double(ArcLength(f, 1, 3)));

% ***** Area of surface of revolution *****
f = sin(2 * x);
disp(double(AreaOfSurfaceOfRevolution(f, 0, pi / 2)));


% ***** FUNCTION DEFINITION *****
function [S] = AreaUnderCurve(ff)
    g = abs(ff);

    sol = vpasolve(ff);
    a = min(sol);
    b = max(sol);

    S = int(g, a, b);
end

function [V] = VolumeOfRevolution(ff, a, b)
    g = ff^2;
    V = pi * int(g, a, b);
end

function [V] = VolumeByCylindricalShell(ff, a, b)
    syms x;
    g = abs(x * ff);
    V = 2 * pi * int(g, a, b);
end

function [L] = ArcLength(ff, a, b)
    syms x;
    g = sqrt(1 + diff(ff, x)^2);
    L = int(g, a, b);
end

function [S] = AreaOfSurfaceOfRevolution(ff, a, b)
    syms x;
    g = ff * sqrt(1 + diff(ff, x)^2);
    S = 2 * pi * int(g, a, b);
end
