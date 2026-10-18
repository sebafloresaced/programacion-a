program ej13;
procedure horaFinal(var horas,minutos:byte;var segundos:word;sTranscurridos:word);
  begin
    segundos:=segundos+sTranscurridos;
    while segundos>=60 do
      begin
        segundos:=segundos-60;
        minutos:=minutos+1;
        if minutos>=60 then
           begin
             minutos:=minutos-60;
             horas:=horas+1;
           end;
        if horas>=24 then
           horas:=horas-24;
      end;
  end;
var
  horas,minutos:byte;
  sTranscurridos,segundos:word;
begin
  writeln('Ingresa la hora inicial (en el orden: horas, minutos, segundos)');
  repeat
    readln(horas);
    if horas>=24 then
       writeln('Las horas deben ser menores a 24');
  until horas<24;
  repeat
    readln(minutos);
    if minutos>=60 then
       writeln('Los minutos deben ser menores a 60');
  until minutos<60;
  repeat
    readln(segundos);
    if segundos>=60 then
       writeln('Los segundos deben ser menores a 60');
  until segundos<60;
  writeln('Cuantos segundos pasaron?'); readln(sTranscurridos);
  horaFinal(horas,minutos,segundos,sTranscurridos);
  writeln('La hora final es ',horas,':',minutos,':',segundos);
  readln();
end.

