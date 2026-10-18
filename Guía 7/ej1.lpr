program ej1;
type
  TR = record
    dia,mes:byte;
    anio:word;
  end;
function Estacion(fecha:TR):string;
begin
  case fecha.mes of
    1,2: Estacion:= 'Verano';
    4,5: Estacion:= 'Otonio';
    7,8: Estacion:= 'Invierno';
    10,11: Estacion:= 'Primavera';
    3: if fecha.dia<=20 then
          Estacion:= 'Verano'
       else
          Estacion:= 'Otonio';
    6: if fecha.dia<=20 then
          Estacion:= 'Otonio'
       else
          Estacion:= 'Invierno';
    9: if fecha.dia<=20 then
          Estacion:= 'Invierno'
       else
          Estacion:= 'Primavera';
    12: if fecha.dia<=20 then
          Estacion:= 'Primavera'
       else
          Estacion:= 'Verano';
  end;
end;
var
  fecha:TR;
  nombre,Maxestacion:string;
  contV,contO,contI,contP,max:byte;
begin
  contV:=0; contO:=0; contI:=0; contP:=0;
  writeln('Ingresa el nombre del empleado ("." para terminar)'); readln(nombre);
  while nombre<>'.' do
    begin
      writeln('Ingresa la fecha de nacimiento del empleado (dia,mes,anio)');
      with fecha do
        begin
          readln(dia); readln(mes); readln(anio);
        end;
      case estacion(fecha) of
        'Verano': contV:=contV+1;
        'Otonio': contO:=contO+1;
        'Invierno': contI:=contI+1;
        'Primavera': contP:=contP+1;
      end;
      writeln('Ingresa el nombre del empleado ("." para terminar)'); readln(nombre);
    end;
  max := contP;
  Maxestacion := 'Primavera';
  if contV > max then
    begin
      max := contV;
      Maxestacion := 'Verano';
    end;
  if contO > max then
    begin
      max := contO;
      Maxestacion := 'Otoño';
    end;
  if contI > max then
    begin
      max := contI;
      Maxestacion := 'Invierno';
    end;
  writeln('La estacion con mas cumpleanios es ', Maxestacion, ' con ', max, ' cumpleanios.');
  readln;
end.
end.

