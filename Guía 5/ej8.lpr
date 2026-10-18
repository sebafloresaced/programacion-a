program ej8;
type
  TA = array[1..20] of byte;
var
  i,N,num,frecuencia,contW:byte;
  V,W:TA;
begin
  writeln('Ingresa la cantidad de elementos del array'); readln(n);
  for i:=1 to N do
      begin
        writeln('Ingresa el elemento ',i); readln(num);
        V[i]:=num;
      end;
  i:=1; frecuencia:=0; contW:=0;
  while i<=N do
    begin
      num:=V[i];
      repeat
        frecuencia:=frecuencia+1;
        i:=i+1;
      until num<>V[i];
      contW:=contW+1;
      W[contW]:=frecuencia;
      frecuencia:=0;
    end;
  write('El array W, que contiene las frecuencias de los numeros, es: (',W[1]);
  for i:=2 to contW do
    write(', ',W[i]);
  writeln(')');
  readln();
end.

