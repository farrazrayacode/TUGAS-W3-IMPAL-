#include <stdio.h>
#include <math.h>

#define EPSILON 0.01  // Toleransi 1%

int is_almost_equal(double x, double y) {
    if (x == 0 && y == 0) return 1;
    return fabs(x-y) / fmax(fabs(x), fabs(y)) <= EPSILON;
}

void sort_desc(double *x, double *y, double *z) {
    double a = *x, b = *y, c = *z, temp;
    // Sorting agar a ≥ b ≥ c
    if (a < b) { temp = a; a = b; b = temp; }
    if (a < c) { temp = a; a = c; c = temp; }
    if (b < c) { temp = b; b = c; c = temp; }
    *x = a; *y = b; *z = c;
}

void diagnose_triangle(double a, double b, double c, int is_int) {
    sort_desc(&a, &b, &c); // a = terbesar, b = tengah, c = terkecil

    printf("Diagnosa Input: %.10g %.10g %.10g\n", a, b, c);
    if ((a <= 0) || (b <= 0) || (c <= 0)) {
        printf("Tidak ada segitiga dapat dibangun (ada sisi ≤ 0).\n");
        return;
    }
    if (a >= b + c) {
        printf("Tidak ada segitiga dapat dibangun (panjang maksimum tidak < jumlah dua sisi lain).\n");
        return;
    }

    // Equilateral
    int equi = is_int ? (a==b && b==c) : (is_almost_equal(a,b) && is_almost_equal(b,c));
    // Isosceles (tapi bukan sama sisi)
    int iso = !equi && (is_int ? (a==b || a==c || b==c) : (is_almost_equal(a,b) || is_almost_equal(a,c) || is_almost_equal(b,c)));
    // Right triangle
    int right = is_int ? (a*a == b*b + c*c) : is_almost_equal(a*a, b*b + c*c);

    // Output 
    printf("Jenis Segitiga:\n");
    if (equi) printf("- SAMA SISI (Equilateral)\n");
    if (iso)  printf("- SAMA KAKI (Isosceles)\n");
    if (right) printf("- SIKU-SIKU (Right Triangle)\n");
    if (!equi && !iso && !right) printf("- BEBAS (Scalene)\n");

    // Detail tambahan (ketelitian selisih ≤ 1%%):
    if (right && equi) printf("Catatan: Segitiga sama sisi tidak mungkin siku-siku!\n");
    if (right && iso) printf("Catatan: Segitiga ini juga merupakan sama kaki siku-siku.\n");
    if (equi) printf("Semua sisi saling sama (atau beda ≤ 1%%).\n");
    if (iso && !equi) printf("Dua sisi saling sama (atau beda ≤ 1%%).\n");
    if (right) printf("Terdapat sudut 90 derajat (atau mendekati).\n");
}

int main() {
    int mode;
    printf("Pilih mode (0=bulat, 1=pecahan): ");
    scanf("%d", &mode);
    if (mode == 0) {
        int a, b, c;
        printf("Input tiga bilangan bulat: ");
        scanf("%d %d %d", &a, &b, &c);
        diagnose_triangle((double)a, (double)b, (double)c, 1);
    } else {
        double a, b, c;
        printf("Input tiga bilangan pecahan: ");
        scanf("%lf %lf %lf", &a, &b, &c);
        diagnose_triangle(a, b, c, 0);
    }
    return 0;
}
