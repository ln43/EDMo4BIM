% Retourne la solution (p(a,t),r(a,t)) stationnaire :
%   p=p(0)exp(-gamma a)
%   r=r(0)exp(-(delta+f0/2)a)

function pr=Stationnaire(gamma,delta,f0,r0,aspan,tspan)

    function PR=stationnaire(a,t)
        PR=[f0*r0*exp(-gamma*a)/(2*delta+f0);r0*exp(-(delta+f0/2)*a)];
    end

pr=feval(@stationnaire,aspan,tspan);
end