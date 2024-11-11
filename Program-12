// Programa: Encontrar el máximo en un arreglo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/ZhIhPzq7LVVjuVNb3FxliF1mO

//Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int[] array = { 3, 9, 5, 12, 7, 15, 2 }; // Ejemplo de arreglo de enteros
        int length = array.Length;

        int max = FindMax(array, length);

        Console.WriteLine("El valor máximo es: " + max);
    }

    static int FindMax(int[] arr, int len)
    {
        int max = arr[0]; // Iniciar con el primer valor del arreglo como el máximo

        for (int i = 1; i < len; i++) // Empezar desde el segundo elemento
        {
            if (arr[i] > max)         // Comparar el valor actual con el máximo
            {
                max = arr[i];         // Actualizar el máximo si se encuentra un valor mayor
            }
        }

        return max; // Retornar el valor máximo encontrado
    }
}
*/

// Programa en Ensamblador
.section .data
array:      .word 3, 9, 5, 12, 7, 15, 2     // Ejemplo de arreglo de enteros
len:        .quad 7                         // Longitud del arreglo

.section .text
.global _start

_start:
    // Cargar la dirección del arreglo y su longitud
    ldr x0, =array                   // x0 apunta al inicio del arreglo
    ldr x1, =len                     // x1 guarda la longitud del arreglo
    ldr x1, [x1]                     // Obtener el valor de la longitud

    // Cargar el primer valor del arreglo como el valor máximo inicial
    ldr w2, [x0]                     // w2 guarda el valor máximo encontrado
    add x3, x0, #4                   // x3 es el índice del siguiente elemento

find_max:
    // Comprobar si hemos alcanzado el final del arreglo
    subs x1, x1, #1                  // Reducir longitud en 1
    beq store_max                    // Si x1 es cero, hemos terminado

    // Cargar el siguiente elemento y compararlo con el valor máximo actual
    ldr w4, [x3], #4                 // Cargar siguiente valor y avanzar puntero
    cmp w4, w2                       // Comparar con el valor máximo actual
    csel w2, w4, w2, gt              // Si w4 es mayor, actualizar w2

    b find_max                       // Repetir el bucle

store_max:
    mov x5, x2                       // Guardar el valor máximo encontrado en x5

exit_program:
    mov x8, #93                      // syscall: exit
    mov x0, #0                       // Código de salida
    svc #0
