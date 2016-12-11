clear; 
clc; 
close all;

img = imread('p04_Bild1.png');
figure('name','Original','numbertitle','off'), imshow(img);

%Testen der Funktionen 
%p04_compress, block_size=8 und block_size=16
img_compressed8 = p04_compress(img, 8);
figure('name','Compressed8','numbertitle','off'), imshow(img_compressed8);

img_compressed16 = p04_compress(img, 16);
figure('name','Compressed16','numbertitle','off'), imshow(img_compressed16);

%p04_decompress

img_decompressed_8 = p04_decompress(img_compressed8, 8);
img_decompressed_16 = p04_decompress(img_compressed16,16);


%Vergleich Qualität der Komprimierten Bilder 