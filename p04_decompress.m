function image = p04_decompress(img_compressed, quant)

%passend zu compressed
%Dekomprimieren des übergebenen Bildes in Grauwertbild
%--> p04_rld, p04_zagzig, idct2
%Reihenfolge! Dequantisierung!

x = size(img_compressed,1);
y = size(img_compressed,2);

img_compressed_8 = cell(m/8, n/8);
img_compressed_16 = cell(m/16, n/16);

%p04_rld & p04_zagzig

img_decompressed_8 = cell(m/8, n/8);
for u = 1:1:m/8
  for v = 1:1:n/8
    img_decompressed_8{u,v} = zagzig(rle_dec(img_compressed_8{u,v}));
  end
end

img_decompressed_16 = cell(m/16, n/16);
for u = 1:1:m/16
  for v = 1:1:n/16
    img_decompressed_16{u,v} = zagzig(rle_dec(img_compressed_16{u,v}));
  end
end

%idct2

load('p04_quantm');
for u = 1:1:m/8
  for v = 1:1:n/8
    img_decompressed_8{u,v}= idct2(img_decompressed_8{u,v} .* quant8);
  end
end

for u = 1:1:m/16
  for v = 1:1:n/16
    img_decompressed_16{u,v} = idct2(img_decompressed_16{u,v} .* quant16);
  end
end

end