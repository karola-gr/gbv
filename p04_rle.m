function vec_enc = p04_rle(vec)

%Run-Length-Enkodieren eines Zeilenvektors
%Abbilden der Values an ungeraden Indizes und der RL an geraden
%Bsp. vec=(1111112333), p04_rle(vec)=(162133) --> 1x6, 2x6, 3x3

x = size(vec,1);
y = size(vec,2);

if( x > y)
  vec = vec';
end

z = vec(1,1);
count = 1;

%Schrittweises durchlaufen des gegebenen Vektors, prüfen, ob 
%auf eine Zahl die selbe nocheinmal folgt, ggf erhöhen eines 
%Zählers um den Wert 1. 
%Speichern der Zählvariable hinter dem RE (s.Beispiel)

vec_enc = [];

for i = 2:y
  if(z == vec(1,i));
    count++;
  else
    vec_enc = [vec_enc, z, count];
    z = vec(1,i);
    count = 1;
  end
end

vec_enc = [vec_enc, x, count];

end



