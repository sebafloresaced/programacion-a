program ej5;
const
  MaxElem = 20;
type
  TR = record
    fila,columna:byte;
    valor:integer;
  end;
  TV = array[1..MaxElem] of TR;
procedure CargarDatos(var Elementos:TV;var cantElem:byte;N,M:byte);
var
  f,c:byte;
  val:integer;
begin
  cantElem:=0;
  writeln('Ingresa fila, columna y valor (valor=0 para terminar)');
  readln(f,c,val);
  while val<>0 do
    begin
      cantElem:=cantElem+1;
      with Elementos[cantElem] do
         begin
           fila:= f;
           columna:=c;
           valor:=val;
         end;
      writeln('Ingresa fila, columna y valor (valor=0 para terminar)');
      readln(f,c,val);
    end;
end;
procedure MostrarMatriz(elementos:tv;cantElem,N,M:byte);
var
  i,j,k:byte;
begin
  for i:=1 to N do
    begin
      for j:=1 to M do
        begin
          k:=1;
          while (k<cantElem)and((elementos[k].fila <> i) or (elementos[k].columna <> j)) do
            k:=k+1;
          if (elementos[k].fila=i)and(elementos[k].columna=j) then
            write(elementos[k].valor:4)
          else
            write(0:4);
        end;
      writeln;
    end;
end;
procedure Cuadrada(var elementos:tv;cantelem:byte);
var
  aux:TV;
  i:byte;
begin
  aux:=elementos;
  for i:=1 to cantElem do
    begin
      Elementos[i].fila:=aux[i].columna;
      Elementos[i].columna:=aux[i].fila;
    end;
end;
var
  elementos:tv;
  cantElem,N,M:byte;
begin
  writeln('Ingresa N y M'); readln(N,M);
  cargarDatos(elementos,cantElem,N,M);
  writeln;
  mostrarMatriz(elementos,cantelem,n,m);
  writeln;
  if N=M then
    begin
      writeln('Traspuesta:');
      cuadrada(elementos,cantelem);
      mostrarmatriz(elementos,cantelem,n,m);
    end;
  readln;
end.

