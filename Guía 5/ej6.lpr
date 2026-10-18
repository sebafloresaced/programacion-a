program ej6;
type
  TVector = array['A'..'Z'] of integer;
function cantPalabras(frase: string): byte;
var
  cont, i: byte;
  enPalabra: boolean;
begin
  cont := 0;
  enPalabra := false;
  for i := 1 to length(frase) do
  begin
    if (frase[i] in ['A'..'Z','a'..'z']) then
    begin
      if not enPalabra then
      begin
        cont := cont + 1;
        enPalabra := true;
      end;
    end
    else
      enPalabra := false;
  end;
  cantPalabras := cont;
end;
function palabraMasLarga(frase: string): string;
var
  i, lenActual, maxLen, inicio, maxInicio: integer;
begin
  lenActual := 0; maxLen := 0;
  inicio := 0; maxInicio := 0;

  for i := 1 to length(frase) + 1 do
  begin
    if (i <= length(frase)) and (frase[i] in ['A'..'Z','a'..'z']) then
    begin
      if lenActual = 0 then inicio := i;
      lenActual := lenActual + 1;
    end
    else
    begin
      if lenActual > maxLen then
      begin
        maxLen := lenActual;
        maxInicio := inicio;
      end;
      lenActual := 0;
    end;
  end;

  palabraMasLarga := copy(frase, maxInicio, maxLen);
end;
function primeraDiccionario(frase: string): string;
var
  i: integer;
  palabra, menor: string;
begin
  menor := '';
  palabra := '';

  for i := 1 to length(frase)+1 do
  begin
    if (i <= length(frase)) and (frase[i] in ['A'..'Z','a'..'z']) then
      palabra := palabra + upcase(frase[i])
    else if palabra <> '' then
    begin
      if (menor = '') or (palabra < menor) then
        menor := palabra;
      palabra := '';
    end;
  end;

  primeraDiccionario := menor;
end;
procedure frecuenciaLetras(frase: string; var F: TVector);
var
  i: integer;
  c: char;
begin
  for c := 'A' to 'Z' do
    F[c] := 0;

  for i := 1 to length(frase) do
  begin
    c := upcase(frase[i]);
    if (c in ['A'..'Z']) then
      F[c] := F[c] + 1;
  end;
end;
var
  frase: string;
  opcion: char;
  F: TVector;
  c: char;
begin
  writeln('Ingrese una frase:');
  readln(frase); 
  writeln();
  writeln('MENU:');
  writeln('a) Numero de palabras');
  writeln('b) Longitud de la palabra mas larga');
  writeln('c) Palabra que aparece antes en el diccionario');
  writeln('d) Frecuencia de cada letra');
  writeln('x) Salir');
  repeat
    write('Opcion: ');
    readln(opcion); opcion:=upcase(opcion);
    case opcion of
      'A': writeln('Numero de palabras: ', cantPalabras(frase));
      'B': writeln('La palabra mas larga es "', palabraMasLarga(frase),
                   '" con longitud ', length(palabraMasLarga(frase)));
      'C': writeln('La primera en el diccionario es: ', primeraDiccionario(frase));
      'D': begin
             frecuenciaLetras(frase, F);
             writeln('Frecuencia de letras:');
             for c := 'A' to 'Z' do
               if F[c] > 0 then
                 writeln(c, ': ', F[c]);
           end;
    end;
    writeln();
  until opcion = 'X';
end.

