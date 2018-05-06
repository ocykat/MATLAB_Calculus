syms x y;

% f = x^2 + y^2 + 2*x + 3*y;
f = matlabFunction(input('Input function: f = '));

a = double(input('a = '));
b = double(input('b = '));
c = double(input('c = '));
d = double(input('d = '));
m = double(input('m = '));
n = double(input('n = '));

sum = Riemann(f, a, b, c, d, m, n);
midpoint_sum = SumMidpointRule(f, a, b, c, d, m, n);
fprintf('Sum = %f\n', sum);
fprintf('Midpoint Rule: Sum = %f\n', midpoint_sum);


function [sum] = Riemann(f, a, b, c, d, m, n)
    syms x y;
    dx = (b - a) / m;
    dy = (d - c) / n;
    dA = dx * dy;
    sum = 0;
    for i = 0 : (m - 1)
        for j = 0 : (n - 1)
            xi = a + i * dx;
            yj = c + j * dy;
            sum = sum + subs(f, {x, y}, {xi, yj}) * dA;
        end
    end
end


function [sum] = SumMidpointRule(f, a, b, c, d, m, n)
    syms x y;
    dx = (b - a) / m;
    dy = (d - c) / n;
    dA = dx * dy;
    sum = 0;
    for i = 0 : (m - 1)
        for j = 0 : (n - 1)
            xi = a + dx / 2 + i * dx;
            yj = c + dy / 2 + j * dy;
            sum = sum + subs(f, {x, y}, {xi, yj}) * dA;
        end
    end
end
