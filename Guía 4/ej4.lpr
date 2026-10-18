program ej4;
function potencia(x,n:byte):word;
 var
   i:byte;
   total:word;
 begin
   total:=1;
   for i:=1 to n do
      total:=total*x;
   potencia:=total;
 end;
var
  x,n:byte;
begin
   writeln('Ingrese un numero y despues a que valor lo queres potenciar'); Readln(x); Readln(n);
   writeln(x,' a la ',n,' es ',potencia(x,n));
   readln();
end.

