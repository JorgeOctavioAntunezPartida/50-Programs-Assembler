// Programa: Encontrar el mínimo en un arreglo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/SJPoW7rC0i08lUCk8uImf1lXI

//Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int[] array = { 2, 5, 7, 9, 12, 15, 20 }; // Ejemplo de arreglo de enteros, ordenado
        int length = array.Length;
        int target = 9; // Valor a buscar en el arreglo

        int index = BinarySearch(array, length, target);

        if (index != -1)
        {
            Console.WriteLine("Valor encontrado en el índice: " + index);
        }
        else
        {
            Console.WriteLine("Valor no encontrado en el arreglo.");
        }
    }

    static int BinarySearch(int[] arr, int len, int target)
    {
        int low = 0;
        int high = len - 1;

        while (low <= high)
        {
            int mid = (low + high) / 2;

            if (arr[mid] == target)
            {
                return mid; // Valor encontrado, retornar índice
            }
            else if (arr[mid] < target)
            {
                low = mid + 1; // Ajustar límite inferior
            }
            else
            {
                high = mid - 1; // Ajustar límite superior
            }
        }

        return -1; // Valor no encontrado, retornar -1
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

    // Cargar el primer valor del arreglo como el valor mínimo inicial
    ldr w2, [x0]                     // w2 guarda el valor mínimo encontrado
    add x3, x0, #4                   // x3 es el índice del siguiente elemento

find_min:
    // Comprobar si hemos alcanzado el final del arreglo
    subs x1, x1, #1                  // Reducir longitud en 1
    beq store_min                    // Si x1 es cero, hemos terminado

    // Cargar el siguiente elemento y compararlo con el valor mínimo actual
    ldr w4, [x3], #4                 // Cargar siguiente valor y avanzar puntero
    cmp w4, w2                       // Comparar con el valor mínimo actual
    csel w2, w4, w2, lt              // Si w4 es menor, actualizar w2

    b find_min                       // Repetir el bucle

store_min:
    mov x5, x2                       // Guardar el valor mínimo encontrado en x5

exit_program:
    mov x8, #93                      // syscall: exit
    mov x0, #0                       // Código de salida
    svc #0
