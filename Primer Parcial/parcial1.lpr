program parcial1;
type
  TV = array[1..20] of byte;
procedure Lectura(var cuenta,suma:TV;var n:byte);
  var
    car:char;
    arch:text;
  begin
    assign(arch,'parcial1.txt'); Reset(arch);
    n:=0;
    while not eof(arch) do
      begin
        n:=n+1;
        cuenta[n]:=0; suma[n]:=0;
        read(arch,car);
        while car<>'.' do
          begin
            while (car<>' ')and(car<>',')and(car<>'.') do
              begin
                suma[n]:=suma[n]+1;
                read(arch,car);
              end;
            cuenta[n]:=cuenta[n]+1;
           { if car<>'.' then
             read(arch,car);  }
            while (car=' ')or(car=',') do
              read(arch,car)
          end;
      end;
    close(arch);
  end;
function A(cuenta,suma:TV;N:byte):byte;
var
  maxprom:real;
  indice,i,minpal:byte;
  begin
    maxprom:=suma[1]/cuenta[1]; indice:=1; minpal:=cuenta[1];
    for i:=2 to N do
      if maxprom<=suma[i]/cuenta[i] then
        begin
          if maxprom<suma[i]/cuenta[i] then
            begin
              indice:=i;
              maxprom:=suma[i]/cuenta[i];
              minpal:=cuenta[i];
            end
          else
            if minpal>cuenta[i] then
              begin
                indice:=i;
                minpal:=cuenta[i]
              end;
        end;
   { A:=indice; }
  end;
function B(suma:tv;n,s:byte):byte;
var
  i:byte;
begin
  i:=1;
  while (i<N)and(S mod suma[i]<>0) do
    i:=i+1;
  if S mod suma[i]=0 then
    B:=i
  else
    B:=0;
end;
procedure C(cuenta,suma:TV;n:byte;var ejC:tv;var k:byte;x:byte);
var
  i:byte;
begin
  k:=0;
  for i:=1 to N do
    if x=cuenta[i] then
      begin
        k:=k+1;
        ejC[k]:=suma[i];
      end;
  writeln('Vector generado:');
  for i:=1 to k do
    write(ejc[i],' ');
  writeln();
  writeln('Vector SUMA:');
  for i:=1 to n do
    write(suma[i],' ');
end;
var
  cuenta,suma,ejc:TV;
  n,k,s,x:byte;
begin
  lectura(cuenta,suma,n);
  writeln('Inciso A: ',A(cuenta,suma,n));
  writeln('Ingrese un valor de s para el inciso B'); readln(s);
  writeln('Inciso B: ',B(suma,n,s));
  writeln('Ingrese un valor de x para el inciso C'); readln(x);
  C(cuenta,suma,n,ejc,k,x);
  readln();
end.

