// Programa: Mínimo Común Múltiplo (MCM)
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/vRt4bNRhFNIjmr3TKZ9s0PVEX

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int a = 12; // Primer número
        int b = 18; // Segundo número

        // Guardar los números originales
        int originalA = a;
        int originalB = b;

        // Calcular el MCD
        int mcd = CalcularMCD(a, b);

        // Calcular el MCM
        int mcm = (originalA * originalB) / mcd;
    }

    static int CalcularMCD(int x, int y)
    {
        while (y != 0)
        {
            int resto = x % y;
            x = y;
            y = resto;
        }
        return x;
    }
}
*/

// Programa en Ensamblador
.global _start
.text

_start:
    mov x0, #12         // Primer número en x0
    mov x1, #18         // Segundo número en x1
    
    mov x3, x0          // Guardar primer número
    mov x4, x1          // Guardar segundo número

calcular_mcd:
    cmp x1, #0
    beq calcular_mcm     // Si el segundo número es 0, pasar a calcular MCM

    udiv x2, x0, x1      // x2 = x0 / x1
    msub x2, x2, x1, x0  // x2 = x0 - (x2 * x1), evita usar varias instrucciones

    mov x0, x1           // x0 = x1
    mov x1, x2           // x1 = resto
    
    b calcular_mcd        // Volver al inicio del bucle

calcular_mcm:
    // En este punto, x0 contiene el MCD
    mul x5, x3, x4       // x5 = a × b
    udiv x5, x5, x0      // x5 = (a × b) / MCD

fin:
    mov x8, #93          // Syscall exit
    mov x0, #0           // Código de retorno 0
    svc #0
