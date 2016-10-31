%function stats = p01_image_statistics(img)
clc;
clear all;
close all;

function[med,anz,exp,va] = p01_image_statistics(img)

%Bildinformationen

disp('Grauwertmedian:');
med = (median(median(img)));

disp('Anzahl der Pixel mit Grauwert I,50<I<100:');
anz = ((size(img, 1)*size(img, 2))-sum(sum(img<=50))-sum(sum(img>=150)));

disp('Erwartungswert der Grauwertverteilung:');
exp = (sum(img(:))/(size(img, 1)*size(img, 2)));


disp('Varianz der Grauwertverteilung:');
va = (var(img(:)));

end