clc;
clear all;
close all;
%%
img = imread('D:\Study\Code\image\lena.bmp');figure;imshow(img);
img_n = double(img(:,:,1)) + 5*randn(256,256);figure;imshow(img_n,[]);
r = 2;
img_s = MeanFilter(img_n,r);figure;imshow(img_s,[]);
tic;
out = ERF(img_s,img_n,r);
toc;
figure;imshow(out,[]);