function gradfx=grad_rose(x)
gradfx = [400 * x(1)^3 - 400 * x(1) * x(2) + 2 * x(1) - 2,-200 * x(1)^2 + 200 * x(2)];
