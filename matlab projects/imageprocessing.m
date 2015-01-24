im=imread('foreman001.png');
s=size(im);
im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);

im_new=zeros(s(1),s(2));
opt=input('enter the object to be detected');
if(opt==1)   
r=0;
g=162;
b=232;
for i=1:s(1);
    for j=1:s(2);
        if(im_r(i,j)==r&&im_g(i,j)==g&&im_b(i,j)==b)
            im_new(i,j)=1;
        else
            im_new(i,j)=0;
        end
    end
end
subplot(2,1,1);
imshow(im);
title('original image');
subplot(2,1,2);
imshow(im_new);
title('processed image');


else if(opt==2)
r=237;
g=28;
b=36;
else if(opt==3)
fprintf('program exited');
    end
    end
end
for i=1:s(1);
    for j=1:s(2);
        if(im_r(i,j)==r&&im_g(i,j)==g&&im_b(i,j)==b)
            im_new(i,j)=1;
        else
            im_new(i,j)=0;
        end
    end
end
subplot(2,1,1);
imshow(im);
title('original image');
subplot(2,1,2);
imshow(im_new);
title('processed image');






