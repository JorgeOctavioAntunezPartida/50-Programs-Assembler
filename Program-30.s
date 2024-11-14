// Programa: Máximo Común Divisor (MCD)
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/MwL1ohXhj5RCMuiumQUu4ivUL

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int a = 48;  // Primer número
        int b = 36;  // Segundo número

        int mcd = CalcularMCD(a, b);
        Console.WriteLine("El MCD de {0} y {1} es: {2}", a, b, mcd);
    }

    static int CalcularMCD(int x, int y)
    {
        while (y != 0)
        {
            int resto = x % y;  // Calcular el resto de la división
            x = y;              // Preparar para la siguiente iteración
            y = resto;
        }
        return x;  // El MCD está en x
    }
}
*/

// Programa en Ensamblador
.global _start      // Punto de entrada del programa
.text

_start:
    // Ejemplo: calcular MCD de 48 y 36
    mov x0, #48     // Primer número en x0
    mov x1, #36     // Segundo número en x1

calcular_mcd:
    // Comprobar si el segundo número es 0
    cmp x1, #0
    beq fin         // Si es 0, el resultado está en x0

    // Calcular el resto de la división
    udiv x2, x0, x1 // x2 = x0 / x1
    mul x2, x2, x1  // x2 = x2 * x1
    sub x2, x0, x2  // x2 = x0 - x2 (resto)

    // Preparar para la siguiente iteración
    mov x0, x1      // x0 = x1
    mov x1, x2      // x1 = resto
    
    b calcular_mcd  // Volver al inicio del bucle

fin:
    // x0 contiene el MCD
    mov x8, #93     // Syscall exit
    mov x0, #0      // Código de retorno 0
    svc #0          // Llamada al sistema
