function [sum ] = G(x,f,EL)
    sum=zeros(4,1);
    
    sum(1:4)=EL(x,f);
    
end

