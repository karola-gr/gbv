%Dialog zum Einlesen
pic = imread('p01_Bild1.png');
pic2 = imread('p01_Bild2.png');
%Bildausgabe
figure(),imshow(pic);
figure(),imshow(pic2);


%Fehlerbehebung
transppic = pic2;

eleb = 5001;
while(eleb < (321*483)-200)
    transppic(eleb) = transppic(eleb+200);
    eleb = eleb+1;
end

elew = 120001;
while(elew < (321*483)-442)
    transppic(elew) = transppic(elew+442);
    elew = elew+1;
end
vector = reshape(transppic,1,(size(transppic, 1)*size(transppic, 2)));
vector2 = transppic(1:154401);
pic4 = reshape(vector2, [size(pic, 1), size(pic, 2)]);
figure(),imshow(pic4);

disp('Vergleich:');
disp(isequal(pic,pic4));
