// Programa: 	Multiplicación de matrices
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/JV3OMa1R91v62cgUMJ4Jr6Ku5

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Definir las matrices 2x2
        int[,] matrix1 = {
            { 1, 2 },
            { 3, 4 }
        };

        int[,] matrix2 = {
            { 5, 6 },
            { 7, 8 }
        };

        int[,] result = new int[2, 2]; // Matriz resultado 2x2

        // Realizar la multiplicación de matrices 2x2
        // c11 = a11 * b11 + a12 * b21
        result[0, 0] = matrix1[0, 0] * matrix2[0, 0] + matrix1[0, 1] * matrix2[1, 0];

        // c12 = a11 * b12 + a12 * b22
        result[0, 1] = matrix1[0, 0] * matrix2[0, 1] + matrix1[0, 1] * matrix2[1, 1];

        // c21 = a21 * b11 + a22 * b21
        result[1, 0] = matrix1[1, 0] * matrix2[0, 0] + matrix1[1, 1] * matrix2[1, 0];

        // c22 = a21 * b12 + a22 * b22
        result[1, 1] = matrix1[1, 0] * matrix2[0, 1] + matrix1[1, 1] * matrix2[1, 1];

        // Imprimir la matriz resultado
        Console.WriteLine("Matriz resultado (multiplicación de matrix1 y matrix2):");
        for (int i = 0; i < 2; i++)
        {
            for (int j = 0; j < 2; j++)
            {
                Console.Write(result[i, j] + " ");
            }
            Console.WriteLine();
        }
    }
}
*/

// Programa en Ensamblador
.section .data
matrix1:    .word 1, 2, 3, 4   // Primera matriz 2x2
matrix2:    .word 5, 6, 7, 8   // Segunda matriz 2x2
result:     .skip 16           // Espacio para la matriz resultado 2x2

.section .text
.global _start

_start:
    // Cargar las direcciones de las matrices
    ldr x0, =matrix1                 // Dirección de la primera matriz
    ldr x1, =matrix2                 // Dirección de la segunda matriz
    ldr x2, =result                  // Dirección de la matriz resultado

    // Realizar la multiplicación de matrices 2x2
    // c11 = a11 * b11 + a12 * b21
    ldr w3, [x0]                     // Cargar a11 (matrix1[0])
    ldr w4, [x1]                     // Cargar b11 (matrix2[0])
    mul w5, w3, w4                   // w5 = a11 * b11

    ldr w3, [x0, #4]                 // Cargar a12 (matrix1[1])
    ldr w4, [x1, #8]                 // Cargar b21 (matrix2[2])
    mul w6, w3, w4                   // w6 = a12 * b21

    add w7, w5, w6                   // c11 = a11 * b11 + a12 * b21
    str w7, [x2]                     // Almacenar c11 en result[0]

    // c12 = a11 * b12 + a12 * b22
    ldr w3, [x0]                     // Cargar a11 (matrix1[0])
    ldr w4, [x1, #4]                 // Cargar b12 (matrix2[1])
    mul w5, w3, w4                   // w5 = a11 * b12

    ldr w3, [x0, #4]                 // Cargar a12 (matrix1[1])
    ldr w4, [x1, #12]                // Cargar b22 (matrix2[3])
    mul w6, w3, w4                   // w6 = a12 * b22

    add w7, w5, w6                   // c12 = a11 * b12 + a12 * b22
    str w7, [x2, #4]                 // Almacenar c12 en result[1]

    // c21 = a21 * b11 + a22 * b21
    ldr w3, [x0, #8]                 // Cargar a21 (matrix1[2])
    ldr w4, [x1]                     // Cargar b11 (matrix2[0])
    mul w5, w3, w4                   // w5 = a21 * b11

    ldr w3, [x0, #12]                // Cargar a22 (matrix1[3])
    ldr w4, [x1, #8]                 // Cargar b21 (matrix2[2])
    mul w6, w3, w4                   // w6 = a22 * b21

    add w7, w5, w6                   // c21 = a21 * b11 + a22 * b21
    str w7, [x2, #8]                 // Almacenar c21 en result[2]

    // c22 = a21 * b12 + a22 * b22
    ldr w3, [x0, #8]                 // Cargar a21 (matrix1[2])
    ldr w4, [x1, #4]                 // Cargar b12 (matrix2[1])
    mul w5, w3, w4                   // w5 = a21 * b12

    ldr w3, [x0, #12]                // Cargar a22 (matrix1[3])
    ldr w4, [x1, #12]                // Cargar b22 (matrix2[3])
    mul w6, w3, w4                   // w6 = a22 * b22

    add w7, w5, w6                   // c22 = a21 * b12 + a22 * b22
    str w7, [x2, #12]                // Almacenar c22 en result[3]

    // Finalizar el programa
    mov x8, #93                      // syscall: exit
    mov x0, #0                       // Código de salida
    svc #0                            // Llamada a la syscall para salir del programa
