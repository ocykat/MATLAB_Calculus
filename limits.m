%********FUNCTION*********
% independent variable
syms x;
% function f
f = x^3 + 3 * x^2 + 2 * x^ 1 + 1;

% print f on command window
disp(f);

%********LIMITS*********
x0 = 0;
% limit
disp("lim x => x0 of f: ");
disp(limit(f, x, x0));

%limit from the left
disp("lim x => x0 from the left of f: ");
disp(limit(f, x, x0, 'left'));

%limit from the right
disp("lim x => x0 from the right of f: ");
disp(limit(f, x, x0, 'right'));