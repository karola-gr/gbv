function img_conv = p05_conv2d(image, kernel)

%Faltung eines Bildes (image --> Größe beliebig) mit linearem Faltungskern (kernel --> quadratisch, ungerade Länge)
%keine internen Funktionen!

[ix, iy] = size(image);
[kx, ky] = size(kernel);

mkx = floor(kx/2);
mky = floor(ky/2);

img_conv = padarray(image,[mkx, mky]);

for i = 1:ix
  for j = 1:iy  
    img_conv(i,j) = sum(sum(img_conv(i:i+(kx-1), j:j+(ky-1)).*kernel));
  end
end

end