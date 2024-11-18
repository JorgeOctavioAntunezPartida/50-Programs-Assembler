// Programa: Convertir decimal a binario
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/Eexy151DXw63WfbZDEYby60OL

// Programa en C#
/*
using System;

class DecimalToBinary
{
    static void Main()
    {
        int decimalNumber = 45; // Número decimal a convertir
        string binaryRepresentation = ConvertToBinary(decimalNumber);

        Console.WriteLine($"El número decimal {decimalNumber} en binario es: {binaryRepresentation}");
    }

    static string ConvertToBinary(int number)
    {
        if (number == 0) return "0";

        char[] buffer = new char[32]; // Buffer para almacenar los bits
        int index = 31; // Iniciar desde el último índice
        while (number > 0)
        {
            buffer[index--] = (char)((number & 1) + '0'); // Obtener bit menos significativo y convertir a carácter
            number >>= 1; // Desplazar bits a la derecha
        }

        return new string(buffer, index + 1, 31 - index); // Crear cadena desde los bits válidos
    }
}
*/

// Programa en Ensamblador
.data
    decimal: .word 45            // Número decimal a convertir (por ejemplo, 45)
    buffer: .space 33            // Espacio para almacenar la cadena binaria (32 bits + nulo)
    newline: .asciz "\n"         // Nueva línea

.text
.global _start

_start:
    adrp x0, decimal             // Cargar dirección del número decimal
    add x0, x0, :lo12:decimal
    ldr w1, [x0]                 // Cargar número decimal en w1

    adrp x2, buffer              // Cargar dirección del buffer
    add x2, x2, :lo12:buffer
    add x3, x2, #32              // Apuntar al final del buffer
    mov x4, #0                   // Inicializar el terminador nulo
    strb w4, [x3]                // Escribir terminador nulo

convertir:
    cbz w1, imprimir             // Si el número es 0, pasar a imprimir
    and w4, w1, #1               // Obtener el bit menos significativo
    add x3, x3, #-1              // Retroceder en el buffer
    add w4, w4, #48              // Convertir a carácter ('0' o '1')
    strb w4, [x3]                // Almacenar carácter en el buffer
    lsr w1, w1, #1               // Desplazar el número a la derecha
    b convertir                  // Repetir hasta que el número sea 0

imprimir:
    mov x0, #1                   // File descriptor para stdout
    mov x1, x3                   // Apuntar al inicio de la cadena binaria
    sub x2, x2, x3               // Calcular longitud de la cadena
    add x2, x2, #32
    mov x8, #64                  // Llamada al sistema write
    svc #0

    // Imprimir nueva línea
    adrp x1, newline             // Dirección de la nueva línea
    add x1, x1, :lo12:newline
    mov x2, #1                   // Longitud de la nueva línea
    svc #0

    // Salir
    mov x8, #93                  // Syscall exit
    mov x0, #0                   // Código de retorno
    svc #0
