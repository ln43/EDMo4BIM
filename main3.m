f0=1.77;
gamma=0.2;
delta=0.05;
theta=10^11;
n=5;
tmax=2000;

%Recherche du A critique
Ac=a_c(f0,gamma,delta,theta,n)

tspan=[0,tmax];
i=1;
for A=linspace(Ac-1,Ac+1,9)
    N=length(0.5:0.5:5);
    sol=dde(gamma,delta,f0,n,A,theta,tspan);
    r_e=theta*(f0*(2*exp(-gamma*A)-1)/delta-1)^(1/n);
    
    figure(1);
    subplot(3,3,i)
    t=linspace(floor(A)+1,tmax,10000);
    Y=deval(sol,t);
    plot(t,Y(1,:),t,Y(2,:));
    title(strcat('A=',num2str(A)));
    xlabel('time t');
    ylabel('solution y');
    legend('P(t)','R(t)');
    
%     figure(2)
%     subplot(3,3,i);
%     plot(Y(1,:),Y(2,:));
%     title(strcat('A=',num2str(A)));
%     xlabel('P(t)');
%     ylabel('R(t)');
%     
%     figure(3)
%     subplot(3,3,i);
%     plot3(t,Y(1,:),Y(2,:));
%     title(strcat('A=',num2str(A)));
%     xlabel('t');
%     ylabel('P(t)');
%     zlabel('R(t)');
%     
%     figure(4)
%     subplot(3,3,i);
%     Ylag=deval(sol,t-A);
%     plot3(t,Y(1,:),Ylag(1,:));
%     title(strcat('A=',num2str(A)));
%     xlabel('t');
%     ylabel('P(t)');
%     zlabel('P(t-A)');
%     
%     figure(5)
%     subplot(3,3,i);
%     plot3(t,Y(2,:),Ylag(2,:));
%     title(strcat('A=',num2str(A)));
%     xlabel('t');
%     ylabel('R(t)');
%     zlabel('R(t-A)');
    i=i+1;
end

% Graphiquement on trouve Ac autour de 1.84



