syms x;

% ***** Maclaurin polynomial of degree n *****
f = exp(x) * log(1 + x);
n = 5;
disp(taylor(f, x, 'Order', n));

% ***** Taylor polynomial of degree n where x = x0 *****
f = exp(x + 1);
n = 5;
x0 = 1;
disp(taylor(f, x, x0, 'Order', n));
