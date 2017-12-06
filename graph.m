% ***** Function *****
% independent variable
syms x;
% function f
f    = x^2 + 2 * x - 1;

% print f on command window
disp(f);

% ***** Auto-formatted graph *****
fplot(f);

% ***** Graph on the interval [a, b] *****
a = 0;
b = 3;
ezplot(f, [a, b]);

% ***** Graph on the interval [a, b] with stepping *****
a    = 0;
b    = 100;
step = 5;                % the smaller the step, the smoother the graph
y    = [a:step:b];       % note: another way is y = linspace(a, step, b);
g    = y.^2 + 2 * y - 1; % note: if y is followed by the power operator, there must be a dot in between
plot(y, g);

% ***** Area under the graph *****
a = -10;
b = 10;
step = 0.5;
y = [a:step:b];
g = y.^3 + 2 * y.^2 - 5 * y + 1;
area(g);