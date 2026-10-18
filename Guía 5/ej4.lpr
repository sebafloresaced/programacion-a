program ej4;
type
  TA=array[1..100] of integer;
procedure Compactar(A:TA;N:byte;var B:TA;var cont:byte);
  var
    i:byte;
  begin
    cont:=0;
    for i:=1 to N do
      if A[i]<>0 then
         begin
           cont:=cont+1;
           B[cont]:=A[i];
         end;
  end;
var
  A,B:TA;
  i,n,cont:byte;
  num:integer;
begin
  writeln('Ingrese la cantidad de elementos del array'); readln(n);
  for i:=1 to N do
      begin
        writeln('Ingresa el numero que va en la posicion ',i);
        readln(num);
        A[i]:=num;
      end;
  compactar(A,N,B,cont);
  writeln('El array compactado es:');
  write('(',B[1]);
  for i:=2 to cont do
    write(', ',B[i]);
  write(')');
  readln();
end.

