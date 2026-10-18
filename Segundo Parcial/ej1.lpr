program ej1;
Type
  TRP = record
    CodPaquete:word;
    peso,Monto:real;
    codDestino:byte;
  end;
  str15 = string[15];
  TRD = record
    CodDestino:byte;
    descripcion:str15;
  end;
  TAP = file of TRP;
  TAD = file of TRD;
procedure PesoPromedio(var Arch:TAP;var PesoProm:real);
var
  cont:byte;
  acum:real;
  paquete:TRP;
begin
  cont:=0; acum:=0;
  reset(arch);
  while not eof(arch) do
    begin
      read(arch,paquete);
      cont:=cont+1;
      acum:=acum+paquete.peso;
    end;
  close(arch);
  pesoProm:=acum/cont;
end;
procedure TotalMonto(var Arch:TAP;var TotMonto:real);
var
  paquete:TRP;
begin
  reset(arch);
  totMonto:=0;
  while not eof(arch) do
    begin
      read(arch,paquete);
      totMonto:=totMonto+paquete.monto;
    end;
  close(arch);
end;
procedure Informe(var ArchP:TAP);
var
  paquete:TRP;
  contDestino,contTotal:word;
  i:byte;
begin
  contTotal:=0;
  writeln('Destino  -  Cantidad de Paquetes');
  for i:=1 to 30 do
    begin
      reset(archP); contDestino:=0;
      while not eof(archP) do
        begin
          read(archP,paquete);
          if paquete.codDestino = i then
             begin
               contDestino:=contDestino+1;
               contTotal:=contTotal+1;
             end;
        end;
      writeln(i:8,contDestino);
    end;
  close(archP);
  writeln('Total    ',contTotal);
end;
var
  ArchP:TAP;
  ArchD:TAD;
  TotMonto,PesoProm:real;
begin
  assign(ArchP, 'PAQUETES.DAT');
  assign(ArchD, 'DESTINO.DAT');
  PesoPromedio(ArchP,PesoProm);
  TotalMonto(ArchP,TotMonto);
  writeln('El peso promedio de los paquetes es: ',pesoProm:5:2);
  writeln('El monto total asegurado es: ',TotMonto:6:2);
  Informe(ArchP);
  readln;
end.

