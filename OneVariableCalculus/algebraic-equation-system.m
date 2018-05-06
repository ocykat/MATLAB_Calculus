% variables and parameters
syms x y a;

% ***** System of algebraic equations *****
fprintf('Algebraic equation with no parameters\n');
eq1 = x^2*y^2 == 0;
eq2 = x-y/2 == 1;

[solX, solY] = solve(eq1, eq2);

for i = 1:numel(solX)
    fprintf('x = %f; y = %f\n', solX(i), solY(i));
end


% ***** System of algebraic equations with parameters *****
disp('Algebraic equation with parameters');
eq1 = x^2*y^2 == 0;
eq2 = x-y/2 == a;

[solX, solY] = solve(eq1, eq2);

disp(solX);
disp(solY);
