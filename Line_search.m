function xstart= Line_search(f,gradf,Hess,x0,tol,type)
rho = 0.9;
c = 0.6;
fx=feval(f,x0);
gradfx=feval(gradf,x0);
Hessfx=feval(Hess,x0);
if (strcmp(type,'steepest'))
    p = - gradfx/norm(gradfx);
else
    p = -(inv(Hessfx) * gradfx')';
end
alpha = 1;

while (f(x0 + alpha * p) > fx + c * alpha * dot(gradfx,p)) && (norm(alpha * gradfx) > tol)
    alpha = alpha * rho;
end
strcat('alpha=',num2str(alpha))

xstart = x0 + alpha * p;