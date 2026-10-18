program ej5;
type
  tv = array[1..10] of integer;
procedure CargarVector(var V:tv;var N:byte);
var
  i:byte;
  elem:integer;
begin
  writeln('Ingresa la cantidad de elementos'); readln(n);
  for i:=1 to N do
    begin
      writeln('Ingresa el elemento de la posicion ',i); readln(elem);
      V[i]:=elem;
    end;
end;

function Suma(V:TV; N:byte):word;
begin
  if N = 0 then
     Suma:=0
  else
    Suma:=V[N]+Suma(V,N-1);
end;
procedure Mostrar(V:tv;N,i:byte);
begin
  if i<=N then
     begin
       write(V[i]:4);
       mostrar(V,N,i+1);
     end;
end;
procedure MostrarInverso(V:tv;N:byte);
begin
  if n>0 then
     begin
       write(V[N]:4);
       mostrarInverso(v,n-1);
     end;
end;
function Maximo(V:tv;N:byte;max:integer):integer;
begin
  if N>0 then
     begin
       if V[n]>max then
          Maximo:=maximo(V,n-1,V[n])
       else
         maximo:=maximo(v,n-1,max);
     end
  else
    maximo:=max;
end;
var
  V:TV;
  N,i:byte;
begin
  cargarVector(v,n);
  writeln('La suma de elementos es: ',Suma(v,n));
  writeln;
  writeln('Vector V:');
  mostrar(V,n,1);
  writeln;
  writeln('Vector V inverso:');
  mostrarInverso(v,n);
  writeln;
  writeln('El elemento maximo del vector es: ',Maximo(v,n,V[n]));
  writeln;
  writeln('El promedio de elementos es: ',Suma(v,n)/n:4:1);
  readln;
end.

