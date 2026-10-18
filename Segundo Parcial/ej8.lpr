program ej8;
type
  str4 = string[4];
  RCampera = record
    Articulo: str4;
    Talle: char;
    Color: byte;      { 1=Negro, 2=Marrón, 3=Azul, 4=Rojo }
    Cantidad: word;   { stock disponible }
    Precio: real;
  end;
  RPedido = record
    Articulo: str4;
    Talle: char;
    Color: byte;
    Cantidad: word;   { cantidad pedida }
  end;
  TArchCamp = file of RCampera;
  TArchPed  = file of RPedido;
{-----------------------------------------------------------}
procedure ActualizarStock(var ACamp: TArchCamp; var APed: TArchPed);
var
  RC: RCampera;
  RP: RPedido;
  Adeudada: word;
begin
  reset(ACamp);
  reset(APed);
  read(ACamp, RC);
  read(APed, RP);
  writeln('Pedidos no completamente satisfechos:');
  writeln('Articulo  Talle  Color  Adeudada');
  while (not eof(ACamp)) or (not eof(APed)) do
  begin
    if (RC.Articulo = RP.Articulo) and (RC.Talle = RP.Talle) and (RC.Color = RP.Color) then
    begin
      if RC.Cantidad >= RP.Cantidad then
      begin
        { Se puede entregar todo }
        RC.Cantidad := RC.Cantidad - RP.Cantidad;
      end
      else
      begin
        { No hay suficiente stock }
        Adeudada := RP.Cantidad - RC.Cantidad;
        writeln(RC.Articulo:8, RC.Talle:6, RC.Color:7, Adeudada:10);
        RC.Cantidad := 0;
      end;
      { Sobrescribo el registro actualizado }
      seek(ACamp, filepos(ACamp) - 1);
      write(ACamp, RC);
      { Avanzo en ambos archivos }
      read(ACamp, RC);
      read(APed, RP);
    end
    else if (RC.Articulo < RP.Articulo) or
            ((RC.Articulo = RP.Articulo) and (RC.Talle < RP.Talle)) or
            ((RC.Articulo = RP.Articulo) and (RC.Talle = RP.Talle) and (RC.Color < RP.Color)) then
      read(ACamp, RC)
    else
      read(APed, RP);
  end;
  close(ACamp);
  close(APed);
end;
{-----------------------------------------------------------}
procedure MostrarStock(var ACamp: TArchCamp);
var
  RC: RCampera;
begin
  reset(ACamp);
  writeln;
  writeln('STOCK ACTUALIZADO');
  writeln('Articulo  Talle  Color  Cantidad');
  writeln('--------------------------------');
  while not eof(ACamp) do
  begin
    read(ACamp, RC);
    writeln(RC.Articulo:8, RC.Talle:6, RC.Color:7, RC.Cantidad:10);
  end;
  close(ACamp);
end;
{-----------------------------------------------------------}
var
  ACamp: TArchCamp;
  APed: TArchPed;
begin
  assign(ACamp, 'CAMPERAS.DAT');
  assign(APed, 'PEDIDOS.DAT');
  ActualizarStock(ACamp, APed);
  MostrarStock(ACamp);
  readln;
end.

