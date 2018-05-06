% ***** Function *****
% independent variable
syms x;
% function f
f = x^3 - 2 * x^2 + 4 * x - 5;

% print f on command window
disp(f);

% ***** Analytic solutions *****
% @ function: solve
% @ params:
%   . f: function/equation
%   . x: variable
% @ return: symbolic vector of analytic solutions

aSol = solve(f, x);
disp('Analytic solutions:');
disp(aSol);


% ***** Numerical solutions *****
% @ function: vpasolve
% @ params:
%   . f: function/equation
%   . x: variable
% @ return: symbolic vector of numerical solutions
nSol = vpasolve(f, x);
disp('Numerical solutions:');
disp(nSol);

% ***** Filter out real solutions *****
realRoots = []
for i = 1:numel(nSol)
    if isreal(nSol(i))
        realRoots(end + 1) = nSol(i);
    end
end

disp('Number of real roots:');
disp(numel(realRoots));
disp('Real roots:');
for i = 1:numel(realRoots)
    disp(realRoots(i));
end

% @ function: numel
% @ params:
%   . vector/array
% @ return: number of elements in the container

% @ function: isreal
% @ params:
%   . value
% @ return: TRUE or FALSE if the value is a real number or not


% ***** Polynomial equations *****
% @ function: roots
% @ params:
%   . p: vector containing (n + 1) polynomial coefficients
% @ return type: column vector of solutions
p = [1 3 2];
pSol = roots(p);
disp('Solutions of the polynomial:');
disp(pSol);
