function [] = plotX(x,r,l,m)
    cord=zeros([3,3]);
    cord(:,2)=r(l(1),x(1),x(2));
    cord(:,3)=cord(:,2)+r(l(2),x(3),x(4));
    
    plot3(cord(1,:),cord(2,:),cord(3,:));
    hold on;
    scatter3(cord(1,:),cord(2,:),cord(3,:),'*');
    
    Rx = @(ang) [1 0 0; 0 cos(ang) -sin(ang); 0 sin(ang) cos(ang)];
    Rz= @(ang) [cos(ang) -sin(ang) 0;sin(ang) cos(ang) 0;0 0 1];
    
    color=[1 0 0;0 1 0];
    
    for j=1:2
        radius=0.03;
        [X,Y,Z] = cylinder(radius);
        Z(1,:)=Z(1,:)*l(j);
        rotX=x((j-1)*2+2);
        rotZ=x((j-1)*2+1);
        
        R=Rx(rotX)*Rz(-rotZ+pi/2);
        positionOld1 = [X(1,:)',Y(1,:)',Z(1,:)'];
        positionOld2 = [X(2,:)',Y(2,:)',Z(2,:)'];
        positionNew1 = positionOld1*R+ones(size(positionOld1,1),1)*cord(:,j)';
        positionNew2 = positionOld2*R+ones(size(positionOld2,1),1)*cord(:,j)';
        % reassemble the two sets of points into X Y Z format:
        X = [positionNew1(:,1),positionNew2(:,1)];
        Y = [positionNew1(:,2),positionNew2(:,2)];
        Z = [positionNew1(:,3),positionNew2(:,3)];
        h=mesh(X,Y,Z,'facecolor',color(j,:));
        set(h, 'edgecolor','none');
        hold on;
        
        radius=0.1*nthroot(4*m(j)/(4*pi),3);
        [X,Y,Z] = sphere();
        siz=ones(size(X));
        X=X*radius+siz*cord(1,j+1);
        Y=Y*radius+siz*cord(2,j+1);
        Z=Z*radius+siz*cord(3,j+1);
        
        surf(X,Y,Z);
        hold on;
        
    end
    
    axis([-1 1 -1 1 -1 1]*2);
    xlabel('x')
    ylabel('y')
    zlabel('z')
end

