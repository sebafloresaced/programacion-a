program ej7;
type
  str3  = string[3];
  str4  = string[4];
  str30 = string[30];
  RCine = record
    CodCine: str4;
    Zona: byte;
    Capacidad: word;
  end;
  RVenta = record
    CodCine: str4;
    CodPeli: str3;
    LocVendidas: word;
  end;
  RPeli = record
    CodPeli: str3;
    Titulo: str30;
    Duracion: byte;
  end;
  TArcCine   = file of RCine;
  TArcVentas = file of RVenta;
  TVZona = array[1..10] of word;
{------------------------------------------------------}
procedure InicializarTotales(var TotZona: TVZona);
var i: byte;
begin
  for i := 1 to 10 do
    TotZona[i] := 0;
end;
{------------------------------------------------------}
procedure MostrarTotalesZona(TotZona: TVZona);
var i: byte;
begin
  writeln;
  writeln('Total de localidades vendidas por zona:');
  for i := 1 to 10 do
    writeln('Zona ', i:2, ': ', TotZona[i]);
end;
{------------------------------------------------------}
procedure ProcesarCine(var ACine: TArcCine; var AVenta: TArcVentas;
                       var TotZona: TVZona;
                       var CinesSinPeli: word;
                       var CPeliMenor: str3; var MinProm: real);
var
  RC: RCine;
  RV: RVenta;
  CodAct, PeliAct: str3;
  CantPelis, CantFuncs, TotalLoc: word;
  ContPeli, SumaPeli: word;
  PorcOcup, PromPeli: real;
begin
  reset(ACine);
  reset(AVenta);
  InicializarTotales(TotZona);
  CinesSinPeli := 0;
  MinProm := 99999;
  CPeliMenor := '---';
  writeln('Cine':8, 'Cant.Peliculas':16, 'Cant.Funciones':16,
          'Total LocVendidas':20, '%Ocup.Prom':15);
  read(ACine, RC);
  read(AVenta, RV);
  while not eof(ACine) do
  begin
    { Cine sin ventas }
    if (RV.CodCine > RC.CodCine) or eof(AVenta) then
    begin
      CinesSinPeli := CinesSinPeli + 1;
      read(ACine, RC);
    end
    else if RC.CodCine = RV.CodCine then
    begin
      CodAct := RC.CodCine;
      CantPelis := 0; CantFuncs := 0; TotalLoc := 0;
      while (RV.CodCine = CodAct) do
      begin
        { Corte de película dentro del cine }
        PeliAct := RV.CodPeli;
        SumaPeli := 0; ContPeli := 0;
        while (RV.CodCine = CodAct) and (RV.CodPeli = PeliAct) do
        begin
          SumaPeli := SumaPeli + RV.LocVendidas;
          ContPeli := ContPeli + 1;
          read(AVenta, RV);
        end;
        CantPelis := CantPelis + 1;
        CantFuncs := CantFuncs + ContPeli;
        TotalLoc := TotalLoc + SumaPeli;
        { Calcular película con menor promedio }
        PromPeli := SumaPeli / ContPeli;
        if PromPeli < MinProm then
        begin
          MinProm := PromPeli;
          CPeliMenor := PeliAct;
        end;
      end;
      if CantFuncs > 0 then
        PorcOcup := (TotalLoc / (RC.Capacidad * CantFuncs)) * 100
      else
        PorcOcup := 0;
      TotZona[RC.Zona] := TotZona[RC.Zona] + TotalLoc;
      writeln(CodAct:8, CantPelis:16, CantFuncs:16, TotalLoc:20, PorcOcup:15:2);
      read(ACine, RC);
    end
    else
      read(AVenta, RV);
  end;
  close(ACine);
  close(AVenta);
end;
{------------------------------------------------------}
procedure MostrarResumen(CinesSinPeli: word; CPeliMenor: str3; MinProm: real);
begin
  writeln;
  writeln('Cantidad de cines que no proyectaron ninguna película: ', CinesSinPeli);
  writeln('Película con menor promedio de localidades vendidas por función: ',
          CPeliMenor, ' (', MinProm:6:2, ' locs/promedio)');
end;
{------------------------------------------------------}
var
  ACine: TArcCine;
  AVenta: TArcVentas;
  TotZona: TVZona;
  CinesSinPeli: word;
  CPeliMenor: str3;
  MinProm: real;

begin
  assign(ACine, 'CINES.DAT');
  assign(AVenta, 'VENTAS.DAT');
  ProcesarCine(ACine, AVenta, TotZona, CinesSinPeli, CPeliMenor, MinProm);
  MostrarResumen(CinesSinPeli, CPeliMenor, MinProm);
  MostrarTotalesZona(TotZona);
  readln;
end.

