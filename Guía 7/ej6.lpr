program ej6;
const
  MaxElem = 20;
type
  TR = record
    fila,columna:byte;
    valor:integer;
  end;
  TV = array[1..MaxElem] of TR;
procedure CargarDatos(var Matriz:TV;var cantElem:byte;N,M:byte);
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
      with Matriz[cantElem] do
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
procedure SumarMatrices(Matriz1, Matriz2: TV; cantElem1, cantElem2: byte; var Suma: TV; var cantSuma: byte);
var
  i, j: byte;
  encontrado: boolean;
begin
  cantSuma := 0;
  { copiar Matriz1 en C, sumando si coincide con algo en Matriz2 }
  for i := 1 to cantElem1 do
  begin
    encontrado := false;
    for j := 1 to cantElem2 do
      if (matriz1[i].fila = Matriz2[j].fila) and (matriz1[i].columna = Matriz2[j].columna) then
      begin
        cantSuma := cantSuma + 1;
        Suma[cantSuma].fila := matriz1[i].fila;
        Suma[cantSuma].columna := Matriz1[i].columna;
        Suma[cantSuma].valor := Matriz1[i].valor + Matriz2[j].valor;
        encontrado := true;
        break;
      end;
    if not encontrado then
    begin
      cantSuma := cantSuma + 1;
      Suma[cantSuma] := Matriz1[i];
    end;
  end;

  { agregar los elementos de Matriz2 que no estaban en Matriz1 }
  for j := 1 to cantElem2 do
  begin
    encontrado := false;
    for i := 1 to cantElem1 do
      if (Matriz1[i].fila = Matriz2[j].fila) and (Matriz1[i].columna = Matriz2[j].columna) then
      begin
        encontrado := true;
        break;
      end;
    if not encontrado then
    begin
      cantSuma := cantSuma + 1;
      Suma[cantSuma] := Matriz2[j];
    end;
  end;
end;
var
  Matriz1,Matriz2,suma:tv;
  cantElem1,cantElem2,cantsuma,N1,M1,N2,M2:byte;
begin
  writeln('Ingresa N y M de la primer matriz'); readln(N1,M1);
  cargarDatos(Matriz1,cantElem1,N1,M1);
  writeln('Ingresa N y M de la segunda matriz'); readln(N2,M2);
  cargarDatos(Matriz2,cantElem2,N2,M2);
  writeln;
  if N1=N2 then
    begin
      if N1=M1 then
        begin
          cuadrada(matriz1,cantelem1);
          cuadrada(matriz2,cantelem2);
        end;
      writeln('Matriz 1:');
      mostrarMatriz(matriz1,cantelem1,n1,m1);
      writeln; writeln('Matriz 2:');
      mostrarMatriz(matriz2,cantelem2,n2,m2);
      writeln;
      sumarMatrices(matriz1,matriz2,cantelem1,cantelem2,suma,cantsuma);
      writeln('Suma de matrices 1 y 2:');
      mostrarMatriz(suma,cantSuma,n1,m1);
    end
  else
    writeln('La suma no esta definida ya que no son del mismo orden');
  readln;
end.

