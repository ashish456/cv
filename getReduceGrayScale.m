function [ grayscaleImg ] = getReduceGrayScale( img )
disp('in function');
grayscaleImg = (rgb2gray(imread(img)))/4;
end

