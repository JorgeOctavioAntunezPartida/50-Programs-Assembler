// Programa: Encontrar prefijo común más largo en cadenas
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/UywKVRV5EidBXlyptKhyb34HV

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Cadenas a comparar
        string string1 = "prefix123";
        string string2 = "prefix456";

        // Contador de caracteres coincidentes
        int matchingCount = 0;

        // Comparar carácter por carácter
        while (matchingCount < string1.Length && matchingCount < string2.Length)
        {
            if (string1[matchingCount] != string2[matchingCount])
            {
                break; // Salir si los caracteres no coinciden
            }
            matchingCount++; // Incrementar contador si coinciden
        }

        // Resultado
        Console.WriteLine($"Número de caracteres coincidentes: {matchingCount}");
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Direcciones de las cadenas
    adr x19, string1
    adr x20, string2
    mov x21, #0          // Contador de caracteres coincidentes
    
compare_loop:
    ldrb w22, [x19, x21] // Cargar byte de primera cadena
    ldrb w23, [x20, x21] // Cargar byte de segunda cadena
    // Verificar fin de cadena
    cbz w22, end_compare
    cbz w23, end_compare
    // Comparar caracteres
    cmp w22, w23
    bne end_compare
    // Incrementar contador y continuar
    add x21, x21, #1
    b compare_loop
    
end_compare:

exit:
    mov x0, #0
    mov x8, #93
    svc #0

.section .data
string1:
    .asciz "prefix123"
string2:
    .asciz "prefix456"
