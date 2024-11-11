// Programa: Búsqueda lineal
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/IzJDgZaXNDhlOglyal6NF1LGd

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
array:      .word 3, 9, 5, 12, 7, 15, 2      // Ejemplo de arreglo de enteros
len:        .quad 7                          // Longitud del arreglo
target:     .word 12                         // Valor a buscar en el arreglo

.section .text
.global _start

_start:
    // Cargar la dirección del arreglo, su longitud y el valor objetivo
    ldr x0, =array                    // x0 apunta al inicio del arreglo
    ldr x1, =len                      // x1 guarda la longitud del arreglo
    ldr x1, [x1]                      // Obtener el valor de la longitud
    ldr w3, =target                   // w3 guarda el valor que estamos buscando
    ldr w3, [x3]                      // Obtener el valor del target

    // Inicializar el índice y el valor de no encontrado (-1)
    mov x4, #0                        // x4 es el índice actual
    mov x5, -1                        // x5 será el índice del valor encontrado o -1 si no se encuentra

search_loop:
    // Comprobar si hemos alcanzado el final del arreglo
    cmp x4, x1                        // Comparar índice actual con longitud
    beq end_search                    // Si x4 == x1, terminamos la búsqueda (no encontrado)

    // Cargar el siguiente elemento y compararlo con el valor buscado
    ldr w2, [x0, x4, lsl #2]          // Cargar elemento en el índice actual
    cmp w2, w3                        // Comparar con el valor objetivo
    beq found                         // Si son iguales, ir a found

    // Incrementar índice y continuar la búsqueda
    add x4, x4, #1                    // Incrementar índice
    b search_loop                     // Repetir el bucle

found:
    mov x5, x4                        // Guardar el índice encontrado en x5

end_search:
    // Salir del programa
    mov x8, #93                       // syscall: exit
    mov x0, #0                        // Código de salida
    svc #0
