clear

addpath(fullfile('..','Data/CT'))
im = imread("Projection4.png");

% kdyz by byl obraz barevny, nejdrive prevest na gray

x=[-1 0 1;-2 0 2; -1 0 1];              % zadana matice
y = transpose(x);                       % transponovani 
Gx = conv2(im,x);                       % konvoluce s x
Gy = conv2(im,y);                       % konvoluce s y
G = sqrt((Gx.^2)+(Gy.^2));              % absolutni hodnota G
velikost = size(G,1);                   % zjisteni velikosti pro cyklus for
det_hran = zeros(size(G),"like",G);     % vytv stejne mat jako G

% trashhold, bo jinak neni videt, filtrace pouze uzitecnych
for i = 1:velikost
    for j = 1:velikost
        if G(i,j) >= 10500 
            if G(i,j) <= 14000
                det_hran(i,j) = G(i,j);
            end
        else
            det_hran(i,j) = 0;
        end
    end
end

figure
imshow(det_hran)
