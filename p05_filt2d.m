function img_filt = p05_filt2d(image, kernel)

[ix, iy] = size(image);
[kx, ky] = size(kernel);

%Transformation des Bildes in den Frequenzraum

fft_image = fft2(image);

%Anpassen der Größe an Kernel

rand = zeros(ix, iy);
kix = floor(ix/2);
kiy = floor(iy/2);

kkx = floor(kx/2);
kky = floor(ky/2);

rand(kix-kkx:kix+kkx, kiy-kky:kiy+kky) = kernel(1:kx, 1:ky);

%Transformation des Kernels in Frequenzraum

fft_kernel = fft2(fftshift(rand));

%punktweise Multiplikation 

fft_img_filt = fft_image.*fft_kernel;

%Transformation in den Ortsraum 

img_filt = ifft2(fft_img_filt);

end