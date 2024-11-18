// Programa: Detección de desbordamiento en suma
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/0UnY71UwfllYINrT6iXLCpl6p

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Valores de ejemplo
        int num1 = 0x7FFFFFFF; // Primer número (mayor valor positivo para 32 bits)
        int num2 = 1;          // Segundo número

        // Realizar la suma con detección de desbordamiento
        try
        {
            int result = checked(num1 + num2); // Usar 'checked' para detectar desbordamiento
            Console.WriteLine($"Resultado de la suma: {result}");
        }
        catch (OverflowException)
        {
            Console.WriteLine("Desbordamiento detectado.");
        }
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Valores de ejemplo
    mov x0, #0x7FFFFFFF     // Primer número (mayor valor positivo para 32 bits)
    mov x1, #1              // Segundo número
    
    // Realizar suma con detección de desbordamiento
    adds x2, x0, x1         // x2 = x0 + x1, y actualiza las banderas
    bvs overflow_detected   // Si ocurre desbordamiento, saltar a manejo

    // No hay desbordamiento
    mov x3, #0              // Indicador: no hay desbordamiento
    b exit

overflow_detected:
    mov x3, #1              // Indicador: desbordamiento detectado

exit:
    mov x0, x3              // Código de salida: 0 si no hay desbordamiento, 1 si hay
    mov x8, #93             // Syscall: exit
    svc #0
