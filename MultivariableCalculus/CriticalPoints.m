% ***** Variables *****
syms x y;


% ***** Function *****
% f = x^3 + y^3 + 2 * x^2 + 3 * y^2 + 5;
str = input('Input function: f = ');
f = matlabFunction(str);


% ***** Partial Derivatives *****
f_x = diff(f, x);
f_y = diff(f, y);
f_xx = diff(f_x, x);
f_xy = diff(f_x, y);
f_yy = diff(f_y, y);

fprintf('Partial derivatives:\n')

fprintf('  f_x = %s\n', f_x);
fprintf('  f_y = %s\n', f_y);
fprintf('  f_xx = %s\n', f_xx);
fprintf('  f_xy = %s\n', f_xy);
fprintf('  f_yy = %s\n', f_yy);

fprintf('\n');


% ***** Critical points *****
critical_points = solve(f_x == 0, f_y == 0);

fprintf('Critical points:\n');

for i = 1 : numel(critical_points.x)
    fprintf('  x = %s; ', critical_points.x(i));
    fprintf('  y = %s\n', critical_points.y(i));
end

fprintf('\n');


% ***** Extrema *****
fprintf('Extrema:\n');

for i = 1 : numel(critical_points.x)
    x_i = critical_points.x(i);
    y_i = critical_points.y(i);

    a = subs(f_xx, {x, y}, {x_i, y_i});
    b = subs(f_xy, {x, y}, {x_i, y_i});
    c = subs(f_yy, {x, y}, {x_i, y_i});
    d = a * c - b ^ 2;

    if (d > 0)
        if (a > 0)
            fprintf('  x = %s, y = %s is a local minimum\n', x_i, y_i);
        elseif (a < 0)
            fprintf('  x = %s, y = %s is a local maximum\n', x_i, y_i);
        end
    elseif (d < 0)
        fprintf('  x = %s, y = %s is a saddle point\n', x_i, y_i);
    else
        fprintf('  x = %s, y = %s : no conclusion\n', x_i, y_i);
    end
end

fprintf('\n');


% ***** Graph *****
% Find the suitable range for x and y
min_x = critical_points.x(1);
min_y = critical_points.y(1);
max_x = critical_points.x(1);
max_y = critical_points.y(1);

for i = 2 : numel(critical_points.x)
    x_i = critical_points.x(i);
    y_i = critical_points.y(i);

    if (x_i < min_x)
        min_x = x_i;
    elseif (x_i > max_x)
        max_x = x_i;
    end

    if (y_i < min_y)
        min_y = y_i;
    elseif (y_i > max_y)
        max_y = y_i;
    end
end

min_x = min_x - 10;
min_y = min_y - 10;
max_x = max_x + 10;
max_y = max_y + 10;

% Draw graph
x_range = linspace(min_x, max_x, 10);
y_range = linspace(min_y, max_y, 10);

[X, Y] = meshgrid(x_range, y_range);
Z = subs(f, {x, y}, {X, Y});

X_numeric = double(X);
Y_numeric = double(Y);
Z_numeric = double(Z);

mesh(X_numeric, Y_numeric, Z_numeric);

xlabel('x'); ylabel('y'); zlabel('z');

hold on

% Draw critical points
critical_points_z = [];

for i = 1 : numel(critical_points.x)
    x_i = critical_points.x(i);
    y_i = critical_points.y(i);
    critical_points_z(end + 1) = subs(f, {x, y}, {x_i, y_i});
end

scatter3(critical_points.x, critical_points.y, critical_points_z, 'filled');

hold off
