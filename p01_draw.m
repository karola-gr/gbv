close all;

%Dialog zum Einlesen
pic = imread('p01_Bild1.png');

%Bildausgabe
figure(),imshow(pic);


%pos = [441 105.0000 11 11];
%rectangle('Position',pos,'Edgecolor', 'r')

figure(),imshow(pic);
%selection = pic(y(1):y(2),x(1):x(2));
pos = [441 106 11 11];

rectangle('Position',pos,'edgecolor', 'r')
