// Programa: Generación de números aleatorios (con semilla)
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/7n487O9TAk7WhixJBoYFTF0mb

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Inicializar generador
        uint seed = 12345;                   // Semilla inicial
        uint multiplier = 1103515245;       // Multiplicador
        uint increment = 12345;             // Incremento
        uint mask = 0x7FFFFFFF;             // Máscara para 31 bits
        int count = 10;                     // Cantidad de números a generar

        // Generar números pseudoaleatorios
        for (int i = 0; i < count; i++)
        {
            // Fórmula: siguiente = (semilla * multiplicador + incremento) & máscara
            seed = (seed * multiplier + increment) & mask;

            // Mostrar el número generado
            Console.WriteLine(seed);
        }
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Inicializar generador
    movz x19, #12345            // Semilla inicial
    movz x20, #16843, lsl #16   // Parte alta del multiplicador (1103515245 dividido)
    movk x20, #5245             // Parte baja del multiplicador
    movz x21, #12345            // Incremento
    mov x22, #10                // Cantidad de números a generar
    
generate_loop:
    // Fórmula: siguiente = (semilla * multiplicador + incremento) & máscara
    mul x19, x19, x20            // x19 = semilla * multiplicador
    add x19, x19, x21            // x19 += incremento
    and x19, x19, #0x7fffffff    // Mantener 31 bits (máscara)
    
    // Preparar siguiente iteración
    sub x22, x22, #1             // Decrementar contador
    cbnz x22, generate_loop      // Continuar si no hemos terminado

exit:
    mov x0, #0
    mov x8, #93
    svc #0

.section .data
