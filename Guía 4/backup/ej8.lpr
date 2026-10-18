program ej8;
procedure descuento(tipoCompra:char;dia:byte;monto:real;var dcto:real;var dcto5,dcto10,dcto15:boolean);
begin
  case tipoCompra of
     'O': begin
           if ((dia=10)or(dia=20)or(dia=30))and(monto>300) then
              begin
               dcto:=monto*0.05;
               dcto5:=true
              end
           else
             dcto:=0;
          end;
     'C': begin
           if dia>=15 then
             begin
               dcto:=monto*0.1;
               dcto10:=true
              end
           else
             dcto:=0;
          end;
     'S': begin
           if dia<=14 then
             begin
               dcto:=monto*0.15;
               dcto15:=true
              end
           else
             dcto:=0;
          end;
     else
       dcto:=0;
  end;
end;
var
  arch:text;
  codigo:word;
  tipoCompra:char;
  dia,contBeneficiados:byte;
  monto,dcto,montoTotal,dctoTotal:real;
  dcto5,dcto10,dcto15:boolean;
begin
  assign(arch,'ej8.txt'); reset(arch);
  contBeneficiados:=0;
  while not eof(arch) do
    begin
      montoTotal:=0; dctoTotal:=0; dcto5:=false; dcto10:=false; dcto15:=false;
      readln(arch,codigo);
      readln(arch,tipoCompra); tipocompra:=upcase(tipocompra);
      while tipoCompra<>'F' do
        begin
           readln(arch,dia); readln(arch,monto);
           descuento(tipoCompra,dia,monto,dcto,dcto5,dcto10,dcto15);
           monto:=monto-dcto;
           montoTotal:=montoTotal+monto;
           dctoTotal:=dctoTotal+dcto;
           readln(arch,tipoCompra); tipocompra:=upcase(tipocompra);
        end;
      if (dcto5=false)and(dcto10=false)and(dcto15=false) then
           writeln('El cliente con el codigo ',codigo,' no se beneficio de ningun descuento, y pago un total de $',montoTotal:6:2);
      if (dcto5=true)and(dcto10=true)and(dcto15=true) then
           contBeneficiados:=contBeneficiados+1;
      writeln('El cliente con el codigo ',codigo,' ahorro un total de $',dctoTotal:6:2);
      writeln(); readln(arch);
    end;
  writeln(contBeneficiados,' clientes se beneficiaron de los tres descuentos disponibles');
  close(arch);
  readln();
end.

