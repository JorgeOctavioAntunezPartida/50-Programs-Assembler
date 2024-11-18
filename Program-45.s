// Programa: Verificar si un número es Armstrong
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/6Dyy92pp0tGQWfagLfXKB2kJu

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int number = 89; // Número a verificar
        int originalNumber = number; // Copia para procesamiento
        int sumOfCubes = 0;

        // Calcular la suma de los cubos de los dígitos
        while (number > 0)
        {
            int digit = number % 10;        // Obtener último dígito
            int cube = digit * digit * digit; // Calcular el cubo del dígito
            sumOfCubes += cube;             // Sumar al total
            number /= 10;                   // Quitar el último dígito
        }

        // Verificar si el número es un número de Armstrong
        if (sumOfCubes == originalNumber)
        {
            Console.WriteLine($"{originalNumber} es un número de Armstrong.");
        }
        else
        {
            Console.WriteLine($"{originalNumber} no es un número de Armstrong.");
        }
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    mov x19, #89         // Número a verificar
    mov x20, x19         // Copia para procesamiento
    mov x21, #0          // Suma de cubos
    
digit_loop:
    // Obtener último dígito
    mov x22, #10
    udiv x23, x20, x22           // x23 = x20 / 10
    msub x24, x23, x22, x20      // x24 = x20 - (x23 * 10) [dígito]
    // Calcular cubo del dígito
    mul x25, x24, x24            // x25 = dígito * dígito
    mul x25, x25, x24            // x25 = x25 * dígito (cubo)
    // Sumar al total
    add x21, x21, x25
    // Preparar siguiente dígito
    mov x20, x23                 // x20 = x20 / 10
    // Continuar si quedan dígitos
    cbnz x20, digit_loop
    // Verificar si es número Armstrong
    cmp x19, x21
    beq is_armstrong
    
not_armstrong:
    mov x0, #1                   // No es Armstrong
    b exit
    
is_armstrong:
    mov x0, #0                   // Es Armstrong

exit:
    mov x8, #93
    svc #0

.section .data
