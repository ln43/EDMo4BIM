f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
n=5;
%A=1;

%Recherche du A critique
Ac=a_c(f0,gamma,delta,theta,n)


tspan=[0,1000];
sol=dde(gamma,delta,f0,n,Ac,theta,tspan);
 r_e=theta*(f0*(2*exp(-gamma*Ac)-1)/delta-1)^(1/n)
figure(1);
plot(sol.x,sol.y);
title(strcat('A=',num2str(Ac)));
xlabel('time t');
ylabel('solution y');
legend('P(t)','R(t)');


