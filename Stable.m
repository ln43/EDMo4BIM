% Retourne la solution (p(a,t),r(a,t)) stable :
%   p=A1(0)T1(0)exp(c1*t+c3*a)
%   r=A2(0)T2(0)exp(c2*t+c4*a)
% A1(0)=A2(0)=T1(0)=T1(0)=1

function pr=Stable(c1,c2,c3,c4,aspan,tspan)

    function PR=stable(a,t)
        PR=[exp(c1*t+c3*a);exp(c2*t+c4*a)];
    end

pr=feval(@stable,aspan,tspan);
end