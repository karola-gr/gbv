function img_rest = p03_wien_filt(img_blur, psf,k)

m = size(img_blur,1);
n = size(img_blur,2);
img_rest = zeros(m,n);

for u = 1:1:m
  for v = 1:1:n
  img_rest(u,v) =((1/psf(u,v))*(abs(psf(u,v))^2)/(abs(psf(u,v))^2) + k);
  end
end

end

