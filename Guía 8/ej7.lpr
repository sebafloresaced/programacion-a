program ej7;
type
  TM = array[1..5,1..5] of integer;
procedure CargarMatriz(var M:tm;N:byte);
var
  i,j:byte;
  num:integer;
begin
  for i:=1 to N do
    for j:=1 to N do
      begin
        write('Ingresa un numero: '); readln(num);
        M[i,j]:=num;
      end;
end;
function Minimo(M:tm;N,i,j:byte;min:integer):integer;
begin
  if i>0 then
    if j>0 then
      begin
        if M[i,j]<min then
          min:=M[i,j];
        minimo:=minimo(m,n,i,j-1,min);
      end
    else
      minimo:=minimo(M,N,i-1,N,min)
  else
    minimo:=min;
end;
var
  M:TM;
  N:byte;
begin
  write('Ingresa el orden de la matriz: '); readln(n);
  CargarMatriz(m,n);
  writeln('El elemento minimo de la matriz es: ',minimo(m,n,n,n,M[n,n]));
  readln;
end.

