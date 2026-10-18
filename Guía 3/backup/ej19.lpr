program ej19;
var
  arch:text;
  max, num:shortint;
  primerIntervalo:boolean;
begin
  assign(arch,'ej19.txt'); reset(arch);
  primerIntervalo:=false;
  while not eof(arch) do
    begin
       max:=0;
       read(arch,num);
       if num<0 then
         primerIntervalo:=true;
       if primerIntervalo then
         if num>=0 then
         begin
           while num>=0 do
           begin
             if max<num then
               max:=num;
             read(arch,num);
           end;
         writeln(max);
         end
    end;
  close(arch);
  readln;
end

