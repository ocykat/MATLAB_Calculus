syms x y;

f = x^2 + y^2 + 2*x + 3*y;

disp('Function:')
disp(f)

disp('Riemann Sum: [0, 2] x [1, 3]; m = 100, n = 100');
result = Riemann(f, 0, 2, 1, 3, 100, 100);
disp(result);

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
