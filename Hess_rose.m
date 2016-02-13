function Hfx=Hess_rose(x)
Hfx = [1200 * x(1)^2 - 400 * x(2) + 2, -400 * x(1);  -400 * x(1),200];