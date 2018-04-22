clear;
clc;

x0=[ -pi*3/4 pi*1/4 pi*1 pi*3/4 0 0 0 0 ]';
x=x0;

[elA,elB,r,l,m]=findEL();
fFunk = @(x) F(x,elA,elB);

framerate=120;
h=1/framerate;
playTime=60;
loops=playTime*framerate;
v = VideoWriter('produsertFilm.avi'); 
v.FrameRate=framerate;
open(v);
FigHandle = figure('Position', [100, 100, 1049, 895]);
for i=1:loops
    if mod(i,framerate)==0
        disp(['sek: ' num2str(i/framerate)]); 
    end
    
    x=ettStegRK(x,h,fFunk);
    %x=ettStegMinMetode(x,h,elA,elB);
   
    for j=1:4
        x(j)=mod(x(j),pi*2);
    end
    clf;
    plotX(x,r,l,m);
    writeVideo(v,getframe);
end
close(v);