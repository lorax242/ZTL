

im = imread("Projection0.png");
red(:,:,1) = im(:,:,1);
red(:,:,2) = zeros(400,400);
red(:,:,3) = zeros(400,400);
imshow(red)