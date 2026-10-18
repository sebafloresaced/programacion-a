program ej15b;
var
  Arch: text;
  car,letra: char;
  cont: integer;
  tieneLetra: boolean;
begin
  Assign(Arch,'ej16b.txt'); Reset(Arch);
  writeln('Ingrese un caracter:');
  Readln(letra); letra := Upcase(letra);
  cont := 0;
  tieneLetra := false;
  while car<>'.' do
    begin
      read(Arch, car);
      car := Upcase(car);
      if (car = ' ') or (car = '.') then   {termino la palabra}
        begin
          if tieneLetra then
            cont := cont + 1;
          tieneLetra := false;
        end
      else
        begin
          if car = letra then
            tieneLetra := true;
        end;
    end;
  close(Arch);
  writeln('El total de palabras que contienen la letra ', letra, ' es ', cont);
  readln(letra);
end.
