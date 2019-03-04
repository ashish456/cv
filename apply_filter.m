function img= apply_filter(I,filter)
N=length(filter);
I=double(I);
[m,n]=size(I);
iRow=floor(N/2)+1;  iCol=floor(N/2)+1;
% apply the filter to image
for iRow=floor(N/2)+1:m-(floor(N/2)+1)
    for iCol=floor(N/2)+1:n-(floor(N/2)+1)
        img(iRow,iCol)=sum(sum(filter.*I(iRow-floor(N/2):iRow+floor(N/2),iCol-floor(N/2):iCol+floor(N/2))));
    end
end
img=uint8(img);
end