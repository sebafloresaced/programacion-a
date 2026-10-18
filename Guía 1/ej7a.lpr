program ej7a;
var
  Mazo: string;
  Palo: char;
  Numero:byte;
begin
  writeln('Ingrese mazo (Rojo,Azul), palo (O,C,E,B) y numero de la carta (1...12)');
  readln(Mazo);
  readln(Palo);
  readln(Numero);
  writeln('Es tu carta un as de copa?');
  writeln((numero=1)AND(palo='C'));
  readln(mazo)
end.

