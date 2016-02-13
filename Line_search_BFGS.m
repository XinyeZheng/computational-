function alpha = Line_search_BFGS(f,gradf,Hess,x0,tol,p)
rho = 0.5;
c = 0.7;
fx=feval(f,x0);
gradfx=feval(gradf,x0);
Hessfx=feval(Hess,x0);
alpha = 1;

while (f(x0 + alpha * p') > fx + c * alpha * dot(gradfx,p)) && (norm(alpha * gradfx) > tol)
    alpha = alpha * rho;
end