
addpath(fullfile('..','Data/CT'))
im = imread("Projection4.png");     % nacte obrazek do trojrozmerne matice RGB
figure 
imshow(im)

%% Vytvoreni R kanalu
red(:,:,1) = im(:,:,1);             % do red zkopiruje cely R kanal z im
red(:,:,2) = zeros(400,400);        % do G kanalu da same nuly
red(:,:,3) = zeros(400,400);        % do B kanalu da same nuly
figure
imshow(red)                         % zobrazi obrazek pouze s R kanalem

%% Zeleny kanal - histogram a imhist   

% nejdrive si vytvorim green matici vilikosti im a vyplnim ji 0
green = zeros(size(im),'like',im);
green(:,:,2) = im(:,:,1);
figure
imhist(green)

% Vykresleni imhist a histogram vedle sebe, lepsi nez subpplot
figure;
t = tiledlayout(1, 2, 'Padding', 'compact', 'TileSpacing', 'compact');

% 1. Vykreslení pomocí imhist (typické pro obrazová data)
nexttile;
imhist(green);
title('imhist');

% 2. Vykreslení obecného histogramu
nexttile;
histogram(green(:,:,2));
title('histogram');

%% Modry kanal a statisticke charakteristiky

blue = zeros(size(im),'like',im);
blue(:,:,3) = im(:,:,1);

% prevedeni na double kvuli zpresneni
blue_d = double(blue);

% zapsano moderneji-lepsi
prumer_B = mean(blue_d,'all');
med_B = median(blue_d,'all');
rozptyl_B = var(blue_d,0,'all');
smer_odchylka_B = std(blue_d,0,'all');


%% vytvoreni gray obrazku z vahovanych R, G a B kanalu

gray = imlincomb(0.299,red(:,:,1),0.587,green(:,:,2),0.114,blue(:,:,3));
figure 
imshow(gray)