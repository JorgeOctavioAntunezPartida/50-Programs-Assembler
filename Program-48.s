// Programa: Medir el tiempo de ejecución de una función
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/h6MTa4ts3NQGcVsHFtbXVo7QM

// Programa en C#
/*
using System;
using System.Diagnostics;

class Program
{
    static void Main()
    {
        // Crear una instancia de Stopwatch para medir el tiempo
        Stopwatch stopwatch = new Stopwatch();

        // Obtener el tiempo inicial
        stopwatch.Start();

        // Llamar a la función que quieres medir
        TestFunction();

        // Detener el cronómetro al finalizar la ejecución
        stopwatch.Stop();

        // Mostrar el tiempo transcurrido en milisegundos
        Console.WriteLine($"Tiempo de ejecución: {stopwatch.ElapsedMilliseconds} ms");
    }

    // Función de ejemplo a medir
    static void TestFunction()
    {
        // Código que deseas medir
        int count = 1000;
        while (count > 0)
        {
            count--; // Decrementar el contador
        }
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Obtener tiempo inicial
    mrs x19, CNTVCT_EL0         // Leer el contador de tiempo inicial

    // Llamar a la función que quieres medir
    bl test_function            // Llamada a la función que deseas medir

    // Obtener tiempo final
    mrs x20, CNTVCT_EL0         // Leer el contador de tiempo final

    // Calcular la diferencia (tiempo transcurrido en ciclos)
    sub x21, x20, x19           // x21 = tiempo transcurrido (x20 - x19)

    // Finalizar el programa
    mov x0, #0                  // Código de salida
    mov x8, #93                 // Syscall exit
    svc #0

// Función de ejemplo a medir
test_function:
    // Código que deseas medir
    mov x22, #1000              // Inicializar contador
test_loop:
    sub x22, x22, #1            // Decrementar el contador
    cbnz x22, test_loop         // Continuar hasta que x22 sea 0
    ret                         // Regresar de la función
