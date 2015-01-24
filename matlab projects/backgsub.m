vid=videoinput('winvideo',1);
vid.ReturnedColorSpace='rgb';
triggerconfig(vid,'manual');
vid.FramesPerTrigger=1;
vid.TriggerRepeat=inf;
start(vid);
for qq=1:300000;
       for qqq=1:500;
          ;
       end
end   
trigger(vid);
im1=getdata(vid);
stop(vid);

start(vid);
for qq=1:300000;
       for qqq=1:500;
          ;
       end
end   
for aa=1:500;
    trigger(vid);
    im=getdata(vid);
    %im1=getdata(vid);  
   s=size(im);
   %count=0;
   a1=zeros(s(1),s(2));
   a2=zeros(s(1),s(2));
   for i=1:s(1);
       for j=1:s(2);
   a1(i,j)=abs(im(i,j)-im1(i,j));
   a2(i,j)=abs(im1(i,j)-im(i,j));
   %count=count+1;
       end
   end
   %if(count>10)
   subplot(2,2,1);
   imshow(im);
   subplot(2,2,2);
   imshow(a1);
   subplot(2,2,3);
   imshow(a2);
   %end
end
stop(vid);
delete(vid);
clear vid;