program ej6;
function Azar(a,b:word):integer;
var
  aux:integer;
 begin
   repeat
     Aux:=random(B+1);
   until (A<=aux)and(aux<=B);
   Azar:=Aux;
 end;
var
  A,B:word;
begin
   writeln('Ingresa el primer valor del intervalo [A,B]'); readln(A);
   writeln('Ingresa el segundo valor del intervalo [A,B]');
   repeat
     readln(B);
     if A>=B then
        writeln('El segundo valor del intervalo debe ser mayor que el primero');
   until A<B;
   writeln('Un numero aleatorio entre ',A,' y ',B,' es ',azar(A,B));
   readln();
end.

