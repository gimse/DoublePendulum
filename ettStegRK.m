function [nyY] = ettStegRK(y,h,fFunk)
    %RK varibler
    c=[0 1/3 2/3 1];
    A=[ 0  0 0 0 ;
       1/3 0 0 0 ;
      -1/3 1 0 0
        1 -1 1 0];
    b=[1/8 3/8 3/8 1/8];
    
    
    antallElementer = length(y);
    %Finner ksi
    antallKsi=length(c);
    ksi = zeros(antallElementer,antallKsi);
    for v=1:antallKsi
        sum=zeros(antallElementer,1);
        for i=1:v-1
            sum=sum+(A(v,i).*fFunk(ksi(:,1)));
        end
        ksi(:,v) = y + sum*h;
    end
    
    %Finner ny y
    sum=zeros(antallElementer,1);
    for i=1:antallKsi
        sum=sum + (b(i).*fFunk(ksi(:,i)));
    end
    nyY= y + sum*h;
end

