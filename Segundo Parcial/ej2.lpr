program ej2;
type
  str20 = string[20];
  RT = record
     NumTarj: word;
     Nombre: str20;
     Tope, GastoMes: real;
  end;
  RR = record
     NumTarj, CodOperacion: word;
     Monto: real;
  end;
  TAT = file of RT;   { TARJETAS.DAT }
  TAR = file of RR;   { RECHAZADOS.DAT }
  TV  = array[0..100] of word;  { tabla con los números de tarjeta }
function BuscarTarjeta(V: TV; NumTarjeta: word; N: byte): byte;
var
  i: byte;
begin
  i := 0;
  while (i < N) and (V[i] <> NumTarjeta) do
    i := i + 1;
  if (i < N) and (V[i] = NumTarjeta) then
    BuscarTarjeta := i
  else
    BuscarTarjeta := 255;  { valor inválido si no se encuentra }
end;
procedure RegistrarNumeros(var V: TV; var ArchT: TAT; var N: byte);
var
  regT: RT;
begin
  N := 0;
  reset(ArchT);
  while not eof(ArchT) do
  begin
    read(ArchT, regT);
    V[N] := regT.NumTarj;
    N := N + 1;
  end;
  close(ArchT);
end;
procedure ProcesarCompras(var ArchT: TAT; var ArchR: TAR; V: TV; N: byte);
var
  NumTarj, CodOp: word;
  Monto: real;
  regT: RT;
  regR: RR;
  pos: byte;
begin
  reset(ArchT);
  rewrite(ArchR);   { crea o sobreescribe RECHAZADOS.DAT }
  writeln('Ingrese número de tarjeta (0 para finalizar): ');
  readln(NumTarj);
  while NumTarj <> 0 do
  begin
    writeln('Ingrese código de operación: '); readln(CodOp);
    writeln('Ingrese monto de la compra: '); readln(Monto);
    pos := BuscarTarjeta(V, NumTarj, N);
    if pos <> 255 then
    begin
      { Acceso directo al archivo de tarjetas }
      seek(ArchT, pos);
      read(ArchT, regT);

      if regT.GastoMes + Monto <= regT.Tope then
      begin
        regT.GastoMes := regT.GastoMes + Monto;
        seek(ArchT, filepos(ArchT) - 1);  { vuelvo una posición atrás }
        write(ArchT, regT);
        writeln('Compra registrada correctamente.');
      end
      else
      begin
        regR.NumTarj := NumTarj;
        regR.CodOperacion := CodOp;
        regR.Monto := Monto;
        write(ArchR, regR);
        writeln('Compra rechazada (supera el tope).');
      end;
    end;
    writeln;
    writeln('Ingrese número de tarjeta (0 para finalizar): ');
    readln(NumTarj);
  end;
  close(ArchT);
  close(ArchR);
end;
var
  ArchT: TAT;
  ArchR: TAR;
  V: TV;
  N: byte;
begin
  assign(ArchT, 'TARJETAS.DAT');
  assign(ArchR, 'RECHAZADOS.DAT');
  RegistrarNumeros(V, ArchT, N);       { cargar la tabla con los números de tarjeta }
  ProcesarCompras(ArchT, ArchR, V, N); { leer compras y actualizar o rechazar }
  readln;
end.

