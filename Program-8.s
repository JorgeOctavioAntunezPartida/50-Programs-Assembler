// Programa: Serie de Fibonacci
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/DJrqGiPlkk48yaA9Zog80XW9L

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int N = 10; // Ejemplo de entrada: Número de términos de Fibonacci a calcular
        FibonacciSerie(N);
    }

    static void FibonacciSerie(int N)
    {
        int a = 0, b = 1;
        
        Console.WriteLine("Serie de Fibonacci:");
        Console.Write($"{a} "); // Imprime el primer término

        for (int i = 1; i < N; i++)
        {
            Console.Write($"{b} "); // Imprime el siguiente término
            int temp = a;
            a = b;
            b = temp + b; // Calcula el próximo número en la serie
        }
        
        Console.WriteLine(); // Salto de línea final
    }
}
*/

// Programa en Ensamblador
.section .data
.section .text
.global _start

_start:
    mov x0, #10             // Ejemplo de entrada: Calcular los primeros 10 términos de Fibonacci
    mov x1, #0              // Primer término de la serie (Fibonacci[0] = 0)
    mov x2, #1              // Segundo término de la serie (Fibonacci[1] = 1)

    // Imprimir el primer término de Fibonacci
    bl print_number         // Llama a la función para imprimir el valor en x1

    // Bucle para calcular la serie de Fibonacci
fibonacci_loop:
    cmp x0, #1              // Compara N con 1
    ble end_fibonacci       // Si N <= 1, salta al final

    // Imprimir el siguiente término de Fibonacci
    mov x3, x1              // Guarda el valor anterior de x1 en x3 (valor temporal)
    add x1, x1, x2          // Calcula el siguiente término: x1 = x1 + x2
    mov x2, x3              // Actualiza x2 con el valor anterior de x1

    // Llama a la función de impresión
    bl print_number

    sub x0, x0, #1          // Decrementa el contador N
    b fibonacci_loop        // Repite el bucle

end_fibonacci:
    // Fin del programa
    mov x8, #93             // Llamada al sistema para salir (exit)
    svc #0                  // Llama al sistema operativo

// Función para imprimir un número (simplificación, imprime el valor en x1)
print_number:
    // Normalmente aquí iría el código para imprimir en consola
    ret
