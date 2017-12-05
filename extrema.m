% ***** Function *****
% independent variable
syms x;
% function f
f = x^3 + 2 * x^2 - 5 * x + 1;

% print f on command window
disp(f);

% first derivative of f
f1 = diff(f, x, 1);

% ***** Extrema *****
% find extrema
sol = vpasolve(f1, x);
extrema = [];
for i = 1:numel(sol)
    if (isreal(sol(i)))
        extrema(end + 1) = sol(i);
    end
end

% second derivative of f
f2 = diff(f, x, 1);

% find maxima and minima using second derivative test
fprintf('Number of extrema: %d\n\n', numel(extrema));

for i = 1:numel(extrema)
    fprintf('Extrema %d: x = %f', i, extrema(i));

    f2_x = subs(f2, x, extrema(i));
    if (f2_x < 0)
        fprintf(' is a maximum\n');
    else
        fprintf(' is a minimum\n');
    end
end

% ***** Extrema on interval *****
% @ First method: using loop
a = -1;
b = +1;
fprintf('Extrema on the interval [%f, %f]:\n', a, b);

% find maxima and minima using second derivative test
for i = 1:numel(extrema)
    % check if extreme point lies in the interval
    if (extrema(i) >= a && extrema(i) <= b)
        fprintf('Extrema %d: x = %f', i, extrema(i));

        f2_x = subs(f2, x, extrema(i));
        if (f2_x < 0)
            fprintf(' is a maximum\n');
        else
            fprintf(' is a minimum\n');
        end
    end
end

% ***** Global minimum/maximum *****
x_min = min(extrema);
y_min = subs(f, x, x_min);
x_max = max(extrema);
y_max = subs(f, x, x_max);
fprintf('Global minimum: x = %f; y = %f', x_min);
fprintf('Global maximum: x = %f; y = %f', x_max);

% @ Second method: using fminbnd (cannot be used for closed interval)
