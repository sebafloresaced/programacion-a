program ej9;
Type
  TA = array[1..20] of shortint;
procedure LeerNum(var arch:text;var A:TA;var cont:byte);
var
  num1,num2:shortint;
begin
  Assign(Arch,'ej9.txt'); Reset(arch);
  read(arch,num1); cont:=cont+1; A[cont]:=num1;
  while not eof(Arch) do
    begin
      read(arch,num2);
      if num1<num2 then
        begin
         cont:=cont+1;
         A[cont]:=num2;
         num1:=num2;
        end;
    end;
  close(arch);
end;
procedure NuevoArray(A:TA;var B:TA;cont:byte);
var
  i:byte;
begin
  if cont mod 2 = 1 then
     B[(cont div 2)+1]:=A[(cont div 2)+1];
  for i:=1 to (cont div 2) do
      begin
        if A[cont-i+1] mod A[i] <> 0 then
           begin
             B[i]:=0;
             B[cont-i+1]:=0
           end
        else
          begin
             B[i]:=A[i];
             B[cont-i+1]:=A[cont-i+1];
          end;
      end;
end;
procedure MostrarArray(C:TA;cont:byte);
var
  i:byte;
begin
  write('(',C[1]);
  for i:=2 to cont do
     write(', ',C[i]);
  writeln(')');
end;
var
  arch:text;
  A,B:TA;
  cont:byte;
begin
  cont:=0;
  leerNum(arch,A,cont);
  NuevoArray(A,B,cont);
  MostrarArray(A,cont);
  writeln();
  MostrarArray(B,cont);
  readln();
end.

