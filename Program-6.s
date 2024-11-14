// Programa: Suma de los N primeros números naturales
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/1uT2EOe58lbXIzwCzUepRz2bk

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int N = 10; // Ejemplo de entrada: N = 10
        int suma = SumaPrimerosNumeros(N);
        Console.WriteLine($"La suma de los primeros {N} números naturales es: {suma}");
    }

    static int SumaPrimerosNumeros(int N)
    {
        // Fórmula: suma = N * (N + 1) / 2
        return N * (N + 1) / 2;
    }
}
*/

// Programa en Ensamblador
.section .data
.section .text
.global _start

_start:
    mov x0, #10            // Ejemplo de entrada: N = 10

    // Cálculo de la suma de los primeros N números naturales
    // suma = N * (N + 1) / 2

    // Incrementa N en 1
    add x1, x0, #1         // x1 = N + 1

    // Multiplica N * (N + 1)
    mul x1, x0, x1         // x1 = N * (N + 1)

    // Divide el resultado entre 2
    mov x2, #2             // Coloca 2 en el registro x2
    udiv x1, x1, x2        // x1 = (N * (N + 1)) / 2

    // Ahora x1 contiene la suma de los primeros N números naturales

    // Fin del programa (salida)
    mov x8, #93            // Llamada al sistema para salir (exit)
    svc #0
