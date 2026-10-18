program ej2;
function Factorial(N:byte):word;
  var
    i:byte;
    total:word;
  begin
    if n>0 then
      begin
        total:=1;
        for i:=N downto 1 do
         total:=total*i;
        factorial:=total;
      end
    else
      factorial:=1;
  end;
var
  n:byte;
begin
  writeln('Ingresa un numero'); readln(n);
  writeln('El factorial de ',n ,' es ',factorial(n));
  readln();
end.

