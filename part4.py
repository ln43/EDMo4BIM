import numpy as np
import matplotlib.pyplot as plt 

def hill(r):
    return f0*(theta**n/(theta**n+r**n))
    
def int_hill(tinf,tsup,r):
    I=0
    t=tinf
    while t<=tsup:
        ind=int((t+amax)/h)
        I+=hill(r[ind])*h
        t+=h
    return I
    
def int_r(amax,r,ra,t):
    I=0
    a=0
    while a<amax:
        I+=h*2*(delta**2*a**2-hill(r[int((t+amax)/h)]))*hill(ra[int((t-a+amax)/h)])*ra[int((t-a+amax)/h)]*np.exp((-gamma*A**2-delta*a**2)/2-int_hill(t-a,t,r))
        a+=h
    return I



global A,f0,gamma,delta,theta,n,h;
A=1.5
f0=1.77;
gamma=0.2;
delta=0.05;
theta=10**11;
n=5;
amax=50
h=0.05
r=[10**11]*int(1+amax/h)
len(r)
ra=list(np.ones(A/h))+r
tmax=25

t=0
while t<tmax:
    R=r[int((t+amax)/h)]+h*2*hill(ra[int((t+amax)/h)])*ra[int((t+amax)/h)]*np.exp(-gamma*A**2/2)-h*int_r(amax,r,ra,t)
    if R>0:
        r.append(R)
    else :
        r.append(0)
    ra.append(r[len(r)-1])
    t+=h
    print r[len(r)-1]


x=np.arange(0,tmax+h,h)
print len(r[int(1+amax/h)-1:]),len(x)

plt.plot(x,r[int(1+amax/h)-1:])
plt.axis([0,tmax,min(r)-1,max(r)+1])
plt.xlabel("t")
plt.ylabel("R(t)")
plt.show()