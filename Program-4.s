// Programa: Multiplicación de dos números
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/TYHoWIZMSUwHNVl4zjg1pK3LM

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        long num1 = 12;
        long num2 = 5;
        long result = num1 * num2;
        
        Console.Write("Result of multiplication: ");
        Console.WriteLine(result);
    }
}
*/

// Programa en Ensamblador
.global _start

.section .data
num1:    .quad 12         // Primer número
num2:    .quad 5          // Segundo número
result:  .quad 0          // Almacenar resultado

.section .text
_start:
    // Cargar num1 en X0
    adr     x3, num1
    ldr     x0, [x3]
    
    // Cargar num2 en X1
    adr     x3, num2
    ldr     x1, [x3]
    
    // Multiplicar X0 por X1 y almacenar en X2
    mul     x2, x0, x1
    
    // Guardar el resultado
    adr     x3, result
    str     x2, [x3]
    
    // Salir del programa
    mov     x0, #0
    mov     x8, #93
    svc     #0
