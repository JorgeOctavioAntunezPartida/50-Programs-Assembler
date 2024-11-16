// Programa: Encontrar el segundo elemento más grande
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/dUw3rMG1Ksx7OdEOGSaCVQGSJ

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Definir el arreglo de 6 elementos
        int[] array = { 12, 45, 23, 67, 34, 89 };

        // Llamar a la función que encuentra el segundo valor más grande
        int secondMax = FindSecondMax(array);

        // Mostrar el segundo valor más grande
        Console.WriteLine("El segundo valor más grande es: " + secondMax);
    }

    static int FindSecondMax(int[] array)
    {
        int firstMax = int.MinValue;  // El primer valor máximo
        int secondMax = int.MinValue; // El segundo valor máximo

        // Recorrer el arreglo
        foreach (int num in array)
        {
            if (num > firstMax)
            {
                secondMax = firstMax;  // El primer valor máximo pasa a ser el segundo
                firstMax = num;        // Actualizar el primer valor máximo
            }
            else if (num > secondMax && num < firstMax)
            {
                secondMax = num;       // Actualizar el segundo valor máximo
            }
        }

        return secondMax;  // Retornar el segundo valor más grande
    }
}
*/

// Programa en Ensamblador
.data
    array: .quad 12, 45, 23, 67, 34, 89   // Arreglo de 6 elementos
    longitud = (. - array) / 8             // Calcular longitud (elementos de 8 bytes)

.text
.global _start

_start:
    // Inicializar registros
    adrp x0, array                      // Cargar dirección base del arreglo
    add x0, x0, :lo12:array             // Sumar el offset de la base

    mov x1, #0                          // Primer valor máximo
    mov x2, #0                          // Segundo valor máximo
    mov x3, longitud                    // Longitud del arreglo (6 elementos)
    mov x4, #0                          // Índice

buscar_maximos:
    // Verificar si hemos procesado todos los elementos
    cmp x4, x3                          // Comparar índice con longitud
    bge fin                             // Si el índice >= longitud, terminar

    // Cargar el siguiente elemento del arreglo
    ldr x5, [x0, x4, LSL #3]            // Cargar elemento en la posición x4 (x4 * 8 bytes)

    // Verificar si el valor actual es mayor que el primer valor máximo
    cmp x5, x1
    ble no_actualizar_max1
    mov x2, x1                          // El anterior valor máximo pasa a ser el segundo valor máximo
    mov x1, x5                          // Actualizar el primer valor máximo
    b siguiente

no_actualizar_max1:
    // Verificar si el valor actual es mayor que el segundo valor máximo
    cmp x5, x2
    ble siguiente
    mov x2, x5                          // Actualizar el segundo valor máximo

siguiente:
    add x4, x4, #1                      // Incrementar el índice
    b buscar_maximos                    // Continuar con el siguiente elemento

fin:
    // Ahora x1 contiene el máximo y x2 contiene el segundo máximo
    // x2 tiene el segundo elemento más grande
    mov x8, #93                         // Syscall exit
    mov x0, #0                          // Código de retorno
    svc #0
