// Programa: Conversión de hexadecimal a decimal
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/Xx4j0ao3YFohtYXpyzABiAJOx

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int hexNumber = 0xF; // Número hexadecimal a convertir
        int decimalResult = 0; // Resultado decimal
        int multiplier = 1; // Multiplicador (potencia de 16)
        int baseHex = 16; // Base hexadecimal

        while (hexNumber > 0)
        {
            // Obtener el último dígito hexadecimal
            int digit = hexNumber & 0xF; // Máscara para obtener el último dígito

            // Multiplicar el dígito por la potencia de 16
            decimalResult += digit * multiplier;

            // Preparar para la siguiente iteración
            hexNumber >>= 4; // Desplazar para obtener el siguiente dígito
            multiplier *= baseHex; // Incrementar la potencia de 16
        }

        // Mostrar el resultado
        Console.WriteLine("Resultado decimal: " + decimalResult);
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    mov x19, #0xF       // Número hexadecimal a convertir
    mov x20, #0          // Resultado decimal
    mov x21, #1          // Multiplicador (potencia de 16)
    mov x22, #16         // Base hexadecimal
    
convert_loop:
    // Obtener último dígito hexadecimal
    and x23, x19, #0xF   // Máscara para último dígito
    
    // Multiplicar dígito por potencia de 16
    mul x24, x23, x21    // x24 = dígito * 16^posición
    add x20, x20, x24    // Sumar al resultado
    
    // Preparar siguiente iteración
    lsr x19, x19, #4     // Desplazar para siguiente dígito
    mul x21, x21, x22    // Actualizar multiplicador (*16)
    
    // Comprobar si quedan dígitos
    cmp x19, #0
    bne convert_loop

exit:
    mov x0, #0           // Código de salida
    mov x8, #93          // Syscall exit
    svc #0

.section .data
