clear;
clc;

syms m l g q qd qdd;

L = 0.5*m*l^2*qd^2-m*g*l*sin(q);


%Ldqd=diff(L,qd);
%EL = (diff(Ldqd,q)*qd+diff(Ldqd,qd)*qdd)-diff(L,q);
%EL
l=[1 2]';
m=[2 3]';
g=9.81;
r = @(r,phi,theta) r*[sin(theta)*cos(phi);sin(theta)*sin(phi);cos(theta)];

q = sym('q%d_d%d', [4 3])

r1 = r(l(1),q(1,1),q(2,1));
r1d=jacobian(r1, q(:,1))*q(:,2);

r2 = r(l(1),q(1,1),q(2,1))+r(l(2),q(3,1),q(4,1));
r2d=jacobian(r2, q(:,1))*q(:,2);

T= 0.5*m(1)*r1d.'*r1d+0.5*m(2)*r2d.'*r2d;
V=m(1)*g*r1(3)+m(2)*g*r2(3);
L = T-V;

LdqDot=jacobian(L,q(:,2))';
EL=jacobian(LdqDot,q(:,1))*q(:,2)+jacobian(LdqDot,q(:,2))*q(:,3)-jacobian(L,q(:,1))';

q0=rand([4 3]);

EL = @(q0) subs(EL,q,q0);





