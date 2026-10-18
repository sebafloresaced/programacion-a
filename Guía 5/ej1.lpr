program ej1;
type
  TA = array[1..100] of real;
var
  N,i:byte;
  A,B:TA;
function suma(A:TA;N:byte):real;
  var
    i:byte;
    tot:real;
  begin
    tot:=0;
    for i:=1 to N do
        tot:=tot+A[i];
    suma:=tot;
  end;
procedure pares(A:TA;N:byte);
  var
    i:byte;
  begin
    for i:=1 to N do
        begin
          if (i mod 2 = 0) then
             writeln('El elemento ',A[i]:3:1,' tiene indice par');
        end;
  end;
procedure minMax(A:TA;N:byte);
  var
    i:byte;
    min,max:real;
  begin
    min:=100;
    max:=-100;
    for i:=1 to N do
        begin
          if A[i]<min then
             min:=A[i];
          if A[i]>max then
             max:=A[i];
        end;
    writeln('El maximo del array es: ',max:4:1);
    writeln('El minimo del array es: ',min:4:1);
  end;
Procedure Permutar(A:TA;N:byte;var B:TA);
  var
    i,aux:byte;
  begin
    for i:=1 to N do
      begin
        aux:=N-i+1;
        B[i]:=A[aux];
      end;
  end;
begin
  writeln('Ingrese la cantidad de elementos del array'); readln(N);
  for i:=1 to N do
      begin
        writeln('Ingrese el elemento numero ',i); readln(A[i]);
      end;
  writeln('La suma total de sus elementos es: ',suma(A,N):5:1);
  pares(A,N);
  minMax(A,N);
  Permutar(A,N,B);
  write('(');
  write(B[1]:3:1);
  for i:=2 to N do
      begin
        write(', ',B[i]:3:1);
      end;
  write(')');
  readln();
end.

