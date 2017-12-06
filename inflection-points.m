% ***** Function *****
% independent variable
syms x;
% function f
f = x^3 + 2 * x^2 - 5 * x + 1;

% print f on command window
disp(f);

% ***** Points of inflection *****
fprintf('Points of inflection: \n');
f2 = diff(f, x, 2);
x0_arr = vpasolve(f2);
for i = 1:numel(x0_arr)
    x0 = x0_arr(i);
    y0 = subs(f, x, x0);
    fprintf('x = %f; y = %f\n', x0, y0);
end

% ***** Graph *****
fplot(f);
hold on;
plot(x0_arr, subs(f, x0_arr), '*');
hold off;