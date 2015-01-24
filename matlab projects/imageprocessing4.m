im=imread('foreman001.png');
s=size(im);
im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);

im_new=zeros(s(1),s(2));  
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
st=regionprops(im_new,'ALL');
x1=st.Centroid(1);
y1=st.Centroid(2);
l1=st.MajorAxisLength(1);
l2=st.MinorAxisLength(1);
th=0:0.01:1;
X1=x1+l1*(sin(2*pi*th));
Y1=y1+l2*(cos(2*pi*th));
subplot(2,1,1);
imshow(im);
title('original image');
subplot(2,1,2);
imshow(im_new);
title('processed image');
hold on
plot(x1,y1,'r*');
plot(X1,Y1,'c','linewidth',4);
hold off;


