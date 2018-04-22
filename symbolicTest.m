clear;
clc;

syms q1 q2 qd1 qd2 qdd1 qdd2;
syms l m1 m2 g;

L = 0.5*(m1+m2)*l^2*qd1^2 ...
    +0.5*m2*l^2*qd2^2 ...
    +m2*l^2*qd1*qd2*cos(q1-q2) ...
    +(m1+m2)*g*l*cos(q1) ...
    + m2*g*l*cos(q2)

L2 = symfun(0.5*l^2*qd1^2*(m1+m2)...
    +0.5*l^2*qd2^2*m2...
    +m2*qd1*qd2*cos(q1-q2)...
    +(m1+m2)*l*cos(q1)...
    +m2*l*g*cos(q2)...
    , [q1 q2 qd1 qd2]);


Ldqd1=diff(L,qd1);
EL1=(diff(Ldqd1,q1)*qd1+diff(Ldqd1,q2)*qd2+diff(Ldqd1,qd1)*qdd1+diff(Ldqd1,qd2)*qdd2)-diff(L,q1);
EL1


fasitEl1=symfun(G2(l,l,[q1 q2 qd1 qd2]',[qd1 qd2 qdd1 qdd2]',m1,m2,g),[q1 q2 qd1 qd2 qdd1 qdd2 l m1 m2 g]);
fasitEl1

EL1=subs(EL1,[q1 q2 qd1 qd2 qdd1 qdd2 l m1 m2 g],[1 2 3 4 5 6 7 8 9 10])
fasitEl1=subs(fasitEl1,[q1 q2 qd1 qd2 qdd1 qdd2 l m1 m2 g],[1 2 3 4 5 6 7 8 9 10])