program ej17;
const
  dcto = 0.1;
var
  Nombre,NombreMax:string;
  cantArticulos,MaxArticulosPromo,contSoloPromo,contPromo,i:word;
  Precio,MontoTotal,DctoTotal,MontoFinal:real;
  Promocion:char;
  SoloPromo:boolean;
begin
   maxArticulosPromo:=0; contSoloPromo:=0;
   writeln('Ingresa el nombre del cliente (***** para terminar)'); readln(nombre);
   while nombre<>'*****' do
   begin
     montoTotal:=0; dctoTotal:=0; MontoFinal:=0; SoloPromo:=true; contPromo:=0;
     writeln('Ingresa la cantidad de articulos que compro el cliente'); readln(cantArticulos);
     for i:=1 to cantArticulos do
         begin
           writeln('Ingrese el precio del articulo ',i); readln(precio);
           MontoTotal:= MontoTotal+precio;
           writeln('El articulo ',i ,' esta en promocion? (S/N)'); readln(promocion); promocion:=Upcase(promocion);
           if promocion='S' then
              begin
              dctoTotal:= dctoTotal + precio*dcto;
              precio:= precio - precio*dcto;
              contPromo:=contPromo+1;
              end
           else
               soloPromo:=false;
           MontoFinal:= MontoFinal+precio;
         end;
         if contPromo>MaxArticulosPromo then
            begin
            MaxArticulosPromo:=contPromo; NombreMax:=Nombre;
            end;
         if soloPromo=true then
            contSoloPromo := contSoloPromo+1;
         writeln('El monto total fue: ',MontoTotal:10:2);
         writeln('El descuento total fue: ',DctoTotal:10:2);
         writeln('El monto final fue: ', MontoFinal:10:2);
         writeln('Ingresa el nombre del cliente (***** para terminar)'); readln(nombre);
     end;
     writeln('El cliente con mas compras de articulos en promocion fue: ',NombreMax);
     writeln('La cantidad de clientes que solo compraron articulos en oferta fue: ',contSoloPromo);
     read(nombre);
end.

