program ej6;
type
  TV = array[1..10] of real;
procedure CargarVector(var A:tv;n:byte);
var
 num:real;
 i:byte;
begin
  for i:=1 to n do
    begin
      writeln('Ingresa el elemento de indice ',i);
      readln(num);
      A[i]:=num;
    end;
end;
function EncontrarDesordenado(A:tv;n:byte;x:real):byte;
begin
  if n=0 then
    EncontrarDesordenado:=0
  else
    if A[n] = x then
      EncontrarDesordenado:=N
    else
      EncontrarDesordenado:=EncontrarDesordenado(A,n-1,x)
end;
function EncontrarOrdenado(A:TV; ini,fin:byte; x:real):byte;
var
 medio:byte;
begin
  if ini > fin then
     EncontrarOrdenado:=0
  else
    begin
      medio := (ini + fin) div 2;
      if A[medio] = x then
        EncontrarOrdenado:=medio
      else
        if x<A[medio] then
          EncontrarOrdenado:=EncontrarOrdenado(A,ini,medio-1,x)
        else
          EncontrarOrdenado:=EncontrarOrdenado(A,medio+1,fin,x);
    end;
end;
var
  Ord,Desord:TV;
  X:real;
  N:byte;
begin
  writeln('Ingresa la cantidad de elementos del vector'); readln(n);
  writeln('Vector ordenado:');
  CargarVector(ord,n);
  writeln('Vector desordenado:');
  CargarVector(desord,n);
  write('Ingresa x: '); readln(x);
  writeln('Busqueda ordenada: ',encontrarordenado(ord,1,n,x));
  writeln('Busqueda desordenada: ',encontrardesordenado(desord,n,x));
  readln;
end.

