vid=videoinput('winvideo',1,'YUY2_320x240');
vid.ReturnedColorSpace='rgb';
triggerconfig(vid,'manual');
vid.FramesPerTrigger=1;
vid.TriggerRepeat=inf;
start(vid);
for qq=1:300000;
       for qqq=1:5000;
           ;
       end
   end
   trigger(vid);
   im=getdata(vid);
   [x,y,k]=impixel(im);
th=0.30;
r_min=k(1)-th*k(1);
g_min=k(2)-th*k(2);
b_min=k(3)-th*k(3);
r_max=k(1)+th*k(1);
g_max=k(2)+th*k(2);
b_max=k(3)+th*k(3);
s=size(im);
im_new=zeros(s(1),s(2));
for kk=1:500;
    trigger(vid);
    im=getdata(vid);
    im_r=im(:,:,1);
    im_g=im(:,:,2);
    im_b=im(:,:,3);
    count=0;
for i=1:s(1);
    for j=1:s(2);
        if(im_r(i,j)>=r_min&&im_r(i,j)<=r_max&&im_g(i,j)>=g_min&&im_g(i,j)<=g_max&&im_b(i,j)>=b_min&&im_b(i,j)<=b_max)
            im_new(i,j)=1;
            %im_new1=bwareaopen(im_new,50);
            %str=bwconncomp(im_new1,8);
            %im_new1(i,j)=im_new(i,j);
            count=count+1;
        else
            im_new(i,j)=0;
        end
    end
end
imshow(im);
if(count>10)
    st=regionprops(im_new,'ALL');
    x1=st.Centroid(1);
y1=st.Centroid(2);
th=0:0.01:1;
r=st.EquivDiameter/2;
hold on
X1=x1+r*(cos(2*pi*th));
Y1=y1+r*(sin(2*pi*th));
plot(X1,Y1,'k*');
end
end
hold off;
stop(vid);
delete(vid);
clear vid;
close all;