clc,clear,close all
I=imread('lena.jpg');

% imshow(I);
I_gray=rgb2gray(I);
% imshow(I_gray)
%%
[row,col]=size(I_gray);
M=2*row-1;
N=2*col-1;
%%
I_gray=double(I_gray);
%%
F=fft2(I_gray,M,N);
% imshow(log(abs(fftshift(F))),[])
% title('in-zs')
%%
[U,V]=dftuv(M,N);
size=0.05;
D0=size*N;
p=-(U.^2+V.^2)./(2*(D0.^2));
H=exp(p);
% mesh(fftshift(H(1:10:M,1:10:N)))
% colormap([1,1,1])
% imshow(fftshift(H))
%%
F_out=H.*F;
% imshow(log(fftshift(abs(F_out))),[])
% title('in-zs-1')
%%
G=ifft2(F_out);
G=abs(G);
G=G(1:row,1:col);
imshow(uint8(G))
title('ifft2')
%%
% F_out=fft2(G,M,N);
% % imshow(log(abs(fftshift(F_out))),[])
% % title('in-zs-2')
% %%
% F=F_out./H;
% % imshow(fftshift(log(abs(F))),[])
% %%
% I_gray=ifft(F);
% imshow(abs(I_gray),[])


