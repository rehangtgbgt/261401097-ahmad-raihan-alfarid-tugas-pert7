program soal3;
uses crt;

type
    // Record untuk menyimpan data setiap mata kuliah
    TMataKuliah = record
        nama : string;
        sks : integer;
        nilai : char;
        skor : real;
    end;

    // Record untuk menyimpan data mahasiswa
    TMahasiswa = record
        nama : string;
        nim : string;
        jumlahMK : integer;
        mk : array[1..20] of TMataKuliah;
        totalSKS : integer;
        totalSkor : real;
        IP : real;
    end;

var
    // Array untuk menyimpan maksimal 100 mahasiswa
    mhs : array[1..100] of TMahasiswa;
    n, i, j : integer;


// Function untuk mengubah nilai huruf menjadi bobot
function Bobot(nilai : char) : real;
begin
    case UpCase(nilai) of
        'A' : Bobot := 4;
        'B' : Bobot := 3;
        'C' : Bobot := 2;
        'D' : Bobot := 1;
        'E' : Bobot := 0;
    else
        Bobot := 0;
    end;
end;


begin
    clrscr;

    write('Jumlah mahasiswa : ');
    readln(n);

    // Perulangan untuk input setiap mahasiswa
    for i := 1 to n do
    begin
        writeln;
        writeln('Data mahasiswa ke-', i);

        write('Nama : ');
        readln(mhs[i].nama);

        write('NIM : ');
        readln(mhs[i].nim);

        write('Jumlah mata kuliah : ');
        readln(mhs[i].jumlahMK);

        // Nilai awal total SKS dan total skor
        mhs[i].totalSKS := 0;
        mhs[i].totalSkor := 0;

        // Input data mata kuliah
        for j := 1 to mhs[i].jumlahMK do
        begin
            writeln;
            writeln('Mata kuliah ke-', j);

            write('Nama MK : ');
            readln(mhs[i].mk[j].nama);

            write('SKS : ');
            readln(mhs[i].mk[j].sks);

            write('Nilai : ');
            readln(mhs[i].mk[j].nilai);

            // Menghitung skor = SKS × bobot nilai
            mhs[i].mk[j].skor :=
                mhs[i].mk[j].sks * Bobot(mhs[i].mk[j].nilai);

            // Menjumlahkan seluruh SKS
            mhs[i].totalSKS :=
                mhs[i].totalSKS + mhs[i].mk[j].sks;

            // Menjumlahkan seluruh skor
            mhs[i].totalSkor :=
                mhs[i].totalSkor + mhs[i].mk[j].skor;
        end;

        // Menghitung IP = total skor ÷ total SKS
        mhs[i].IP :=
            mhs[i].totalSkor / mhs[i].totalSKS;
    end;


    clrscr;
    writeln('===== HASIL STUDI =====');

    // Menampilkan hasil setiap mahasiswa
    for i := 1 to n do
    begin
        writeln;
        writeln('Nama : ', mhs[i].nama);
        writeln('NIM  : ', mhs[i].nim);

        // Menampilkan setiap mata kuliah
        for j := 1 to mhs[i].jumlahMK do
        begin
            writeln(
                mhs[i].mk[j].nama,
                ' | SKS: ', mhs[i].mk[j].sks,
                ' | Nilai: ', mhs[i].mk[j].nilai,
                ' | Skor: ', mhs[i].mk[j].skor:0:2
            );
        end;

        writeln('Total SKS : ', mhs[i].totalSKS);
        writeln('IP        : ', mhs[i].IP:0:2);
    end;

    readln;
end.