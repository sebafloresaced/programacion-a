program ej3;
type
  str3 = string[3];
  str15 = string[15];
  RExc = record
    CodExc: str3;
    Descrip: str15;
    PrecioBase, PrecioComida: real;
  end;
  RBol = record
    CodExc: str3;
    NroBoleto: word;
    Comida: char;   { 'S' o 'N' }
  end;
  TExc = file of RExc;
  TBol = file of RBol;
procedure Listado(var AExc: TExc; var ABol: TBol);
var
  Exc: RExc;
  Bol: RBol;
  CodAct: str3;
  CantBol, CantCom, TotalBol: word;
  MontoExc, MontoGral, Porcentaje: real;
begin
  reset(ABol);
  reset(AExc);
  MontoGral := 0;
  TotalBol := 0;
  CantCom := 0;
  read(ABol, Bol);
  writeln('Excursion':15, 'Cant.Boletos':15, 'Cant.Comidas':15, 'MontoTotal':15);
  while not eof(ABol) do
  begin
    { comienzo de bloque de excursion }
    CodAct := Bol.CodExc;
    CantBol := 0;
    MontoExc := 0;
    { buscar descripción y precios en archivo EXCURSIONES }
    seek(AExc, 0);
    repeat
      read(AExc, Exc);
    until Exc.CodExc = CodAct;
    while (not eof(ABol)) and (Bol.CodExc = CodAct) do
    begin
      CantBol := CantBol + 1;
      MontoExc := MontoExc + Exc.PrecioBase;
      if upcase(Bol.Comida) = 'S' then
      begin
        CantCom := CantCom + 1;
        MontoExc := MontoExc + Exc.PrecioComida;
      end;
      read(ABol, Bol);
    end;
    writeln(Exc.Descrip:15, CantBol:15, CantCom:15, MontoExc:15:2);
    MontoGral := MontoGral + MontoExc;
    TotalBol := TotalBol + CantBol;
  end;
  if TotalBol > 0 then
    Porcentaje := (CantCom * 100) / TotalBol
  else
    Porcentaje := 0;
  writeln;
  writeln('% de turistas con comida: ', Porcentaje:5:2, '%');
  writeln('Monto total de excursiones: $', MontoGral:8:2);
  close(ABol);
  close(AExc);
end;
var
  AExc: TExc;
  ABol: TBol;
begin
  assign(AExc, 'EXCURSIONES.DAT');
  assign(ABol, 'BOLETERIA.DAT');
  Listado(AExc, ABol);
  readln;
end.

