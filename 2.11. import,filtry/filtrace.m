clear

im = imread("Projection4.png");
sum = imnoise(im,"salt & pepper");
%figure
%imshow(im)
%%imshow(sum)
n =5:5:50;

c =10;
for s = 1:c

filt(:,:,s) = medfilt2(sum,[n(s),n(s)]);
end


figure
subplot(1,1,1)
imshow(im)
subplot(1,2,2)