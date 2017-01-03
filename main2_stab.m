% Main Partie 2
% Representation des solutions stables

f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
A=-log(2*delta/f0)/gamma;

tspan=0:0.1:10;
aspan=0:0.5:2*A;
[t,a]=meshgrid(tspan,aspan);
i=1;
for c3=linspace(-10,10,3)
    
    c4=-f0*exp(c3*A);
    c1=-gamma-c3;
    c2=-(delta+0.5*f0)-c4;
    %strcat(num2str(c1),',',num2str(c2),',',num2str(c3),',',num2str(c4))
    pr=Stable(c1,c2,c3,c4,a,t);%Ligne =a, colonne = t (Premieres moitie = p, deuxieme moitie =r)
    
    %Representation de p en fonction de t et a pour différents c3 pris
    figure(1)
    subplot(2,3,i)
    h=surf(a,t,pr(1:length(a(:,1)),:));
    h.LineStyle='none';
    title(strcat('c3 = ',num2str(c3)))
    xlabel('a')
    ylabel('t')
    zlabel('p(t,a)')
    axis([0 2*A 0 10 0 1])
    
    %Representation de r en fonction de t et a pour différents c3 pris
    %figure(2)
    subplot(2,3,i+3)
    g=surf(a(2:length(a(:,1)),:),t(2:length(a(:,1)),:),pr(length(a(:,1))+1:length(pr(:,1))-1,:));
    g.LineStyle='none';
    title(strcat('c3 = ',num2str(c3)))
    xlabel('a')
    ylabel('t')
    zlabel('r(t,a)')
    i=i+1;
    
end
