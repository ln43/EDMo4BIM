%Resoud l'equation differentielle :
%        P'(t)=-gamma P(t)+f(R(t))R(t)-e^(-gamma A) f(RA(t)) RA(t)
%        R'(t)=-delta R(t)-f(R(t))R(t)+2e^(-gamma A) f(RA(t)) RA(t)
%   avec f(R(t))=f0*theta^n/(R(t)^n+theta^n)
%   et RA(t)=R(t-A)
% sur l'intervalle de temps tspan avec pour conditions initials:
%       P(t)=1, R(t)=1 quelque soit t<=A
% Utilisation du solver dde23

function sol=dde(gamma,delta,f0,n,A,theta,tspan)

    function dydt=equation(t,y,Z)
        R=y(2);
        P=y(1);
        ylag = Z(:,1);
        RA=ylag(2);
        dydt=[-gamma*P+Hill(R)*R-exp(-gamma*A)*Hill(RA)*RA ;
            -delta*R-Hill(R)*R+2*exp(-gamma*A)*Hill(RA)*RA];
    end

    function f=Hill(r)
       f=f0*theta^n/(r^n+theta^n);
    end

    function s = ddhist(t)
    % Constant history function for DDEX1.
    
        s =ones(2,1);
    end

    sol=dde23(@equation,A,@ddhist,tspan);
end