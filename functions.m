%********FUNCTION*********
% independent variable
syms x;
% function f
f = x^2 + 2 * x - 1;

% print f on command window
disp(f);

% ***** Inverse Function *****
g = finverse(f);
disp('Inverse function of f: ');
disp(g);

% ***** Composite Function *****
h = 5 / x;
k = compose(f, h);
disp('Composite function h(f(x)): ');
disp(k);

% ***** Evaluate function at a number *****
x0 = 4;
y0 = subs(f, x, x0);
disp('f(4) = ');
disp(y0);

% ***** Simplify expression *****
p = x^2 + x + 2 * x ^ 2 - 3 * x
disp('p after simplification using simplify: ');
disp(simplify(p));

% ***** Solve the equation *****
disp('Solutions for f = 0: ');
disp(solve(f));