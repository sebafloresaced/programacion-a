program ej4;
function invertir(palabra:string):string;
var
  aux:string;
begin
  if length(palabra)=1 then
    invertir:=palabra
  else
    begin
      aux:= copy(palabra,1,length(palabra)-1);
      invertir:= palabra[length(palabra)] + invertir(aux);
    end;
end;
var
  palabra:string;
begin
  write('Ingresa una palabra: '); readln(palabra);
  writeln('La palabra invertida es: ',invertir(palabra));
  readln;
end.

