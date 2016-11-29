function sol=dde(gamma,delta,f0,n,A,theta,tspan)

    function dydt=equation(t,y,Z)
        R=y(2);
        P=y(1);
        RA=Z(2,2);
        dydt=[-gamma*P+Hill(R)*R-exp(-gamma*A)*Hill(RA)*RA ;
            -delta*R-Hill(R)*R+2*exp(-gamma*A)*Hill(RA)*RA];
    end

    function f=Hill(r)
       f=f0*theta^n/(r^n+theta^n);
    end

    function s = ddhist(t)
    % Constant history function for DDEX1.
        s = 10*ones(2,1);
    end

    sol=dde23(@equation,[10^-30,A],@ddhist,tspan);
end