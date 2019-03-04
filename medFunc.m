function [ oimg ] = medFunc(image ,M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(image);
a=image;
if size(M)==3
for x=2:1:row-1;
    for y=2:1:col-1
        a1=[a(x-1,y-1)*M(1,1) a(x-1,y)*M(1,2) a(x-1,y+1)*M(1,3) a(x,y-1)*M(2,1) a(x,y)*M(2,2)....
            a(x,y+1)*M(2,3) a(x+1,y-1)*M(3,1) a(x+1,y)*M(3,2) a(x+1,y+1)*M(3,3)];
        
 a2=sort(a1);
 med=a2(5);
 oimg(x,y)=med;       

    end
end
else 
for x=3:1:row-2;
     for y=3:1:col-2
        a1=[a(x-2,y-2)*M(1,1) a(x-2,y-1)*M(1,2) a(x-2,y)*M(1,3) a(x-2,y+1)*M(1,4) a(x-2,y+2)*M(1,5).....
            a(x-1,y-2)*M(2,1) a(x-1,y-1)*M(2,2) a(x-1,y)*M(2,3) a(x-1,y+1)*M(2,4) a(x-1,y+2)*M(2,5).....
            a(x,y-2)*M(3,1) a(x,y-1)*M(3,2) a(x,y)*M(3,3) a(x,y+1)*M(3,4) a(x,y+2)*M(3,5).....
            a(x+1,y-2)*M(4,1) a(x+1,y-1)*M(4,2) a(x+1,y)*M(4,3) a(x+1,y+1)*M(4,4) a(x+1,y+2)*M(4,5).....
            a(x+2,y-2)*M(5,1) a(x+2,y-1)*M(5,2) a(x+2,y)*M(5,3) a(x+2,y+1)*M(5,4) a(x+2,y+2)*M(5,5)];
        
 a2=sort(a1);
 med=a2(13);
 oimg(x,y)=med;           
      end
end
end

