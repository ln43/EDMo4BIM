% Main Partie 2
% Representation des solutions stationnaires grace a Stationnaire.m

%Parametres
f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
A=-log(2*delta/f0)/gamma % Condition 11

tspan=0:0.1:1;
aspan=0:0.5:2*A;
[t,a]=meshgrid(tspan,aspan);
i=1;

r0=theta; % condition initiale r0

%Simulation des solutions
pr=Stationnaire(gamma,delta,f0,r0,a,t);
 

figure(1)
% p(t,a)
subplot(1,2,1)
h=surf(a,t,pr(1:length(a(:,1)),:));
h.LineStyle='none';
title('Solutions stationnaires p')
xlabel('a')
ylabel('t')
zlabel('p(t,a)')
    
subplot(1,2,2)
% r(t,a)
h=surf(a(2:length(a(:,1)),:),t(2:length(a(:,1)),:),pr(length(a(:,1))+1:length(pr)-1,:));
h.LineStyle='none';
title('Solutions stationnaires r')
xlabel('a')
ylabel('t')
zlabel('r(t,a)')
