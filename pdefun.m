m = 0;
A = 1;
delta = 0.1;
gamma = 0.2;
f0 = 1;
a1 = linspace(0,1,0.001);
a2 = linspace(0,100,0.1);
sol1 = pdepe(m,pdefun1,icfun1,bcfun1,xmesh,tspan);
sol2 = pdepe(m,pdefun2,icfun2,bcfun2,xmesh,tspan);

function [c,f,s] = pdefun1(a1,t,p,dpda)
    c=1;
    f = p;
    s = -gamma*p;
end

function [c,f,s] = pdefun2(a2,t,r,drda)
    c=1;
    f = r;
    s = -(delta+0.5*f0)*r;
end

function p0 = icfun1(a1)
    p0 = a1;
end

function r0 = icfun2(a2)
    r0 = a1;
end

function [pl,pr,ql,qr] = bcfun1(0,ul,A,ur,t)
    pl = 1;
    pr = 0;
    ql = 0;
    qr = 0;
end

function [pl,pr,ql,qr] = bcfun2(0,ul,Inf,ur,t)
    pl = 2;
    pr = 0;
    ql = 0;
    qr = 0;
end

