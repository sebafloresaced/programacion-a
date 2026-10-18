program ej7d;
var
  Mazo1,Mazo2: string;
  Palo1,Palo2: char;
  Numero1,Numero2:byte;
begin
  writeln('Ingrese mazo (Rojo,Azul), palo (O,C,E,B) y numero de tu primer carta (1...12)');
  readln(Mazo1);
  readln(Palo1);
  readln(Numero1);
  writeln('Ingrese mazo (Rojo,Azul), palo (O,C,E,B) y numero de tu segunda carta (1...12)');
  readln(Mazo2);
  readln(Palo2);
  readln(Numero2);
  writeln('Son tus cartas consecutivas?');
  writeln((Palo1=Palo2)AND((numero1=numero2-1)OR(numero1-1=numero2)));
  readln(mazo1)
end.
