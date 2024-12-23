// Programa: Factorial de un número
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/o2F9nHuoBcaYlzm2GGqjju7Ye

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int n = 5; // Ejemplo de entrada: Calcular el factorial de 5
        long factorial = CalcularFactorial(n);
        Console.WriteLine($"El factorial de {n} es: {factorial}");
    }

    static long CalcularFactorial(int n)
    {
        long resultado = 1;
        for (int i = n; i > 1; i--)
        {
            resultado *= i;
        }
        return resultado;
    }
}
*/

// Programa en Ensamblador
.section .data
.section .text
.global _start

_start:
    mov x0, #5            // Ejemplo de entrada: Calcular el factorial de 5
    mov x1, #1            // Inicializa el resultado en 1 (x1 = 1)

factorial_loop:
    cmp x0, #1            // Compara x0 con 1
    ble end_factorial     // Si x0 <= 1, salta a end_factorial

    mul x1, x1, x0        // Multiplica el resultado actual (x1) por x0
    sub x0, x0, #1        // Decrementa x0 en 1
    b factorial_loop      // Repite el ciclo

end_factorial:
    // Ahora x1 contiene el factorial de x0 inicial

    // Fin del programa (salida)
    mov x8, #93           // Llamada al sistema para salir (exit)
    svc #0
