



clc;
clear all;
close all;
% Read in the image 
rgbimg = imread('C:\Users\Prash\Desktop\imge4.png');




figure;imshow(rgbimg,[]);
r=size(rgbimg,1);
c=size(rgbimg,2);
x=zeros(r,c);

for i=1:r
    for j=1:c
       if rgbimg(i,j,1)>=0 && rgbimg(i,j,1)<=30
           if rgbimg(i,j,2)>20 && rgbimg(i,j,2)<=60
               if rgbimg(i,j,3)>=30 && rgbimg(i,j,3)<=80
                   x(i,j)=1;
               end
           end
       end
       
       
       
       
    end
end
e=edge(rgb2gray(rgbimg),'canny');
figure;imshow(e,[]);title('Edge');
figure;imshow(x,[]);title('level-1');
% se = strel('disk', 25);
 

x1=bwareaopen(x, 3650);
figure;imshow(x1,[]);title('level-2');
SE = strel('square',9);
F = imclose(x1,SE);
figure;imshow(F,[]);title('level-3');
se = strel('disk', 7);
 tophatimg = imtophat(F, se);
bothatimg=imbothat(F, se);

%figure, imshow(tophatimg);
resultimg=[];
for i=1:size(F,1)
    for j=1:size(F,2)
        resultimg(i,j)=bothatimg(i,j)+tophatimg(i,j);
    end 
end
imshow(resultimg);title('leve-4');
SE = strel('square',5);
M = imdilate(resultimg,SE);
figure;imshow(M,[]);title('level-5');
% x5=bwareaopen(J, 3650);
% figure;imshow(x5,[]);title('level-4');
% Convert to grayscale and display 
% grayimg = rgb2gray(rgbimg1);

% Create a structuring element of appropriate shape/size 
% se = strel('disk', 9);
%  
% % Apply top-hat and display 
%  tophatimg = imtophat(J, se);
% bothatimg=imbothat(J, se);
% 
% %figure, imshow(tophatimg);
% resultimg=[];
% for i=1:size(J,1)
%     for j=1:size(J,2)
%         resultimg(i,j)=bothatimg(i,j)+tophatimg(i,j);
%     end 
% end
% imshow(resultimg);title('result');
