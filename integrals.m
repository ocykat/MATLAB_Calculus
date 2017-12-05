% independent variable
syms x;

% ***** Function *****
f = 1/(1 + x^2);

% ***** Indefinite integral *****
disp(int(f));

% ***** Definite integral *****
disp(int(f, 0, 1));

% ***** Improper integral *****
disp(int(f, 0, inf));
disp(int(f, 0, -inf));
