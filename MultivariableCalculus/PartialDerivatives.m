% ***** Variables *****
syms x y;

% ***** Function *****
f = x^2 + y^2 + 2 * x + 3 * y;

% ***** Partial derivatives *****
f_x = diff(f, x);
f_y = diff(f, y);

disp('Partial derivative with respect to x: ');
disp(f_x);
disp('Partial derivative with respect to y: ');
disp(f_y);
