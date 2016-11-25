clear;
close all;
clc;


%Einlesen des Bildes und anschließende Konvertierung in den Typ double
img_blur = imread('p03_Bild1.png');
img_blur = img_blur(double(img_blur));
figure, imshow(img_blur);

%Punktantwort

psf = zeros(size(img_blur));
y = size(img_blur,1)/2;
x = size(img_blur,2)/2;

for z = x-17: x+17
  psf(y,z) = 1;
 end
psf = imrotate(psf, -135, 'bilinear', 'crop');
figure, imshow(psf);

%Transformieren von img_blur und psf in Frequenzraum
fftblur = fft2(img_blur);
fftblur = fftshift(fftblur); %Shiften, um das geiche Koordinatensystem zu erhalten
fftpsf = fft2(psf);

%Entfernen der Störung durch inverse Filterung 
%image_new = zeros(size(img_blur));
image_new = fftblur./fftpsf;
image_new = ifftshift((ifft2(image_new)));
figure, imshow(abs(image_new),[]);

%Wiener Filterung
img_wien = ifftshift(ifft2(p03_wien_filt(img_blur, psf, 0.001)));
figure, imshow(img_wien,[]);