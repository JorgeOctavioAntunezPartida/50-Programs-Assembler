// Programa: Convertir binario a decimal
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/bJFjNkd9tBYbZB9Fy3iOGYMGw

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Inicializamos el número binario (ejemplo: 1000 = 8)
        int binaryNumber = 0b1000; // 8 en binario
        int decimalResult = 0;      // Resultado decimal
        int position = 0;           // Contador de posición
        int baseValue = 2;          // Base (binario = 2)

        while (binaryNumber > 0)
        {
            // Obtener el bit menos significativo
            int bit = binaryNumber & 1;

            // Calcular el valor posicional (2^posición)
            int power = 1;
            for (int i = 0; i < position; i++)
            {
                power *= baseValue; // Multiplicamos para obtener 2^posición
            }

            // Multiplicar el bit por su valor posicional y sumarlo al resultado
            decimalResult += bit * power;

            // Preparar siguiente iteración
            binaryNumber >>= 1; // Desplazar número a la derecha
            position++;         // Incrementar posición
        }

        // En este punto, decimalResult contiene el resultado decimal
        Console.WriteLine("El número decimal es: " + decimalResult);
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Inicializamos registros
    mov x19, #0          // x19 = Resultado decimal
    mov x20, #0b1000     // x20 = Número binario a convertir (ejemplo: 1000 = 8)
    mov x21, #0          // x21 = Contador de posición
    mov x22, #2          // x22 = Base (binario = 2)

convert_loop:
    // Obtener el bit menos significativo
    and x23, x20, #1     // x23 = último bit del número
    
    // Calcular el valor posicional (2^posición * bit)
    mov x24, #1          // x24 = 2^posición
    mov x25, x21         // x25 = contador temporal para potencia
power_loop:
    cbz x25, power_done  // Si contador es 0, salir del loop
    mul x24, x24, x22    // x24 = x24 * 2
    sub x25, x25, #1     // Decrementar contador
    b power_loop
power_done:
    
    // Multiplicar bit por su valor posicional
    mul x23, x23, x24    // x23 = bit * 2^posición
    
    // Sumar al resultado
    add x19, x19, x23    // Resultado += valor calculado
    
    // Preparar siguiente iteración
    lsr x20, x20, #1     // Desplazar número a la derecha
    add x21, x21, #1     // Incrementar posición
    
    // Comprobar si quedan bits
    cmp x20, #0          // ¿Quedan bits por procesar?
    bne convert_loop     // Si quedan bits, continuar loop

    // En este punto, x19 contiene el resultado decimal

exit:
    // Salir del programa
    mov x0, #0           // Código de salida 0
    mov x8, #93          // Syscall exit
    svc #0

.section .data
