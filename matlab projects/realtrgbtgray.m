vid=videoinput('winvideo',1);
vid.ReturnedColorSpace='rgb';
triggerconfig(vid,'manual');
vid.FramesPerTrigger=1;
vid.TriggerRepeat=inf;
start(vid);
for i=1:50;
    trigger(vid);
    im=getdata(vid);
    im_gray=rgb2gray(im);
    subplot(2,1,1);
    imshow(im);
    subplot(2,1,2);
    imshow(im_gray);
end
stop(vid);
delete(vid);
clear vid;