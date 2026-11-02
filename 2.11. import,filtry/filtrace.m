clear

%% nacteni a pridani sumu
im = imread("Projection4.png");
hodnota_sum = 0.02;
sum = imnoise(im,"salt & pepper",hodnota_sum);

%% 10 filtru s ruznymi okny
krok = 5;
n = 5:krok:50;

for s = 1:size(n,2)
filt(:,:,s) = medfilt2(sum,[n(s),n(s)]);
end

%% 10 filtru s ruznymi okny
krok = 5;
n = 5:krok:50;

for s = 1:size(n,2)
filt(:,:,s) = medfilt2(sum,[n(s),n(s)]);
end

%% Vyber nejlepsiho filtru pomoci 'mse'
err = zeros(1,size(n,2));
for j = 1:size(filt,3)
err(1,j) = mse(filt(:,:,j),im);
end

min_err = min(err);
nej_okno = n(1,err == min_err);

%% Zobrazeni vsech obrazku spolu
% Parametr 'flow' automaticky uspořádá dlaždice do mřížky podle velikosti okna.
% Pokud chceš pevnou mřížku 2x5, použij: tiledlayout(2, 5);
figure
tiledlayout('flow'); 

nexttile;
imshow(im)
title('Originalni')

nexttile;
imshow(sum)
title(sprintf('Se sumem S&P: %0.2f ', hodnota_sum))


for i = 1:size(n,2)
    nexttile;                                                       % Přechod na další volnou pozici                                                                                
    imshow(filt(:,:,i));                                            % Nebo imshow(), případně plot()
    title(sprintf('Okno filtru %d \\times %d', krok*i, krok*i));    % Dosadí aktuální výsledek 5*i za první i za druhé %d 
end

muj_text = sprintf('Nejlepší filtr: okno %d \\times %d\nMSE: %.4f', nej_okno, nej_okno, min_err);

% Vykreslení textboxu s plným bílým pozadím v pravém dolním rohu
box = annotation('textbox', [0.4, 0.05, 0.2, 0.1], 'String', muj_text);
box.HorizontalAlignment = 'center';
box.FitBoxToText = 'on';
box.BackgroundColor = 'white';


