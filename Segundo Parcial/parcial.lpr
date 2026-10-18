program parcial;
type
  str4 = string[4];
  str30 = string[30];
  reg = record
  codigo:str4;
  descripcion:str30;
  cantCafe:word;
  end;
  TV = array[1..20] of reg;
  TM = array[1..20,7..12] of word;

procedure InicializarMat(var Mat:TM;N:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
    for j:=7 to 12 do
      Mat[i,j]:=0;
end;

function BuscarCodigo(VP:TV;N:byte;X:str4):byte;
var
  i:byte;
begin
  i:=1;
  while (i<N) and (VP[i].codigo <> X) do
    i:=i+1;
  if V[i].codigo = X then
    BuscarCodigo:=i
  else
    BuscarCodigo:=0;
end;

procedure LeerArchivo(Var Mat:TM;N:byte);
var
  Arch:text;
  cod:str4;
  i,mes:byte;
  ventas:word;
begin
  assign(arch,'ventas.txt'); reset(arch);
  while not eof(arch) do
    begin
      readln(Arch,cod,mes,ventas);
      i:=BuscarCodigo(VP,N,cod);
      if i>0 then
        Mat[i,mes]:=Mat[i,mes] + ventas;
    end;
  close(arch);
end;

function RegistraVentas(Mat:TM;indiceCod:byte):boolean;
var
  j:byte;
begin
  j:=7;
  while (j<12) and (Mat[IndiceCod,j]>0) do
    j:=j+1;
  RegistraVentas:= Mat[IndiceCod,j]>0;
end;

function PromedioVentas(Mat:TM;IndiceCod:byte):real;
var
  j,cont:byte;
  acum:word;
begin
  cont:=0;
  acum:=0;
  for j:=7 to 12 do
    if Mat[indiceCod,j]>0 then
      begin
        cont:=cont+1;
        acum:=acum+Mat[indiceCod,j];
      end;
  PromedioVentas:=acum/cont;
end;

function CafeUtilizado(Mat:TM;IndiceCod:byte;VP:TV):word;
var
  acum:word;
  j:byte;
begin
  acum:=0;
  for j:=7 to 12 do
    acum:=acum+Mat[indiceCod,j];
  CafeUtilizado:= acum * VP[indiceCod].cantCafe;
end;

procedure Informe(Mat:TM;VP:TV;N:byte);
var
  i,j:byte;
  acumCafe,CafeUsado:word;
begin
  acumCafe:=0;
  for i:=1 to N do
    if RegistraVentas(Mat,i) then
      begin
        writeln('Codigo: ',VP[i].codigo);
        writeln('Descripcion: ',VP[i].descripcion);
        writeln('Ventas en promedio por mes: ',PromedioVentas(Mat,i):6:2);
        CafeUsado:=CafeUtilizado(Mat,i,VP);
        writeln('Cafe utilizado: ',CafeUsado/1000,'kg');
        AcumCafe:=AcumCafe+CafeUsado/1000;
      end;
  writeln('Cafe total utilizado: ',acumCafe);
end;

function MesMenosVentas(Mat:TM;N:byte):byte;
var
  i,j,minimo:byte;
  ventas,ventasMinimas:word;
begin
  ventasMinimas:=99999;
  for j:=7 to 12 do
    begin
      ventas:=0;
      for i:=1 to N do
        ventas:=ventas+Mat[i,j];
      if ventas<ventasMinimas then
        begin
          minimo:=j;
          ventasMinimas:=ventas;
        end;
    end;
  MesMenosVentas:=j;
end;

function MesMenosCafe(Mat:TM;N:byte;VP:TV):byte;
var
  i,j,minimo:byte;
  Cafe,CafeMinimo:word;
begin
  CafeMinimo:=99999;
  for j:=7 to 12 do
    begin
      cafe:=0;
      for i:=1 to N do
        cafe:=cafe+Mat[i,j]*VP[i].cantCafe;
      if cafe<CafeMinimo then
        begin
          minimo:=j;
          CafeMinimo:=cafe;
        end;
    end;
  MesMenosCafe:=j;
end;

procedure MasDeXUnidades(Mat:TM;VP:TV;N:byte;X:word);
var
  i,j,cantMostrada:byte;
begin
  cantMostrada:=0;
  while (cantMostrada<2) and (i<N) do
    begin
      i:=i+1;
      j:=7;
      while (j<12) and (Mat[i,j]<=X) do
        j:=j+1;
      if mat[i,j]>X then
        begin
          writeln('El producto con codigo ',VP[i].codigo,' supero las ',X,' unidades vendidas en algun mes');
          cantMostrada:=cantMostrada+1;
        end;
    end;
end;

{Programa Principal}
var
  Mat:TM;
  VP:TV;
  N:byte;
  X:word;
begin
  InicializarMat(Mat,N);
  LeerArchivo(Mat,N);
  Informe(Mat;VP;N);
  if MesMenosCafe(Mat,N,VP) = MesMenosVentas(Mat,N) then'
    writeln('El mes que menos ventas tuvo es el mismo que el mes que menos cafe uso')
  else
    writeln('El mes que menos ventas tuvo no es el mismo que el mes que menos cafe uso');
  writeln('Ingrese X'); readln(x);
  MasDeXUnidades(Mat,VP,N,X);
end.
