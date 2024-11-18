// Programa: Calculadora simple (Suma, Resta, Multiplicación, División)
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/6n60UHme5f3n35yHsCZA9u6JC

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Valores de ejemplo
        int number1 = 25; // Primer número
        int number2 = 5;  // Segundo número

        // Suma
        int sum = number1 + number2;
        // Resta
        int difference = number1 - number2;
        // Multiplicación
        int product = number1 * number2;
        // División y resto con manejo de división por cero
        int quotient, remainder;

        if (number2 != 0)
        {
            quotient = number1 / number2;
            remainder = number1 % number2;
        }
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Valores de ejemplo
    mov x19, #25         // Primer número
    mov x20, #5          // Segundo número
    
    // Suma
    add x21, x19, x20    // x21 = x19 + x20
    // Resta
    sub x22, x19, x20    // x22 = x19 - x20
    // Multiplicación
    mul x23, x19, x20    // x23 = x19 * x20
    // División
    udiv x24, x19, x20   // x24 = x19 / x20
    // Obtener resto de división
    msub x25, x24, x20, x19  // x25 = x19 - (x24 * x20)
    // Manejo de división por cero
    cbz x20, division_error
    b exit

division_error:
    mov x24, #-1         // Indicador de error
    mov x25, #-1

exit:
    mov x0, #0
    mov x8, #93
    svc #0

.section .data
