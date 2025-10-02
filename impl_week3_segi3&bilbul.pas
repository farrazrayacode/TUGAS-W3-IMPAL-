PROGRAM TentukanSegitiga;

USES Crt;

PROCEDURE TentukanDenganBilanganBulat;
VAR
  a, b, c, temp : LongInt;
  sisi1, sisi2, sisiTerpanjang: LongInt;
  kuadrat1, kuadrat2, kuadratTerpanjang: Int64;

BEGIN
  Writeln('===================================================');
  Writeln('|   Menentukan Jenis Segitiga (Bilangan Bulat)    |');
  Writeln('===================================================');
  Write('Masukkan panjang sisi a: '); Readln(a);
  Write('Masukkan panjang sisi b: '); Readln(b);
  Write('Masukkan panjang sisi c: '); Readln(c);
  Writeln;

  sisi1 := a;
  sisi2 := b;
  sisiTerpanjang := c;

  IF sisi1 > sisi2 THEN BEGIN temp := sisi1; sisi1 := sisi2; sisi2 := temp; END;
  IF sisi2 > sisiTerpanjang THEN BEGIN temp := sisi2; sisi2 := sisiTerpanjang; sisiTerpanjang := temp; END;
  IF sisi1 > sisi2 THEN BEGIN temp := sisi1; sisi1 := sisi2; sisi2 := temp; END;

  IF (sisi1 <= 0) THEN
  BEGIN
    Writeln('HASIL: Tidak ada segitiga dapat dibangun (sisi tidak boleh nol atau negatif).');
  END
  ELSE IF (sisi1 + sisi2 <= sisiTerpanjang) THEN
  BEGIN
    Writeln('HASIL: Tidak ada segitiga dapat dibangun (sisi terpanjang >= jumlah dua sisi lainnya).');
  END
  ELSE
  BEGIN
    IF (sisi1 = sisiTerpanjang) THEN
    BEGIN
      Writeln('HASIL: SEGITIGA SAMA SISI (EQUILATERAL)');
    END
    ELSE
    BEGIN
      kuadrat1 := sisi1 * sisi1;
      kuadrat2 := sisi2 * sisi2;
      kuadratTerpanjang := sisiTerpanjang * sisiTerpanjang;

      IF (kuadrat1 + kuadrat2 = kuadratTerpanjang) THEN
      BEGIN
        Writeln('HASIL: SEGITIGA SIKU-SIKU (RIGHT TRIANGLE)');
      END
      ELSE IF (sisi1 = sisi2) OR (sisi2 = sisiTerpanjang) THEN
      BEGIN
        Writeln('HASIL: SEGITIGA SAMA KAKI (ISOSCELES)');
      END
      ELSE
      BEGIN
        Writeln('HASIL: SEGITIGA BEBAS');
      END;
    END;
  END;
END;


PROCEDURE TentukanDenganBilanganPecahan;
CONST
  Epsilon = 0.01;
VAR
  a, b, c, temp : Real;
  sisi1, sisi2, sisiTerpanjang : Real;
  kuadrat1, kuadrat2, kuadratTerpanjang: Real;

BEGIN
  Writeln('===================================================');
  Writeln('|   Menentukan Jenis Segitiga (Bilangan Pecahan)  |');
  Writeln('===================================================');
  Write('Masukkan panjang sisi a: '); Readln(a);
  Write('Masukkan panjang sisi b: '); Readln(b);
  Write('Masukkan panjang sisi c: '); Readln(c);
  Writeln;

  sisi1 := a;
  sisi2 := b;
  sisiTerpanjang := c;

  IF sisi1 > sisi2 THEN BEGIN temp := sisi1; sisi1 := sisi2; sisi2 := temp; END;
  IF sisi2 > sisiTerpanjang THEN BEGIN temp := sisi2; sisi2 := sisiTerpanjang; sisiTerpanjang := temp; END;
  IF sisi1 > sisi2 THEN BEGIN temp := sisi1; sisi1 := sisi2; sisi2 := temp; END;

  IF (sisi1 <= 0) THEN
  BEGIN
    Writeln('HASIL: Tidak ada segitiga dapat dibangun (sisi tidak boleh nol atau negatif).');
  END
  ELSE IF (sisi1 + sisi2 - sisiTerpanjang <= Epsilon) THEN
  BEGIN
     Writeln('HASIL: Tidak ada segitiga dapat dibangun (sisi terpanjang >= jumlah dua sisi lainnya).');
  END
  ELSE
  BEGIN
    IF (Abs(sisi1 - sisiTerpanjang) <= Epsilon) THEN
    BEGIN
      Writeln('HASIL: SEGITIGA SAMA SISI (EQUILATERAL)');
    END
    ELSE
    BEGIN
      kuadrat1 := sisi1 * sisi1;
      kuadrat2 := sisi2 * sisi2;
      kuadratTerpanjang := sisiTerpanjang * sisiTerpanjang;

      IF (Abs((kuadrat1 + kuadrat2) - kuadratTerpanjang) <= Epsilon) THEN
      BEGIN
        Writeln('HASIL: SEGITIGA SIKU-SIKU (RIGHT TRIANGLE)');
      END
      ELSE IF (Abs(sisi1 - sisi2) <= Epsilon) OR (Abs(sisi2 - sisiTerpanjang) <= Epsilon) THEN
      BEGIN
        Writeln('HASIL: SEGITIGA SAMA KAKI (ISOSCELES)');
      END
      ELSE
      BEGIN
        Writeln('HASIL: SEGITIGA BEBAS');
      END;
    END;
  END;
END;


VAR
  pilihan: Char;

BEGIN
  REPEAT
    ClrScr;
    Writeln('=========================================');
    Writeln('|      PROGRAM PENENTU JENIS SEGITIGA     |');
    Writeln('=========================================');
    Writeln('| MENU:                                 |');
    Writeln('| 1. Masukkan Bilangan Bulat            |');
    Writeln('| 2. Masukkan Bilangan Pecahan (Desimal)|');
    Writeln('| 3. Keluar                             |');
    Writeln('=========================================');
    Write('Pilih [1..3]: ');
    pilihan := ReadKey;
    Writeln(pilihan);
    Writeln;

    CASE pilihan OF
      '1': BEGIN
             TentukanDenganBilanganBulat;
             Writeln;
             Writeln('Tekan tombol apa saja untuk kembali ke menu...');
             ReadKey;
           END;
      '2': BEGIN
             TentukanDenganBilanganPecahan;
             Writeln;
             Writeln('Tekan tombol apa saja untuk kembali ke menu...');
             ReadKey;
           END;
      '3': Writeln('Terima kasih telah menggunakan program ini.');
    ELSE
      Writeln('Pilihan tidak valid. Silakan coba lagi.');
      ReadKey;
    END;

  UNTIL pilihan = '3';
END.