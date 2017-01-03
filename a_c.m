%Fonction permettant de calculer la valeur du A critique pour l'apparition
%des oscillations en fonction des differents parametres du systeme

% alpha et beta sont les coefficients de l'equation caracteristique :
% lambda+alpha+beta*exp(-lambda A)

% B est defini comme f'(R*)R*+f(R*) ou R* est l'equilibre

% Les oscillations non amorties sont observees pour A=A*
% A^*=arccos(-alpha+beta)/sqrt(beta^2-alpha^2)

function ac=a_c(f0,gamma,delta,theta,n)
    function A_e=a_et(A)
        r_e=theta*(f0*(2*exp(-gamma*A)-1)/delta-1)^(1/n); % Equilibre R
        B=f0*theta^n*(1-n*r_e^(n)/(r_e^n+theta^n))/(r_e^n+theta^n);
        alpha=delta+B;
        beta=-2*B*exp(-gamma*A);
        A_e=acos(-alpha/beta)/sqrt(beta^2-alpha^2)-A;
    end
ac=fzero(@a_et,1);%On veut obtenir A*-A=0
end


