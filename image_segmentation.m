%image segmentation

%convert rgb to grayscale
rgb = imread('Foto.jpg');
I = rgb2gray(rgb);

%use gradient magnitude
gmag = imgradient(I);

%mark the foreground objects
se = strel('disk',20);
Io = imopen(I,se);

Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);

Ioc = imclose(Io,se);

Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);

fgm = imregionalmax(Iobrcbr);

I2 = labeloverlay(I,fgm);

se2 = strel(ones(5,5));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);

fgm4 = bwareaopen(fgm3,20);
I3 = labeloverlay(I,fgm4);

bw = imbinarize(Iobrcbr);

D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

gmag2 = imimposemin(gmag, bgm | fgm4);

L = watershed(gmag2);

figure
imshow(I)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
title('After')