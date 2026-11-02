clear
im(:,:,1) = imread("Projection12.png");
IM = rgb2gray(im)
x=[-1 0 1;-2 0 2; -1 0 1];
y = transpose(x);
Gx = conv2(IM,x);
Gy = conv2(IM,y);
G = sqrt(Gx^2+Gy^2)
