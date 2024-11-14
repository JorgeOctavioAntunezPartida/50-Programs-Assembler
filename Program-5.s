// Programa: División de dos números
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/gzWLehdGuCvg7REhDDALEa71o

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Declaración de variables
        long num1 = 100;    // Primer número (dividendo)
        long num2 = 5;      // Segundo número (divisor)
        long result;        // Almacenar cociente
        long remain;        // Almacenar residuo

        // Realizar la división y obtener el cociente y el residuo
        result = num1 / num2;
        remain = num1 % num2;

        // Imprimir resultados (opcional)
        Console.WriteLine("Cociente: " + result);
        Console.WriteLine("Residuo: " + remain);
    }
}
*/

// Programa en Ensamblador
.global _start

.section .data
num1:    .quad 100        // Primer número (dividendo)
num2:    .quad 5          // Segundo número (divisor)
result:  .quad 0          // Almacenar cociente
remain:  .quad 0          // Almacenar residuo

.section .text
_start:
    // Cargar num1 en X0
    adr     x3, num1
    ldr     x0, [x3]
    
    // Cargar num2 en X1
    adr     x3, num2
    ldr     x1, [x3]
    
    // Dividir X0 entre X1 y almacenar el cociente en X2
    udiv    x2, x0, x1     
    
    // Calcular el residuo y almacenarlo en X4
    msub    x4, x2, x1, x0  
    
    // Almacenar el cociente y el residuo
    adr     x3, result
    str     x2, [x3]        // Almacenar cociente
    adr     x3, remain
    str     x4, [x3]        // Almacenar residuo
    
    // Terminar el programa
    mov     x0, #0          // Código de retorno 0
    mov     x8, #93         // Llamada al sistema sys_exit
    svc     #0
