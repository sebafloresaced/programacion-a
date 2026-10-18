program ej6;
type
  TM = array[1..10,1..10] of byte;
procedure GenerarCuadrado(var Matriz:TM;N:byte);
var
  i,fila,columna:byte;
begin
  fila:=1; columna:= (N div 2)+1;
  Matriz[1,columna]:=1;
  for i:=2 to N*N do
    begin
      if i mod N <> 1 then
        begin
          fila:=fila-1;
          if fila=0 then
            fila:=N;
          if columna=N then
            columna:=1
          else
            columna:=columna+1;
        end
      else
        fila:=fila+1;
      Matriz[fila,columna]:=i;
    end;
end;
procedure MostrarMatriz(Matriz:TM;N:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
    begin
      for j:=1 to N do
        write(Matriz[i,j]:4);
      writeln;
    end;
end;
function VerificarCuadrado(Matriz:TM;N:byte):boolean;
var
  Verificar:boolean;
  i,j:byte;
  sumaInc,suma:word;
begin
  suma:=0; sumaInc:=0; verificar:=true;
  for i:=1 to N do    {tomo como suma inicial la suma de la primer columna}
    sumaInc:=sumaInc+Matriz[i,1];
  for i:=2 to N do
    begin
      suma:=0;
      for j:=1 to N do
        suma:=suma+Matriz[i,j];  {verifico sumas de filas}
      if suma<>SumaInc then
        verificar:=false;
    end;
  for j:=1 to N do
    begin
      suma:=0;
      for i:=1 to N do
        suma:=suma+matriz[i,j];  {verifico sumas de columnas}
      if suma<>SumaInc then
        verificar:=false;
    end;
  suma:=0;
  for i:=1 to N do  {verifico diag ppal}
    suma:=suma+Matriz[i,i];
  if suma<>SumaInc then
    verificar:=false;
  suma:=0;
  for i:=1 to N do  {verifico diag sec}
    suma:=suma+Matriz[i, N-i+1];
  if suma<>SumaInc then
    verificar:=false;
  VerificarCuadrado:=verificar;
end;
var
  matriz:TM;
  N:byte;
begin
   writeln('Ingresa N'); readln(n);
   GenerarCuadrado(matriz,n);
   mostrarMatriz(matriz,n);
   readln();
end.

