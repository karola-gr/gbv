function vec = p04_rld(vec_enc)

%Dekodierungsfunktion passend zu vec_enc
%ungerade Indizes geben die REs, gerade die Values


%Einlesen des gegebenen kodierten Vektors
%Durchlaufen der Stellen, Abbilden der RE, in abh der Häufigkeit
x = size(vec_enc,1);
y = size(vec_enc,2);

vec = [];
m = 0;
n = 0;
for i = 1:x
  if(mod(i,2) == 0)
    m = vec_enc(1,i);
    n = 0;
  end
  
  for k = 1:n
    vec = [vec, m];
  end
  end
end

%Überprüfen, ob der neue Vektor mit dem alten/originalen übereinstimmt

isequal(vec, vec_enc.vec);

end