f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
n=5;
A=10;

tspan=[0,100];
sol=dde(gamma,delta,f0,n,A,theta,tspan);
figure(1);
plot(sol.x,sol.y);
title('A=1');
xlabel('time t');
ylabel('solution y');
legend('P(t)','R(t)');