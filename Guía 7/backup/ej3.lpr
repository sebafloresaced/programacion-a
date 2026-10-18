program ej3;
type
  TR = record
    posX,posY:integer;
    dist:real;
  end;
  TV = array[1..20] of TR;
function Distancia(x,y:byte):real;
begin
  distancia:= sqrt(sqr(x)+sqr(y));
end;
procedure LeerDatos(var Puntos:TV;var N:byte);
var
  arch:text;
  x,y:integer;
begin
  n:=0;
  assign(arch,'ej3.txt'); reset(arch);
  while not eof(arch) do
    begin
       readln(arch, x, y);
       n:=n+1;
       puntos[n].posX:=x;
       puntos[n].posY:=y;
       puntos[n].dist:= distancia(x,y);
    end;
  close(arch);
end;
function Cercano(puntos:tv;n:byte):byte;
var
  i,min:byte;
begin
  min:=1;
  for i:=2 to N do
    if puntos[i].dist<puntos[min].dist then
       min:=i;
  cercano:=min;
end;
function Lejano(puntos:tv;n:byte):byte;
var
  i,max:byte;
begin
  max:=1;
  for i:=2 to N do
    if puntos[i].dist>puntos[max].dist then
       max:=i;
  lejano:=max;
end;
procedure porcentajes(puntos:tv;n:byte);
var
  i:byte;
  contX,contY,cont1,cont2,cont3,cont4,cont0:byte;
begin
  contX:=0; contY:=0; cont1:=0; cont2:=0; cont3:=0; cont4:=0; cont0:=0;
  for i:=1 to N do
     if puntos[i].posx=0 then
        begin
          if puntos[i].posy=0 then
             cont0:=cont0+1
          else
            contY:=contY+1;
        end
     else
       if puntos[i].posy=0 then
          contX:=contX+1
       else
         if puntos[i].posx>0 then
            begin
              if puntos[i].posy>0 then
                 cont1:=cont1+1
              else
                 cont4:=cont4+1;
            end
         else
            if puntos[i].posy>0 then
               cont2:=cont2+1
            else
              cont3:=cont3+1;
  writeln('Un ',contX/N*100:4:1,'% de puntos estan sobre el eje X');
  writeln('Un ',contY/N*100:4:1,'% de puntos estan sobre el eje Y');
  writeln('Un ',cont0/N*100:4:1,'% de puntos estan en el centro');
  writeln('Un ',cont1/N*100:4:1,'% de puntos estan en el cuadrante 1');
  writeln('Un ',cont2/N*100:4:1,'% de puntos estan en el cuadrante 2');
  writeln('Un ',cont3/N*100:4:1,'% de puntos estan en el cuadrante 3');
  writeln('Un ',cont4/N*100:4:1,'% de puntos estan en el cuadrante 4');
end;
var
  puntos:TV;
  n,cerc,lej:byte;
begin
  LeerDatos(puntos,n);
  cerc:= cercano(puntos,n); lej:= lejano(puntos,n);
  writeln('Mas cercano al centro: (', puntos[cerc].posX,', ',puntos[cerc].posY,')');
  writeln('Mas lejano al centro: (', puntos[lej].posX,', ',puntos[lej].posY,')');
  porcentajes(puntos,n);
  readln;
end.

