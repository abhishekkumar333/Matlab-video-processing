im=imread('ab.jpg');
s=size(im);
im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);

im_new=zeros(s(1),s(2));  
[x,y,k]=impixel(im);
th=0.30;
r_min=k(1)-th*k(1);
g_min=k(2)-th*k(2);
b_min=k(3)-th*k(3);
r_max=k(1)+th*k(1);
g_max=k(2)+th*k(2);
b_max=k(3)+th*k(3);
for i=1:s(1);
    for j=1:s(2);
        if(im_r(i,j)>=r_min&&im_r(i,j)<=r_max&&im_g(i,j)>=g_min&&im_g(i,j)<=g_max&&im_b(i,j)>=b_min&&im_b(i,j)<=b_max)
            im_new(i,j)=1;
            im_new1=bwareaopen(im_new,50);
            
        else
            im_new(i,j)=0;
        end
    end
end
subplot(2,2,1);
imshow(im);
title('original image');
subplot(2,2,2);
imshow(im_new);
title('preprocessed image');
subplot(2,2,3);
imshow(im_new1);
title('processed image by bwareaopen');