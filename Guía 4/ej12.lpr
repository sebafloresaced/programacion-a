program ej12;
procedure Fibonacci(cota:word);
var
  n1,n2,term:word;
   begin
      n2:=1; term:=1;
      write('1, 1');
      while cota>=term do
        begin
           term:=term+n2;
           n2:=term-n2;
           n1:=term-n2;
           write(', '); write(term);
        end;
   end;
var
  N,cota,i:word;
begin
  writeln('Cuantas cotas queres ingresar?'); readln(n);
  for i:=1 to N do
      begin
        writeln('Ingresa la cota nro ',i); readln(cota);
        Fibonacci(cota); writeln();
      end;
  readln();
end.

