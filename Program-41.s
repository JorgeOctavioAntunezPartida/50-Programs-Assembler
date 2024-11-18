// Programa: Conversión de decimal a hexadecimal
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/VVM2XksA6mehLrxkCypdLfuCD

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int decimalNumber = 33; // Número decimal a convertir
        char[] buffer = new char[16]; // Espacio para almacenar los dígitos hexadecimales
        int index = buffer.Length; // Índice al final del buffer

        // Conversión de decimal a hexadecimal
        do
        {
            int remainder = decimalNumber % 16; // Resto al dividir entre 16
            decimalNumber /= 16; // Cociente para la próxima iteración

            // Convertimos el resto a carácter hexadecimal
            if (remainder < 10)
                buffer[--index] = (char)(remainder + '0'); // Dígitos '0' a '9'
            else
                buffer[--index] = (char)(remainder - 10 + 'a'); // Letras 'a' a 'f'

        } while (decimalNumber > 0);

        // El resultado hexadecimal se encuentra en el buffer desde 'index' hacia adelante.
        Console.WriteLine("Resultado hexadecimal: 0x" + new string(buffer, index, buffer.Length - index));
    }
}
*/

// Programa en Ensamblador
.section .data
buffer: .space 16          // Espacio para almacenar los dígitos hexadecimales

        .section .text
        .global _start

_start:
        // Número decimal a convertir (por ejemplo, 33)
        mov x0, 33        // Número decimal a convertir
        adr x1, buffer    // Dirección del buffer
        add x2, x1, 16    // Fin del buffer

convert_loop:
        cbz x0, exit      // Si el número es 0, salimos del bucle

        // Dividimos por 16
        mov x3, 16        // Base hexadecimal
        udiv x4, x0, x3   // x4 = x0 / 16
        msub x5, x4, x3, x0 // x5 = x0 - (x4 * x3) (resto)

        // Convertimos el resto a un carácter hexadecimal
        cmp x5, 10        // Comparar el resto con 10
        add x5, x5, '0'   // Convertir a carácter '0'-'9'
        b.lo store_char   // Si es menor que 10, saltar al almacenamiento
        add x5, x5, 'a' - '0' - 10 // Si es mayor o igual a 10, convertir a 'a'-'f'

store_char:
        // Guardamos el dígito en el buffer
        sub x2, x2, 1     // Avanzamos hacia atrás
        strb w5, [x2]

        // Actualizamos el número y seguimos iterando
        mov x0, x4
        b convert_loop

exit:
        mov x8, 93        // syscall: exit
        mov x0, 0         // Código de salida
        svc #0
