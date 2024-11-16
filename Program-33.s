// Programa: Suma de elementos en un arreglo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/0DBzqh81NuSKbvCZyg1LqrDAy

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Arreglo de enteros
        long[] array = { 10, 20, 30, 40, 50, 60 };

        // Calcular la suma
        long resultado = SumarElementos(array);

        // Mostrar el resultado
        Console.WriteLine($"La suma total es: {resultado}");
    }

    static long SumarElementos(long[] array)
    {
        long suma = 0;
        int longitud = array.Length;

        for (int i = 0; i < longitud; i++)
        {
            suma += array[i];
        }

        return suma;
    }
}
*/

// Programa en Ensamblador
.global _start
.text

_start:
    // Dirección base del arreglo
    adrp x0, array
    add x0, x0, :lo12:array

    // Longitud del arreglo
    mov x1, #6           // Número de elementos en el arreglo
    mov x2, #0           // Inicializar suma en 0

sumar_elementos:
    // Cargar el siguiente elemento del arreglo
    ldr x3, [x0], #8     // Cargar un elemento de 8 bytes (tipo quadword)

    // Sumar el elemento al total
    add x2, x2, x3

    // Decrementar el contador
    sub x1, x1, #1

    // Si quedan más elementos, repetir
    cbnz x1, sumar_elementos

fin:
    // x2 contiene la suma total
    mov x8, #93           // Syscall exit
    mov x0, x2            // Mover el resultado de la suma a x0 para retorno
    svc #0                // Llamada al sistema

.data
    .align 3
    array: .quad 10, 20, 30, 40, 50, 60   // Arreglo con 6 elementos
