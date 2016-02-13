%% case1
clear;
x0=[1.2 1.2];
f=@rosenbrock;
gradf=@grad_rose;
Hess=@Hess_rose;
% u just need to cancel the note of the following 2 sentences
% xstart= Line_search(f,gradf,Hess,x0,1e-5,'newton') ;
% xstart= Line_search(f,gradf,Hess,x0,1e-5,'steepest');
% the final parameter is 'steepest' and 'newton'
tol = 10^(-5);
while abs(xstart-x0) > tol
    x0 = xstart;
    xstart = Line_search(f,gradf,Hess,x0,1e-5,'newton') ;
end
f(xstart)

%% case 2
clear;
x0=[-1.2 1];
f=@rosenbrock;
gradf=@grad_rose;
Hess=@Hess_rose;
% xstart= Line_search(f,gradf,Hess,x0,1e-5,'newton') ;
% xstart= Line_search(f,gradf,Hess,x0,1e-5,'steepest');
tol = 10^(-5);
while abs(xstart-x0) > tol
    x0 = xstart;
    xstart = Line_search(f,gradf,Hess,x0,1e-5,'newton') ;
end
f(xstart)

%% 3.9 case 1 
clear;
x0=[1.2 1.2];
tol = 10^(-5);
f=@rosenbrock;
gradf=@grad_rose;
Hess=@Hess_rose;
H0 = inv(feval(Hess,x0));
p0 = -H0 * feval(gradf,x0)';
s0 = (Line_search_BFGS(f,gradf,Hess,x0,tol,p0) * p0)';
while (Line_search_BFGS(f,gradf,Hess,x0,tol,p0)>tol)
    y0 = feval(gradf,x0 + s0) - feval(gradf,x0);
    rho0 = 1/(dot(y0,s0));
    H1 = (1 - rho0 * s0' * y0) * H0 * (1 - rho0 * y0' * s0) + rho0 * s0' * s0;
    H0 = H1;
    x0 = x0 + s0;
    p0 = - H0 * feval(gradf,x0)';
    s0 = (Line_search_BFGS(f,gradf,Hess,x0,tol,p0) * p0)';
end

feval(f,x0)


