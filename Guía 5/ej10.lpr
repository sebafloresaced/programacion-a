program ej10;
const
  MAX = 20;
type
  TAI = array[1..MAX] of integer;
  TAB = array[1..MAX] of byte;
procedure MostrarArray(C:TAB;cont:byte);
var
  i:byte;
begin
  if cont>0 then
    begin
      write('(',C[1]);
      for i:=2 to cont do
        write(', ',C[i]);
      writeln(')');
    end;
end;
procedure Sumas(A:TAI;N:byte;var B,C:TAB; var M:byte);
var
  i:byte;
begin
  i:=0; M:=0;
  while i<=N do
    begin
      i:=i+1;
      if A[i]<0 then
         begin
           M:=M+1;
           B[M]:=0; C[M]:=0;
         end
      else
         begin
           B[M]:=B[M]+A[i];
           C[M]:=C[M]+1;
         end;
    end;
   {el ultimo intervalo no es valido ya que no esta entre dos negativos}
   M:=M-1;
end;
var
  i,N,M:byte;
  num:integer;
  A:TAI;
  B,C:TAB;
begin
  writeln('Ingresa la cantidad de numeros del array'); readln(n);
  for i:=1 to N do
     begin
       writeln('Ingresa el numero con indice ',i); readln(num); A[i]:=num;
     end;
  Sumas(A,N,B,C,M);
  MostrarArray(B,M);
  MostrarArray(C,M);
  readln();
end.

