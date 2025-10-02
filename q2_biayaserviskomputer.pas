{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program BiayaServisKomputer;
uses crt;

var
  jumlahKomputer, peripherals: integer;
  waktuServis: string;
  dropOff: char;
  baseFee, tambahanFee, totalFee: real;

begin
  clrscr;
  write('Berapa Komputer yang perlu diservis? : '); readln(jumlahKomputer);
  write('Berapa jumlah peripherals? : '); readln(peripherals);
  write('Kapan waktu service? (business/nonbusiness): '); readln(waktuServis);
  write('Bisakah drop-off dan pickup sendiri? (y/n): '); readln(dropOff);

  { Determine base fee and additional fee }
  if (jumlahKomputer = 1) or (jumlahKomputer = 2) then
  begin
    baseFee := 50;
    tambahanFee := 0;
  end
  else if (jumlahKomputer >= 3) and (jumlahKomputer <= 10) then
  begin
    baseFee := 100;
    tambahanFee := peripherals * 10;
  end
  else
  begin
    baseFee := 500;
    tambahanFee := peripherals * 10;
  end;

  { Business hours check }
  if (waktuServis <> 'business') then
    baseFee := baseFee * 2;

  { Drop-off discount }
  if (dropOff = 'y') or (dropOff = 'Y') then
    baseFee := baseFee / 2;

  totalFee := baseFee + tambahanFee;

  writeln('Total harga servis: $', totalFee:0:2);
end.
