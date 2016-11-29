clear;
close all;
clc;

%Einlesen des Bildes und anschließende Konvertierung in den Typ double
img_blur = double(imread('p03_Bild1.png'));
figure('name','Original','numbertitle','off'), imshow(img_blur);

%Punktantwort:
%Bewegum um 135 Grad gegen den Uhrzeigersinn
%Ausbreitung von 17 Pixel: 1px im Ursprung, 8px im 2. und 4. Quadranten
m = size(img_blur,1);
n = size(img_blur,2);
psf = zeros(m,n);
psf(floor(m/2), floor(n/2)) = 1/17;

for t = 1:1:8
    psf(floor(m/2)+t, floor(n/2)+t) = 1/17; %2.Quadrant
    psf(floor(m/2)-t, floor(n/2)-t) = 1/17; %4.Quadrant
end

%Transformieren von img_blur und psf in Frequenzraum
fftblur = fft2(img_blur);
fftpsf = fftshift(fft2(psf));

%Entfernen der Störung durch inverse Filterung 
image_new = fftblur./fftpsf;
image_new = ifftshift(ifft2(image_new));
figure('name','Inverse Filter','numbertitle','off'), imshow(image_new,[]);

%Wiener Filterung
img_wien = ifftshift(ifft2(p03_wien_filt(img_blur, psf, 0.001)));
figure('name','Wiener Filter','numbertitle','off'), imshow(img_wien,[]);

%Interpretation durch Ueberlegungen, jedoch gab es Probleme bei der Umsezuung (Division durch 0)
%K kann beliebig gewaehlt werden:
%grosses K  => sieht aus wie das Originalbild
%kleines K => sieht aus wie das invers gefilterte Bild