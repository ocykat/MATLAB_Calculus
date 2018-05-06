% ***** Function *****
% independent variable
syms x;
% function f
f = x^3 - 2 * x^2 + 5 * x + 1;

% print f on command window
disp(f);

% ***** Tangent line at (x0, y0) on the graph *****
x0 = 5;
disp('Given x0: ');
disp(x0);
% 1st derivative of f
f1 = diff(f, x);
% slope of the tangent line
m = subs(f1, x, x0);
% calculate y0
y0 = subs(f, x, x0);
% y-intercept of the tangent line
b = m * (-x0) + y0;
% tangent line
t = m * x + b;
disp('Tangent line: ');
disp(t);

% ***** Tangent line with specific slope *****
% given slope
m = 2
disp('Given slope: ');
disp(m);
% Find the coordinate x0 of the tangent point(s)
x0_arr = vpasolve(f, x);
for i = 1:numel(x0_arr)
    disp('x0 = ');
    disp(x0_arr(i));

    % Evaluate y0
    y0 = subs(f, x, x0_arr(i));

    % y-intercept of the tangent line
    b = m * (-x0) + y0;

    % tangent line
    t = m * x + b;
    disp('Tangent line: ');
    disp(t);
end


% ***** Tangent line through A(xA, yA) not on the graph *****
xA = 3;
yA = 4;
disp('Given point:');
disp('xA');
disp(xA);
disp('yA');
disp(yA);
% 1st derivative of f
f1 = diff(f, x);
% Find the coordinate x0 of the tangent point(s)
eq = f1 * (x - xA) + yA - f;
x0_arr = vpasolve(f, x);
disp(numel(x0_arr));
% Find the coordinate x0 of the tangent point(s)
y0_arr = [];
for i = 1:numel(x0_arr)
    if (isreal(x0_arr(i))) % check if x0 is real
        disp('x0 = ');
        disp(x0_arr(i));

        % Evaluate y0
        y0 = subs(f, x, x0_arr(i));

        % slope of the tangent line
        m = subs(f1, x, x0);

        % y-intercept of the tangent line
        b = m * (-x0) + y0;
        % tangent line
        t = m * x + b;
        disp('Tangent line: ');
        disp(t);
    end
end
