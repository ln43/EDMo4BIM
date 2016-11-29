f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
n=5;
%A=1;

%Recherche du A critique
Ac=a_c(f0,gamma,delta,theta,n)

tspan=[0,1000];
i=1;
for A=0.5:0.5:4.5
    N=length(0.5:0.5:5);
    sol=dde(gamma,delta,f0,n,A,theta,tspan);
    r_e=theta*(f0*(2*exp(-gamma*A)-1)/delta-1)^(1/n);
    figure(1);
    subplot(3,3,i)
    plot(sol.x,sol.y);
    title(strcat('A=',num2str(A)));
    xlabel('time t');
    ylabel('solution y');
    legend('P(t)','R(t)');
    i=i+1;
    
end



