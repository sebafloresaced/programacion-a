program ej2;
const
  casillas = 8;
type
  TR = record
    Tipo:char;
    color:byte;
  end;
  TM = array[1..casillas,1..casillas] of TR;
procedure InicializarTablero(var tablero:tm);
var
  i,j:byte;
begin
  for i:=1 to casillas do
    for j:=1 to casillas do
      begin
        tablero[i,j].color:=0;
        tablero[i,j].tipo:=' ';
      end;
end;
procedure LeerTablero(var Tablero:TM);
var
  fila,columna,colorF:byte;
  tipoF:char;
  arch:text;
begin
  assign(arch,'ej2.txt'); reset(Arch);
  while not eof(arch) do
    begin
      readln(arch, fila, columna,tipoF, tipoF, colorF);
      tablero[fila,columna].tipo:= tipoF;
      tablero[fila,columna].color:= colorF;
    end;
end;
procedure AnalizarTorre(tablero:tm;FilaT,ColT:byte);
var
  i:byte;
begin
  {chequeo hacia arriba}
  i:=filaT-1;
  while (i>1)and(tablero[i,colT].color=0) do
    i:=i-1;
  if tablero[i,colT].color=1 then
    writeln('Amenaza a ', tablero[i,colT].tipo, ' blanco en (', i, ',', colt, ')')
  else
    writeln('Defiende a ', tablero[i,colT].tipo, ' negro en (', i, ',', colt, ')');
  {chequeo hacia abajo}
  i:=filaT+1;
  while (i<casillas)and(tablero[i,colT].color=0) do
    i:=i+1;
  if tablero[i,colT].color=1 then
    writeln('Amenaza a ', tablero[i,colT].tipo, ' blanco en (', i, ',', colt, ')')
  else
    writeln('Defiende a ', tablero[i,colT].tipo, ' negro en (', i, ',', colt, ')');
  {chequeo hacia la izquierda}
  i:=colT-1;
  while (i>1)and(tablero[filaT,i].color=0) do
    i:=i-1;
  if tablero[filaT,i].color=1 then
    writeln('Amenaza a ', tablero[filat,i].tipo, ' blanco en (', filat, ',', i, ')')
  else
    writeln('Defiende a ', tablero[filat,i].tipo, ' negro en (', filat, ',', i, ')');
  {chequeo hacia la derecha}
  i:=colT+1;
  while (i<casillas)and(tablero[filaT,i].color=0) do
    i:=i+1;
  if tablero[filaT,i].color=1 then
    writeln('Amenaza a ', tablero[filat,i].tipo, ' blanco en (', filat, ',', i, ')')
  else
    writeln('Defiende a ', tablero[filat,i].tipo, ' negro en (', filat, ',', i, ')');
end;
procedure Defensas(tablero:tm;filaT,colT:byte);
var
  i:byte;
begin
  writeln('Defensas:');
  for i:=1 to casillas do
    if (tablero[i,colT].color = 2) and (i<>filaT) then
      writeln('La pieza de tipo ',tablero[i,colT].tipo,', en la posicion ',i,' ',colT,' esta siendo defendida por la torre');
  for i:=1 to casillas do
    if (tablero[filaT,i].color = 2) and (i<>filaT) then
      writeln('La pieza de tipo ',tablero[filaT,i].tipo,', en la posicion ',filaT,' ',i,' esta siendo defendida por la torre');
end;
var
  i,j:byte;
  Tablero:TM;
begin
  inicializarTablero(tablero);
  writeln('Ingresa la posicion (i,j) de la torre negra'); readln(i,j);
  tablero[i,j].tipo:='T';
  tablero[i,j].color:=2;
  LeerTablero(tablero);
  AnalizarTorre(tablero,i,j);
  writeln;
  readln;
end.

