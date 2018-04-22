function [x] = ettStegMinMetode(x,h,A,b)
    x
    x(1:4)=x(1:4)+0.5*h*x(5:8);
    x(5:8)=x(5:8)+h*A(x)\b(x);
    x(1:4)=x(1:4)+0.5*h*x(5:8);
end

