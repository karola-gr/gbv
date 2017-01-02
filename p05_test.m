clear;
close; 
clc;

%Einlesen des Bildes 

image = imread('p05_Bild01.bmp');

% a) Sobel-Kernel in x- und y-Richtung (3x3)

sobelx = (1/8)*[-1 0 1; -2 0 2; -1 0 1];
sobely = (1/8)*[-1 -2 -1; 0 0 0; 1 2 1];

% b) Mittelwertkernel 
%    3x3

mk_3x3 = [1/9 1/9 1/9; 
          1/9 1/9 1/9; 
          1/9 1/9 1/9];

%    7x7

mk_7x7 = [1/49 1/49 1/49 1/49 1/49 1/49 1/49; 
          1/49 1/49 1/49 1/49 1/49 1/49 1/49; 
          1/49 1/49 1/49 1/49 1/49 1/49 1/49];

%    11x11

mk_11x11 = [1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121; 
            1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121;
            1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121;]
            

% 1: lineare Faltung
% x-Richtung
t1 = cputime;
img_conv1 = p05_conv2d(image, sobelx);

% y-Richtung 

img_conv2 = p05_conv2d(image, sobely);

% Addition und Ausgabe

img_conv = (img_conv1+img_conv2)/2;
figure('Name','lineare Faltung Sobel', 'NumberTitle', 'off');
imshow(img_conv,[]);

%Rechenzeit

e = cputime-t1;
disp('Zeit lineare Faltung Sobel:');
disp(e);

%Mittelwertkernel 3x3
t1 = cputime;
img_conv = p05_conv2d(image, mk_3x3);
figure('Name','lineare Faltung 3x3', 'NumberTitle', 'off');
imshow(img_conv,[]);
e = cputime-t1;
disp('Zeit lineare Faltung 3x3:');
disp(e);

%Mittelwertkernel 7x7
t1 = cputime;
img_conv = p05_conv2d(image, mk_7x7);
figure('Name','lineare Faltung 7x7', 'NumberTitle', 'off');
imshow(img_conv,[]);
e = cputime-t1;
disp('Zeit lineare Faltung 7x7:');
disp(e);

%Mittelwertkernel 11x11
t1 = cputime;
img_conv = p05_conv2d(image, mk_11x11);
figure('Name','lineare Faltung 11x11', 'NumberTitle', 'off');
imshow(img_conv,[]);
e = cputime-t1;
disp('Zeit lineare Faltung 11x11:');
disp(e);

% 2: Filterung im Frequenzraum
% Sobel
t1 = cputime;
%Faltung 
img_conv1 = p05_filt2d(image, sobelx);
img_conv2 = p05_filt2d(image, sobely);
img_conv = (img_conv1+img_conv2)/2;
figure('Name','Filterung Sobel', 'NumberTitle', 'off');
imshow(img_conv,[]);
e = cputime-t1;
disp('Zeit Filterung Sobel:');
disp(e);

%Mittelwertkernel 3x3
t1 = cputime;
img_filt = p05_filt2d(image, mk_3x3);
figure('Name', 'Filterung 3x3', 'NumberTitle', 'off');
imshow(img_filt,[]);
e = cputime-t1;
disp('Zeit lineare Faltung 3x3:');
disp(e);

%Mittelwertkernel 7x7
t1 = cputime;
img_filt = p05_filt2d(image, mk_7x7);
figure('Name', 'Filterung 7x7', 'NumberTitle', 'off');
imshow(img_filt,[]);
e = cputime-t1;
disp('Zeit lineare Faltung 7x7:');
disp(e);

%Mittelwertkernel 11x11
t1 = cputime;
img_filt = p05_filt2d(image, mk_11x11);
figure('Name', 'Filterung 11x11', 'NumberTitle', 'off');
imshow(img_filt,[]);
e = cputime-t1;
disp('Zeit lineare Faltung 11x11:');
disp(e);


