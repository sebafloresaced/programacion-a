program ej4;
type
  str4 = string[4];
  RCampera = record
    Cod: str4;      { 1er campo de secuencia }
    Talle: char;    { 2do campo de secuencia }
    Color: byte;    { 1=Negro, 2=Marrón, 3=Azul, 4=Rojo }
    Cant: word;
    Precio: real;
  end;
  TArch = file of RCampera;
procedure Listado(var Arch: TArch);
var
  R: RCampera;
  CodAct: str4;
  TalleAct: char;
  TotalCod, TotalGral, CantNegras: word;
  PorcNeg: real;
begin
  reset(Arch);
  TotalGral := 0;
  CantNegras := 0;
  writeln('STOCK DE PRENDAS');
  writeln;
  read(Arch, R);
  while not eof(Arch) do
  begin
    { --- Corte de primer nivel: Código --- }
    CodAct := R.Cod;
    writeln('Código: ', CodAct);
    writeln('Talle':8, 'Cantidad':12, 'PrecioCosto':15);
    TotalCod := 0;
    while (R.Cod = CodAct) do
    begin
      { --- Corte de segundo nivel: Talle --- }
      TalleAct := R.Talle;
      while (R.Cod = CodAct) and (R.Talle = TalleAct) do
      begin
        { Mostrar detalle de cada registro }
        writeln(TalleAct:8, R.Cant:12, R.Precio:15:2);
        TotalCod := TotalCod + R.Cant;
        TotalGral := TotalGral + R.Cant;
        if R.Color = 1 then
          CantNegras := CantNegras + R.Cant;
        read(Arch, R);
      end;
    end;
    writeln('Cantidad total del código: ', TotalCod);
    writeln;
  end;
  { Calcular porcentaje de prendas negras }
  if TotalGral > 0 then
    PorcNeg := (CantNegras * 100) / TotalGral
  else
    PorcNeg := 0;
  writeln('Cantidad total general: ', TotalGral);
  writeln('Porcentaje de prendas negras: ', PorcNeg:6:2, '%');
  close(Arch);
end;
var
  Arch: TArch;
begin
  assign(Arch, 'CAMPERAS.DAT');
  Listado(Arch);
  readln;
end.

