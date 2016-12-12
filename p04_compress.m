function img_compressed = p04_compress(image, block_size,quant)

%a) Zerlegen des Bildes in block_size x block_size

m = size(image,1);
n = size(image,2);

img_compressed_8 = cell(m/block_size, n/block_size);
img_compressed_16 = cell(m/block_size, n/block_size);

%8x8 Blöcke 

for x = 1:1:(m/block_size-1)
  for y = 1:1:(n/block_size-1)
    img_compressed{x+1,y+1} = image((x*block_size+1):((x+1)*block_size), (y*block_size+1):((y+1)*block_size));
  end
end

%16x16 Blöcke  

for x = 1:1:(m/block_size-1)
  for y = 1:1:(n/block_size-1)
    img_compressed{x+1,y+1} = image((x*block_size+1):((x+1)*block_size), (y*block_size+1):((y+1)*block_size));
  end
end
 
%b) Diskrete Kosinustransformation 

img_compressed_8dct = cell(m/8,n/8);

for u = 1:1:m/8
  for v = 1:1:n/8
    img_compressed_8dct{u,v} = dct2(img_compressed_8dct{u,v});
  end
end

img_compressed_16dct = cell(m/16,n/16);

for u = 1:1:m/16
  for v = 1:1:n/16
    img_compressed_16dct{u,v} = dct2(img_compressed_16dct{u,v});
  end
end

%c) Quantisierung der DCT-Blöcke mit block_size x block_size
%   Quantisierungsmatrix quant --> p04_quant.mat

img_compressed_8dctq = cell(m/8, n/8);
for u = 1:1:m/8
  for v = 1:1:n/8
    img_compressed_8dctq{u,v} = round(img_compressed_8dct{u,v}./q8);
  end
end

img_compressed_16dctq = cell(m/16, n/16);
for u = 1:1:m/16
  for v = 1:1:n/16
    img_compressed_16dctq{u,v} = round(img_compressed_16dct{u,v}./q16);
  end
end

%d) Umsortieren entlang der Antidiagonalen jedes Blockes
%   --> p04_zigzag

zigzag_8 = cell(m/8,n/8);
compsize8 = 0;
for u = 1:1:m/8
  for v = 1:1:n/8
    zigzag_8{u,v} = zigzag(img_compressed_8dctq{u,v});
  end
end

zigzag_16 = cell(m/16,n/16);
compsize16 = 0;
for u = 1:1:m/16
  for v = 1:1:n/16
    zigzag_16{u,v} = zigzag(img_compressed_16dctq{u,v});
  end
end

%e) Kodieren der sortierten, quantisierten Koeffizientenvektors
%   --> p04_rle, Aufgabe 1

for u = 1:1:m/8
  for v = 1:1:n/8
   rle_8{u,v} = p04_rle(zigzag_8);
   compsize8 = compsize8 + length(rle_8{u,v});
  end
end
 
for u = 1:1:m/16
  for v = 1:1:n/16
   rle_16{m,n} = p04_rle(zigzag_16);
   compsize16 = compsize16+length(rle_16{m,n});
  end
end

%f) Rückgabe der kodierten Vektoren in Cell-Array (img_compressed
%   Größe vertikal x horizontal)

if (block_size == 8)
  img_compressed = cell2mat(rle_8);
else
  img_compressed = cell2mat(rle_16);
end

end