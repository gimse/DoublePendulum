function [A,b,r,l,m] = findEL()
    
    r = @(r,phi,theta) r*[sin(theta)*cos(phi);sin(theta)*sin(phi);cos(theta)];
    g=9.81;
    l=[1 1]';
    m=[1 1]';

    q = sym('q%d_d%d', [4 3]);

    r1 = r(l(1),q(1,1),q(2,1));
    r1d=jacobian(r1, q(:,1))*q(:,2);

    r2 = r1+r(l(2),q(3,1),q(4,1));
    r2d=jacobian(r2, q(:,1))*q(:,2);

    T= 0.5*m(1)*(r1d.'*r1d)+0.5*m(2)*(r2d.'*r2d);
    V=m(1)*g*r1(3)+m(2)*g*r2(3);
    L = T-V;

    LdqDot=jacobian(L,q(:,2))';
    
    A=jacobian(LdqDot,q(:,2));
    A=matlabFunction(A,'vars',{[q(:,1);q(:,2)]});
    b=jacobian(L,q(:,1))'-jacobian(LdqDot,q(:,1))*q(:,2);
    b=matlabFunction(b,'vars',{[q(:,1);q(:,2)]});
    %EL=jacobian(LdqDot,q(:,1))*q(:,2)+jacobian(LdqDot,q(:,2))*q(:,3)-jacobian(L,q(:,1))'

    %ELf =matlabFunction(EL,'Vars',{[q(:,1);q(:,2)],q(:,3)});
end

