% ***** First order differential equation *****
syms y(x) a;
eqn = diff(y, x) == a * y;
disp(dsolve(eqn));

% ***** Second order differential equation *****
eqn = diff(y, x, 2) == a * y;
disp(dsolve(eqn));

% ***** Differential equation with condition *****
eqn = diff(y, x) == a * y;
con = y(0) == 5;
disp(dsolve(eqn, con));

% ***** System of differential equations *****
syms z(m) w(m);
eqns = [diff(z, m) == w, diff(w, m) == -z];
disp(dsolve(eqns));
