program ej5;
type
  str5 = string[5];
  RAlumno = record
    Matricula: str5;
    NotaMat, NotaFis, NotaQui: byte;
  end;
  RInsc = record
    Matricula: str5;
    QuimicaII, FisicaII: byte;  { 1=inscripto, 0=no }
  end;
  TAlum = file of RAlumno;
  TInsc = file of RInsc;
{------------------------------------------------------}
procedure ListarNoAptos(var AAlum: TAlum; var AInsc: TInsc);
var
  RA: RAlumno;
  RI: RInsc;
begin
  reset(AAlum);
  reset(AInsc);
  read(AAlum, RA);
  read(AInsc, RI);
  writeln('Alumnos que no cumplen los requisitos:');
  writeln;
  while (not eof(AAlum)) and (not eof(AInsc)) do
  begin
    if RA.Matricula = RI.Matricula then
    begin
      { Alumno encontrado en ambos archivos }
      if (RI.FisicaII = 1) and ((RA.NotaMat < 4) or (RA.NotaFis < 4)) then
        writeln('Matricula: ', RA.Matricula, ' - No cumple para Fisica II');
      if (RI.QuimicaII = 1) and (RA.NotaQui < 4) then
        writeln('Matricula: ', RA.Matricula, ' - No cumple para Quimica II');
      { Avanzo en ambos archivos }
      read(AAlum, RA);
      read(AInsc, RI);
    end
    else if RA.Matricula < RI.Matricula then
      read(AAlum, RA)    { Avanza el archivo con matrícula menor }
    else
      read(AInsc, RI);
  end;
  close(AAlum);
  close(AInsc);
end;
{------------------------------------------------------}
var
  AAlum: TAlum;
  AInsc: TInsc;
begin
  assign(AAlum, 'ALUMNOS.DAT');
  assign(AInsc, 'INSCRIPTOS.DAT');
  ListarNoAptos(AAlum, AInsc);
  readln;
end.

