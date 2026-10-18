program ej7b;
var
  Mazo: string;
  Palo: char;
  Numero:byte;
begin
  writeln('Ingrese mazo (Rojo,Azul), palo (O,C,E,B) y numero de la carta (1...12)');
  readln(Mazo);
  readln(Palo);
  readln(Numero);
  writeln('Es tu carta una figura del mazo rojo?');
  writeln((mazo='Rojo')AND((numero=10)OR(numero=11)OR(numero=12)));
  readln(mazo)
end.
