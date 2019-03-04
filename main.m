%Assignment N0.3
%Ashish Kumar
%u01457477
disp('--Finish Solving Problem 1(A)--')
% Function for mean filter :
% function img= apply_filter(I,filter) N=length(filter); I=double(I);
% [m,n]=size(I); iRow=floor(N/2)+1;  iCol=floor(N/2)+1; %apply the filter to image 
% for iRow=floor(N/2)+1:m-(floor(N/2)+1)
%    for iCol=floor(N/2)+1:n-(floor(N/2)+1)
%        img(iRow,iCol)=sum(sum(filter.*I(iRow-floor(N/2):iRow+floor(N/2),iCol-floor(N/2):iCol+floor(N/2))));
%    end
% end img=uint8(img); end
A = imread('Circuit.jpg');
img=A;
N=3;
n=N*N;
% Generate a random filter whose samples sums up to 01
filter_val= (diff([0,sort(randi([0,100-n],1,n-1)),100-n])+ones(1,n))/100;
filter=reshape(filter_val,[N N]);
% Apply the filter
R3img= apply_filter(img,filter);

N=5;
n=N*N;
% Generate a random filter whose samples sums up to 01
filter_val= (diff([0,sort(randi([0,100-n],1,n-1)),100-n])+ones(1,n))/100;
filter=reshape(filter_val,[N N]);
% Apply the filter
R5img= apply_filter(img,filter);

figure;
subplot(1,3,1);
imshow(img);     % display the original Image
title('Original Image');
subplot(1,3,2)
imshow(R3img);    % Plot the filtered image
title('3*3 Averaging Filter');
subplot(1,3,3)
imshow(R5img);    % Plot the filtered image
title('5*5 Averaging Filter');
pause;

disp('--Finish Solving Problem 1(B)--')

b = fspecial('average', [3 3]);
B = filter2(b,A);
b1 = fspecial('average', [5 5]);
B2 = filter2(b1,A);
figure;
subplot(1,3,1);
imshow(A)
title('Original Image')
subplot(1,3,2);
imshow(B,[])
title('3 x 3 Filtered Image')
subplot(1,3,3)
imshow(B2,[])
title('5 x 5 Filtered Image')
pause;

disp('--Finish Solving Problem 1(C)--')
% Function for median filter :
% function [ oimg ] = medFunc(image ,M)
% %UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% [row,col]=size(image);
% a=image;
% if size(M)==3
% for x=2:1:row-1;
%     for y=2:1:col-1
%         a1=[a(x-1,y-1)*M(1,1) a(x-1,y)*M(1,2) a(x-1,y+1)*M(1,3) a(x,y-1)*M(2,1) a(x,y)*M(2,2)....
%             a(x,y+1)*M(2,3) a(x+1,y-1)*M(3,1) a(x+1,y)*M(3,2) a(x+1,y+1)*M(3,3)];
%         
%  a2=sort(a1);
%  med=a2(5);
%  oimg(x,y)=med;       
% 
%     end
% end
% else 
% for x=3:1:row-2;
%      for y=3:1:col-2
%         a1=[a(x-2,y-2)*M(1,1) a(x-2,y-1)*M(1,2) a(x-2,y)*M(1,3) a(x-2,y+1)*M(1,4) a(x-2,y+2)*M(1,5).....
%             a(x-1,y-2)*M(2,1) a(x-1,y-1)*M(2,2) a(x-1,y)*M(2,3) a(x-1,y+1)*M(2,4) a(x-1,y+2)*M(2,5).....
%             a(x,y-2)*M(3,1) a(x,y-1)*M(3,2) a(x,y)*M(3,3) a(x,y+1)*M(3,4) a(x,y+2)*M(3,5).....
%             a(x+1,y-2)*M(4,1) a(x+1,y-1)*M(4,2) a(x+1,y)*M(4,3) a(x+1,y+1)*M(4,4) a(x+1,y+2)*M(4,5).....
%             a(x+2,y-2)*M(5,1) a(x+2,y-1)*M(5,2) a(x+2,y)*M(5,3) a(x+2,y+1)*M(5,4) a(x+2,y+2)*M(5,5)];
%         
%  a2=sort(a1);
%  disp(a2);
%  med=a2(13);
%  oimg(x,y)=med;           
%       end
% end
% end
% 

%when Mask is of size 3*3 matrix:
M3=[1 2 2; 1 1 1; 2 1 1];
result1=medFunc(A,M3);    % result for 3x3 mask

%when Mask is of size 5*5 matrix:
M5= [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1;1 1 1 1 1;1 1 1 1 1] ; 
result2=medFunc(A,M5);% result for 5x5 mask
figure;
subplot(1,3,1);
imshow(A);
title('Original Image');
subplot(1,3,2);
imshow(result1);
title('3x3 Image');
subplot(1,3,3);
imshow(result2);
title('5x5 Image');
pause;
disp('--Finish Solving Problem 1(D)--')

D = medfilt2(A);
[r,c]=size(result1);
%compare both image for 3 by 3 mask:
for a=1:r
      for b=1:c
          if D(a,b)==result1(a,b)
              val=1;
          else
             val=0;
          end
      end
end
if(val==1)
    figure;
    imshow(result1);
    title('3x3 Comparesion Image');
else
    disp('My method for 3x3 not working');
end
D1 = medfilt2(A, [5 5]);
[r,c]=size(result2);
%compare both image for 5 by 5 mask:
for a=1:r
      for b=1:c
          if D1(a,b)==result2(a,b)
              val=1;
          else
             val=0;
          end
      end
end

if(val==1)
    figure;
    imshow(result2);
    title('5x5 Comparesion Image');
else
    disp('My method 5x5 not working');
end
pause;

disp('--Finish Solving Problem 1(E)--')

E = imread('Moon.jpg');
f = fspecial('laplacian');
E2 = filter2(f,E);
E3  = (E2 - min(min(E2)))/(max(max(E2)) - min(min(E2)));
E4 = imsubtract(E,uint8(E2));
figure;
subplot(2,2,1)
imshow(E)
title('Original Image')
subplot(2,2,2)
imshow(uint8(E2),[])
title('Filtered Image')
subplot(2,2,3)
imshow(E3)
title('Scaled Image')
subplot(2,2,4)
imshow(E4)
title('Enhanced Image')
pause;

close all;
clear;