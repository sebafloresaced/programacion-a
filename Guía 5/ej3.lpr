program ej3;
type
  TA=array[1..100] of integer;
procedure Cambiar(var A:TA;cant:byte;K:integer);
  var
    i:byte;
  begin
    for i:=1 to cant do
      if A[i]=k then
         A[i]:=0;
  end;
var
  A:TA;
  cant,i:byte;
  K,num:integer;
  arch:text;
begin
  assign(arch,'ej3.txt'); reset(arch);
  cant:= 0;
  while not eof(arch) do
    begin
      read(arch,num);
      cant:=cant+1;
      A[cant]:=num;
    end;
  close(arch);
  writeln('Ingrese un numero entero'); readln(k);
  cambiar(A,cant,k);
  write('(',A[1]);
  for i:=2 to cant do
      write(', ',A[i]);
  write(')');
  readln();
end.

