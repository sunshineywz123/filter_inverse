clc,clear,close all
I=imread('01.jpg');

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
%k越大半径越小
[U,V]=dftuv(M,N);
k=0.001;
p=-k*(U.^2+V.^2).^(5/6);
H=exp(p);
% mesh(fftshift(H(1:10:M,1:10:N)))
% colormap([1,1,1])
% imshow(fftshift(log(H)),[])
%%
F_out=H.*F;
% imshow(log(abs(F)),[])
% title('in-zs')
%%
G=ifft2(F_out);
G=abs(G);
G=G(1:row,1:col);
% imshow(uint8(G))
% title('ifft2')
%%   
% WEIGHT = edge(G,'sobel',0.3);  
% % imshow(WEIGHT)
% %%  
% se = strel('disk',0);  
% WEIGHT = 1-double(imdilate(WEIGHT,se));  
% % imshow(WEIGHT)
%%  
% LIM=4;
% WEIGHT([1:LIM end-[0:LIM-1]],:) = 0;  
% WEIGHT(:,[1:LIM end-[0:LIM-1]]) = 0;  
% % imshow(WEIGHT);title('Weight array');   
% G=G.*WEIGHT/255;
% % imshow(G)
%%
F_out=fft2(G,M,N);
% imshow(fftshift(log(abs(F_out))),[])
%%
F=zeros(M,N);
r=100;
for i=1:M
    for j=1:N
        if U(i,j).^2+V(i,j).^2<r.^2
            F(i,j)=F_out(i,j)./H(i,j);
        else
            F(i,j)=F_out(i,j);
        end
    end
end
% imshow(log(fftshift(abs(F))),[])
%%
im=ifft2(F);
im=abs(im(1:row,1:col));
imshow(im,[])
s=['r=',num2str(r)];
title(s)


