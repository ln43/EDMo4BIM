% Main Partie 2
% Representation des solutions stables

f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
A=1;

tspan=0:0.1:1;
aspan=0:0.1:1;
[a,t]=meshgrid(tspan,aspan);
i=1;
for c3=linspace(-10,10,9)
    
    c4=-f0*exp(c3*A);
    c1=-gamma-c3;
    c2=-(delta+0.5*f0)-c4;
    %strcat(num2str(c1),',',num2str(c2),',',num2str(c3),',',num2str(c4))
    pr=Stable(c1,c2,c3,c4,a,t);%Ligne =a, colonne = t (Premieres moitie = p, deuxieme moitie =r)
    figure(1)
    subplot(3,3,i)
    surf(a,t,pr(1:length(a),:))
    title(strcat('c3 = ',num2str(c3)))
    xlabel('a')
    ylabel('t')
    zlabel('p(t,a)')
    
    figure(2)
    subplot(3,3,i)
    surf(t,a,pr(length(a):length(pr)-1,:))
    title(strcat('c3 = ',num2str(c3)))
    xlabel('a')
    ylabel('t')
    zlabel('r(t,a)')
    i=i+1;
    %max(pr(1,:))
end
