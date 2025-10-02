#include <stdio.h>
#include <string.h>

#define JUMLAH_AKUN 5

typedef struct {
    char nomorAkun[20];
    char statusKode[10];
    double biayaServis;
} Akun;

int main() {
    Akun daftarAkun[JUMLAH_AKUN] = {
        {"A001", "valid", 150000},
        {"A002", "invalid", 0},
        {"A003", "valid", 250000},
        {"A004", "valid", 100000},
        {"A005", "invalid", 0}
    };

    char inputNomor[20];
    int ditemukan = 0;

    printf("Masukkan Nomor Akun: ");
    scanf("%s", inputNomor);

    for (int i = 0; i < JUMLAH_AKUN; i++) {
        if (strcmp(inputNomor, daftarAkun[i].nomorAkun) == 0) {
            ditemukan = 1;
            if (strcmp(daftarAkun[i].statusKode, "valid") == 0) {
                printf("=== INVOICE ===\n");
                printf("Nomor Akun   : %s\n", daftarAkun[i].nomorAkun);
                printf("Biaya Servis : Rp %.2f\n", daftarAkun[i].biayaServis);
            } else {
                printf("ERROR: Status akun tidak valid.\n");
            }
            break;
        }
    }

    if (!ditemukan) {
        printf("ERROR: Nomor akun tidak ditemukan.\n");
    }

    return 0;
}
