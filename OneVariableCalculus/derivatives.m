%********FUNCTION*********
% independent variable
syms x;
% function f
f = x^4 + 2 * x^2 + 1;

% ***** 1st derivative *****
% Two ways to do:
g = diff(f);
h = diff(f, x);
disp('1st derivative of f');
disp(g);

% ***** nth derivative *****
n = 3;
% Two ways to do:
k = diff(f, n);
l = diff(f, x, n);
disp('3rd derivative of f');
disp(k);
