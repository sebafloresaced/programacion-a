program ej5;
function valorX(x1,y1,t1,x2,y2,t2:integer):real;
  begin
    valorX:=(t1*y2-t2*y1)/(x1*y2-x2*y1);
  end;
function valorY(x1,y1,t1,x2,y2,t2:integer):real;
  begin
    valorY:=(x1*t2-x2*t1)/(x1*y2-x2*y1);
  end;
var
 x1,y1,t1,x2,y2,t2:integer;
begin
  writeln('Ingresa los coeficientes de la primer ecuacion en el orden x, y, termino independiente');
  readln(x1,y1,t1);
  writeln('Ingresa los coeficientes de la segunda ecuacion en el orden x, y, termino independiente');
  readln(x2,y2,t2);
  writeln('La solucion es: x=',valorX(x1,y1,t1,x2,y2,t2):4:2,' e y=',valorY(x1,y1,t1,x2,y2,t2):4:2);
  readln();
end.

