% Simulations des equations a retard
% P

f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
n=5;
tmax=2000;

%Recherche du A critique
Ac=a_c(f0,gamma,delta,theta,n)

Amax=min(log(2)/gamma,-log((delta+f0)/(2*f0))/gamma)
tspan=[0,tmax];
% Nplot = 500;  
% figure(1)
% for A = 1:0.025:2,  
%   sol = dde(gamma,delta,f0,n,A,theta,tspan);
%   t = linspace(9000,10000,Nplot);
%   y = deval(sol,t);
%   P = y(1,:);
%   R = y(2,:);
%   plot(A*ones(Nplot,1), P, 'r','MarkerSize', 5)
%   plot(A*ones(Nplot,1), R, 'b','MarkerSize', 5)
%   hold on; 
% end
% title('Bifurcation diagram'); 
% legend('P(t)','R(t)')
% set(gca, 'xlim', [1.0 2.0]); 
% hold off;
% 
% legend('P','R')

i=1;
for A=[0.01 Ac 1.79 Ac+0.5 Amax 2*Amax]
    N=length(0.5:0.5:5);
    sol=dde(gamma,delta,f0,n,A,theta,tspan);

    figure(2);
    subplot(2,3,i)
    t=linspace(floor(A)+1,tmax,1000);
    Y=deval(sol,t);
    plot(t,Y(1,:),t,Y(2,:));
    if A==Ac
        title(strcat('Ac=',num2str(A)),'Color','r');
    else
        if A==Amax
            title(strcat('Amax=',num2str(A)),'Color','b');
        else
            title(strcat('A=',num2str(A)));
        end
    end
    xlabel('time t');
    ylabel('solution y');
    legend('P(t)','R(t)');
    
    figure(3)
    subplot(2,3,i);
    plot3(t,Y(1,:),Y(2,:));
    if A==Ac
        title(strcat('Ac=',num2str(A)),'Color','r');
    else
        if A==Amax
            title(strcat('Amax=',num2str(A)),'Color','b');
        else
            title(strcat('A=',num2str(A)));
        end
    end
    xlabel('t');
    ylabel('P(t)');
    zlabel('R(t)');

    i=i+1;
end

