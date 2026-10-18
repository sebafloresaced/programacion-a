program ej5;
type
  TA=array[1..100] of integer;
procedure LeerNums(var A:TA;var cont:byte);
var
  arch:text;
  num:integer;
begin
  assign(arch,'ej5.txt'); reset(arch);
  cont:=0;
  while not eof(arch) do
    begin
      read(arch,num);
      cont:=cont+1;
      A[cont]:= num;
    end;
end;
procedure BuscarMax(A:TA;cont:byte;var max:integer);
var
  i:byte;
begin
  max:=A[1];
  for i:=1 to cont do
    if A[i]>max then
       max:=A[i];
end;
procedure ArrayDivisores(max:integer;var B:TA;var contB:byte);
var
  i:byte;
begin
  contB:=0;
  for i:=1 to max do
    if max mod i = 0 then
       begin
          contB:=contB+1;
          B[contB]:=i;
       end;
end;
function promedio(B:TA;contB:byte):real;
var
  i:byte;
  total:real;
begin
  if contB = 0 then
    promedio := 0
  else
  begin
    total := 0;
    for i := 1 to contB do
      total := total + B[i];
    promedio := total / contB;
  end;
end;
procedure MostrarArray(C:TA;contC:byte);
var
  i:byte;
begin
  write('(',C[1]);
  for i:=2 to contC do
    write(', ',C[i]);
  write(')');
end;
var
  contA,contB:byte;
  A,B:TA;
  max:integer;
begin
  LeerNums(A,contA);
  BuscarMax(A,contA,max);
  ArrayDivisores(max,B,contB);
  writeln('Array A:');
  MostrarArray(A,contA); writeln();
  writeln('Array B:');
  MostrarArray(B,contB); writeln();
  writeln('El promedio de los elementos de B es: ',promedio(B,contB):3:1);
  readln();
end.

