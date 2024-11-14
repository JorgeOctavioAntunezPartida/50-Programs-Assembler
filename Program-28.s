// Programa: Establecer, borrar y alternar bits
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/xWdM3sGlrPRZ0cj5ztb1RYG3Z

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Declaramos el valor inicial como 64 bits (ulong)
        ulong value = 0x12345678;

        // Establecer el bit en la posición 5
        value |= 0x20;

        // Borrar el bit en la posición 4
        value &= ~0x10;

        // Mostrar el resultado
        Console.WriteLine("Resultado: 0x" + value.ToString("X"));
    }
}
*/

// Programa en Ensamblador
.global _start

.section .data
    value: .quad 0x12345678        // Guardamos el valor de ejemplo en memoria

.section .text
_start:
    // Cargar el valor en el registro x0 desde la memoria
    ldr x0, =value                // Cargar la dirección de 'value' en x0
    ldr x0, [x0]                  // Cargar el valor en x0 (0x12345678)

    // Establecer el bit en la posición 5 (contando desde 0, 0 basado)
    // Establecer el bit 5: 0x12345678 OR 0x20
    mov x1, #0x20                 // x1 = 0x20 (esto establece el bit 5)
    orr x0, x0, x1                // x0 = x0 OR x1 (establece el bit 5 en x0)

    // Borrar el bit en la posición 4
    // Borrar el bit 4: 0x12345678 AND ~0x10
    mov x1, #0x10                 // x1 = 0x10 (bit 4)
    neg x1, x1                     // x1 = ~x1 (negación del valor para borrar)
