program p2024;
const
  Zonas = 10;
  Horas = 3;
type
  str4 = string[4];
  TV = array[1..Zonas] of str4;
  TM = array[1..Horas,1..Zonas] of real;
  TReg = record
    codigo: str4;
    hora: byte;
  end;
  TVRes = array[1..Zonas*Horas] of TReg;  { Máximo posible: todas las zonas y horas }
procedure InicializarMatriz(var M:TM);   {Inicializa la Matriz de los precios}
var
  i,j:byte;
begin
  for i:=1 to horas do
    for j:=1 to zonas do
      M[i,j]:=0;
end;
function BusquedaZona(V:TV;N:byte;Zona:str4):byte;  {Devuelve el indice del codigo ingresado}
var
  i:byte;
begin
  i:=1;
  while (i<N)and(V[i]<>zona) do
     i:=i+1;
  if V[i]=zona then
    BusquedaZona:= i
  else
    BusquedaZona:= 0;
end;
procedure LeerDatos(var M:TM;var V:TV; var N:byte);   {Carga los datos desde el archivo}
var
  codigo:str4;
  hora,indice:byte;
  precio:real;
  arch:text;
begin
  Assign(arch,'P2024.txt'); reset(arch);
  N:=0;
  while not eof(arch) do
     begin
       readln(arch,codigo,hora,precio);
       indice:=BusquedaZona(v,n,codigo);
       if indice<>0 then
          M[hora,indice]:=precio
       else
          begin
            n:=N+1;
            V[n]:=codigo;
            M[hora,n]:=precio;
          end;
     end;
  close(arch);
end;
function PromedioPrecio(M:TM;col:byte):real;   {Devuelve el precio promedio por cuadra de la zona ingresada}
var
  i,cont:byte;
  suma:real;
  begin
    cont:=0; suma:=0;
    for i:=1 to horas do
       if M[i,col]>0 then
         begin
           cont:=cont+1;
           suma:=suma + M[i,col]
         end;
    PromedioPrecio:=suma/cont;
  end;
function PromedioMinimo(M:TM;V:TV;N:byte):str4;  {Devuelve el Codigo de la zona con el menor precio promedio por cuadra}
var
  j,indice:byte;
  minProm:real;
begin
  indice:=1;
  minProm:=PromedioPrecio(M,indice);
  for j:=2 to N do
     if minProm>PromedioPrecio(M,j) then
       begin
         minProm:=PromedioPrecio(M,j);
         indice:=j;
       end;
  PromedioMinimo:= V[indice];
end;
function PrecioViaje(M:TM;V:TV;N:byte;codigo:str4;hora:byte;kms:real):real; {Devuelve el precio por un determinado viaje}
var
  cantCuadras:real;
begin
  cantCuadras:=kms*10;
  PrecioViaje:=M[hora , BusquedaZona(v,n,codigo)]*cantCuadras;
end;
function Servicio24hs(M:TM;col:byte):boolean;
var
  i:byte;
begin
  i:=1;
  while (i<horas)and(M[i,col]<>0) do
     i:=i+1;
  Servicio24hs:= M[i,col]=0
end;
procedure GenerarVectorMasCaras(M: TM; V: TV; N: byte; var Res: TVRes; var NR: byte);
var
  j, i: byte;
  maxPrecio: real;
begin
  NR := 0;
  for j := 1 to N do
    if Servicio24hs(M, j) then  { Solo zonas con servicio completo }
    begin
      { 1. Buscar el precio máximo de esa zona }
      maxPrecio := M[1, j];
      for i := 2 to Horas do
        if M[i, j] > maxPrecio then
          maxPrecio := M[i, j];

      { 2. Agregar todas las horas que tienen ese precio máximo }
      for i := 1 to Horas do
        if M[i, j] = maxPrecio then
        begin
          NR := NR + 1;
          Res[NR].codigo := V[j];
          Res[NR].hora := i;
        end;
    end;
end;
procedure MostrarVectorMasCaras(Res: TVRes; NR: byte);
var
  i: byte;
begin
  writeln('--- Zonas con sus horas mas caras ---');
  for i := 1 to NR do
    writeln('Zona ', Res[i].codigo, ' - Hora: ', Res[i].hora);
end;
{Programa Principal}
var
  MatPrecios:TM;
  VecZonas:TV;
  N,NR,hora:byte;
  codigo:str4;
  kms:real;
  VecRes:TVRES;
begin
  InicializarMatriz(MatPrecios);
  LeerDatos(MatPrecios,VecZonas,N);
  writeln('La zona con el precio promedio minino es: ',PromedioMinimo(matPrecios,VecZonas,N));
  writeln('Ingresa un codigo de zona, una hora del dia y los kilometros recorridos');
  readln(codigo, hora, kms);
  if BusquedaZona(VecZonas,n,codigo)<>0 then
     if MatPrecios[hora, BusquedaZona(VecZonas,N,codigo)]>0 then
       writeln('El precio a pagar es: ',PrecioViaje(MatPrecios,VecZonas,n,codigo,hora,kms):6:2)
     else
       writeln('No se puede bridar servicio para ese viaje')
  else
    writeln('La zona ingresada no existe');
  writeln;
  GenerarVectorMasCaras(MatPrecios, VecZonas, N, VecRes, NR);
  MostrarVectorMasCaras(VecRes, NR);
  readln;
end.

