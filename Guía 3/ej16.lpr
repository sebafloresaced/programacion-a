program ej16;
var
  patente, maxPatente:string[7];
  combConsumido,kmsRecorridos,maxViajes,minKms,N,contViajes,kmsTotales,minComb,i:word;
begin
  writeln('Ingrese la cantidad de vehiculos'); Readln(N);
  maxViajes:= 0; minKms:= 65534; minComb:=0;
  for i:=1 to N do
      begin
        contViajes:=1; kmsTotales:=0;
        writeln('Ingrese la patente del vehiculo nro ',i); readln(patente);
        writeln('Ingrese la cantidad de litros de combustible consumidos del vehiculo nro ',i); readln(combConsumido);
        writeln('Ingrese los kilometros recorridos durante el viaje ', contViajes); readln(kmsRecorridos);
        while kmsRecorridos<>0 do
          begin
            contViajes:=contViajes+1; kmsTotales:=kmsTotales+kmsRecorridos;
            writeln('Ingrese los kilometros recorridos durante el viaje ', contViajes); readln(kmsRecorridos);
          end;
        writeln('El vehiculo nro ', i, ' consumio ', combConsumido/kmsTotales:5:2, 'litros por km');
        if contViajes>maxViajes then
           begin
           maxViajes:=contViajes;
           maxPatente:=Patente;
           end;
        if kmsTotales<minKms then
           begin
           minKms:=kmsTotales;
           minComb:=combConsumido;
           end;
        writeln();
      end;
  writeln('La patente del vehiculo que mas viajes hizo es: ',maxPatente);
  writeln('El total de litros consumidos del vehiculo con menos viajes es: ',minComb);
  readln(n);
end.

