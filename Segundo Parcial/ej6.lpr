program ej6;
type
  str20 = string[20];
  RMaestro = record
    Legajo: word;
    NombreApellido: str20;
    TotalVentas: real;
    NroFacturaMax: word;
    ImporteMax: real;
  end;
  RDetalle = record
    Legajo: word;
    NroFactura: word;
    Importe: real;
  end;
  TMaestro = file of RMaestro;
  TDetalle = file of RDetalle;
{-----------------------------------------------------}
procedure Actualizar(var Mae: TMaestro; var Det: TDetalle);
var
  RM: RMaestro;
  RD: RDetalle;
  LegAct: word;
begin
  reset(Mae);
  reset(Det);
  read(Mae, RM);
  read(Det, RD);
  while (not eof(Mae)) and (not eof(Det)) do
  begin
    if RM.Legajo = RD.Legajo then
    begin
      { actualizo total y máximo }
      RM.TotalVentas := RM.TotalVentas + RD.Importe;
      if RD.Importe > RM.ImporteMax then
      begin
        RM.ImporteMax := RD.Importe;
        RM.NroFacturaMax := RD.NroFactura;
      end;
      { sobrescribo el registro actualizado }
      seek(Mae, filepos(Mae) - 1);
      write(Mae, RM);
      { avanzo en detalle (puede haber más ventas del mismo legajo) }
      read(Det, RD);
    end
    else if RM.Legajo < RD.Legajo then
      read(Mae, RM)
    else
      read(Det, RD);
  end;
  close(Mae);
  close(Det);
end;
{-----------------------------------------------------}
procedure ListarComisiones(var Mae: TMaestro);
var
  RM: RMaestro;
  Comision: real;
begin
  reset(Mae);
  writeln('LEGAJO':8, 'NOMBRE':15, 'TOTAL':12, 'COMISION':12);
  writeln('-----------------------------------------------');
  while not eof(Mae) do
  begin
    read(Mae, RM);
    Comision := RM.TotalVentas * 0.005;  { 0.5% de comisión }
    writeln(RM.Legajo:8, RM.NombreApellido:15, RM.TotalVentas:12:2, Comision:12:2);
  end;
  close(Mae);
end;
{-----------------------------------------------------}
var
  Mae: TMaestro;
  Det: TDetalle;
begin
  assign(Mae, 'EMPLEADOS.DAT');
  assign(Det, 'VENTAS.DAT');
  Actualizar(Mae, Det);
  ListarComisiones(Mae);
  readln;
end.

