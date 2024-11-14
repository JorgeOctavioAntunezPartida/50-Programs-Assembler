// Programa: Ordenamiento por selección
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/C4O4gTls9pqOo0KfiEx4D2wa7

//Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int[] array = { 15, 3, 9, 7, 2, 5, 12 }; // Ejemplo de arreglo de enteros desordenado
        int len = array.Length;

        // Bucle del algoritmo de ordenamiento por selección
        for (int i = 0; i < len - 1; i++)
        {
            int minIndex = i;

            // Buscar el índice del elemento mínimo en la parte no ordenada
            for (int j = i + 1; j < len; j++)
            {
                if (array[j] < array[minIndex])
                {
                    minIndex = j;
                }
            }

            // Intercambiar el valor en el índice actual con el valor mínimo encontrado
            if (minIndex != i)
            {
                int temp = array[i];
                array[i] = array[minIndex];
                array[minIndex] = temp;
            }
        }

        // Imprimir el arreglo ordenado
        Console.WriteLine("Arreglo ordenado:");
        foreach (int num in array)
        {
            Console.Write(num + " ");
        }
    }
}
*/

// Programa en Ensamblador
.section .data
array:      .word 15, 3, 9, 7, 2, 5, 12       // Ejemplo de arreglo de enteros desordenado
len:        .quad 7                           // Longitud del arreglo

.section .text
.global _start

_start:
    // Cargar la dirección del arreglo y su longitud
    ldr x0, =array                    // x0 apunta al inicio del arreglo
    ldr x1, =len                      // x1 guarda la longitud del arreglo
    ldr x1, [x1]                      // Obtener el valor de la longitud

    // Bucle del algoritmo de ordenamiento por selección
    mov x2, #0                        // x2 será el índice de la parte ordenada

selection_sort:
    cmp x2, x1                        // Comparar el índice de la parte ordenada con la longitud
    bge exit_program                  // Si el índice supera la longitud, finalizar

    mov x3, x2                        // Inicializamos el índice mínimo como x2
    add x4, x2, #1                    // x4 es el índice de la parte no ordenada (comienza después de x2)

find_minimum:
    cmp x4, x1                        // Si x4 alcanza el final, terminamos la búsqueda
    bge swap_elements
    ldr w5, [x0, x4, lsl #2]          // Cargar el valor en el índice x4
    ldr w6, [x0, x3, lsl #2]          // Cargar el valor en el índice x3
    cmp w5, w6                        // Comparar los elementos
    blt update_minimum                // Si el valor de x4 es menor, actualizar el índice mínimo

next_element:
    add x4, x4, #1                    // Avanzar al siguiente índice
    b find_minimum                    // Continuar la búsqueda del mínimo

update_minimum:
    mov x3, x4                        // Actualizar el índice mínimo

swap_elements:
    // Intercambiar el valor en x2 con el valor mínimo encontrado
    ldr w5, [x0, x2, lsl #2]          // Cargar el valor en el índice x2
    ldr w6, [x0, x3, lsl #2]          // Cargar el valor en el índice mínimo (x3)
    str w6, [x0, x2, lsl #2]          // Almacenar el valor mínimo en el índice x2
    str w5, [x0, x3, lsl #2]          // Almacenar el valor de x2 en el índice mínimo

    add x2, x2, #1                    // Mover el índice de la parte ordenada hacia adelante
    b selection_sort                  // Repetir el proceso

exit_program:
    mov x8, #93                       // syscall: exit
    mov x0, #0                        // Código de salida
    svc #0
