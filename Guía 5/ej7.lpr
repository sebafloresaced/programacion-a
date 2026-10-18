program ej7;
const
  Digitos = 30;
type
  TA = array[1..Digitos] of byte;
function Sumar(n1,n2:TA):TA;
var
  resto,i:byte;
  res:TA;
  begin
    resto:=0;
    for i:=1 to Digitos do
      begin
        res[i]:=N1[i]+N2[i]+resto;
        resto:=0;
        if res[i]>9 then
           begin
             res[i]:=res[i] mod 10;
             resto:=1;
           end;
      end;
    if resto=1 then
       res[Digitos]:=res[Digitos]+10;
    sumar:=res;
  end;
procedure MostrarNum(Suma:TA);
var
  i: integer;
  empezo: boolean;
begin
  empezo := false;
  for i := Digitos downto 1 do
  begin
    if (Suma[i] <> 0) or empezo then
    begin
      write(Suma[i]);
      empezo := true;
    end;
  end;
end;
var
  n1,n2,suma:TA;
  i,num:byte;
  numero:string[digitos];
begin
  writeln('Ingrese el primer numero'); readln(numero);
  for i := 1 to length(numero) do
      begin
           Val(numero[length(numero)-i+1], num);
           n1[i] := num;
      end;
  writeln('Ingrese el segundo numero'); readln(numero);
  for i := 1 to length(numero) do
      begin
           Val(numero[length(numero)-i+1], num);
           n2[i] := num;
      end;
  suma:= Sumar(n1,n2);
  mostrarNum(suma);
  readln();
end.

