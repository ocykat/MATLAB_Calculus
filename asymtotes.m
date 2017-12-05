% ***** Function *****
% independent variable
syms x;
% function f
f = (x^2 + x + 6)/(-3 * x - 4);

% print f on command window
disp(f);

% ***** Horizontal asymtote(s) *****
disp('Horizontal asymtote(s): ');
disp(limit(f, x, sym(inf)));
disp(limit(f, x, -sym(inf)));

% ***** Vertical asymtote(s) *****
[numerator, denominator] = numden(f);
disp('Vertical asymtote(s):');
disp(solve(denominator));

% ***** Slant asymtote(s) *****
m  = limit(f/x, x, sym(inf));
b = limit(f - m * x, x, sym(inf));
sa = m * x + b;
disp('Slant asymtote(s): ');
disp(sa);
