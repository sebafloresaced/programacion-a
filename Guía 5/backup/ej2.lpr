program ej2;
type
  TA = array[1..100] of integer;
var
  V,W:TA;
  contV,contW,i:byte;
  Arch:text;
  Num:integer;
begin
  assign(Arch,'ej2.txt'); reset(arch);
  contV:=0; contW:=0;
  while not eof(arch) do
    begin
      read(Arch,num);
      if num<>0 then
         begin
           if num mod 2 = 0 then
              begin
                contV:=contV+1;
                V[contV]:=num;
              end
           else
              begin
                contW:=contW+1;
                W[contW]:=num;
              end;
         end;
    end;
  close(arch);
  writeln('Array de numeros Pares:');
  write('('); write(V[1]);
  for i:=2 to contV do
      write(', ',V[i]);
  write(')');
  writeln();
  writeln('Array de numeros Impares:');
  write('('); write(W[1]);
  for i:=2 to contW do
      write(', ',W[i]);
  write(')');
  readln();
end.

