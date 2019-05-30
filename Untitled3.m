clc,clear,close all
I=imread('2.bmp');
% imshow(I)
%%
[row,col]=size(I);
M=2*row-1;
N=2*col-1;
[U,V]=dftuv(M,N);
size=0.05;
D0=size*N;
p=-(U.^2+V.^2)./(2*(D0.^2));
H=exp(p);
% mesh(fftshift(H(1:10:M,1:10:N)))
%%
%%
I=double(I);
G=fft2(I,M,N);
% imshow(log(abs(fftshift(G))),[])
F=G./H;
I_out=ifft2(F);
I_out=abs(I_out);
I_out=(I_out-min(min(I_out)))*255/(max(max(I_out))-min(min(I_out)));
I_out=uint8(I_out);
imshow(I_out(1:row,1:col))