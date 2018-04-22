function [xDerivert] = F(x,A,b)
    xDerivert=zeros([8 1]);
    %nullfunk = @(f) G(x,f,EL);
    
    %options = optimoptions('fsolve','Display','off');'Display','iter'
    %options = optimoptions('fsolve','Algorithm','trust-region');
    %[xDerivert(5:8),fval,exitflag,output]=fsolve(nullfunk,F0(5:8),options);
    xDerivert(1:4)=x(5:8);
    
    xDerivert(5:8)=A(x)\b(x);
end

