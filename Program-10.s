// Programa: Invertir una cadena
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/NWTIeGQfn83T00GYh0pBjmeyN

//Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        string cadenaOriginal = "Jorge"; // Cadena original a invertir
        string cadenaInvertida = InvertirCadena(cadenaOriginal);
    }

    static string InvertirCadena(string cadena)
    {
        char[] caracteres = cadena.ToCharArray();
        Array.Reverse(caracteres); // Invierte el arreglo de caracteres
        return new string(caracteres); // Convierte el arreglo invertido a una cadena
    }
}
*/

// Programa en Ensamblador
.section .data
cadena: .asciz "Jorge"              // Cadena original que queremos invertir

.section .text
    .global _start

_start:
    // Cargar la dirección de la cadena en x0
    ldr x0, =cadena                 // x0 apunta al inicio de la cadena
    mov x1, x0                      // Copia de la dirección de inicio para contar

    // Encontrar la longitud de la cadena
    mov x2, 0                       // Contador de longitud
find_length:
    ldrb w3, [x1], 1                // Cargar byte de la cadena y avanzar
    cbz w3, start_reverse           // Si encontramos el nulo ('\0'), iniciar inversión
    add x2, x2, 1                   // Incrementar contador
    b find_length                   // Repetir hasta encontrar el final

start_reverse:
    sub x2, x2, 1                   // Ajustar longitud para el último carácter (ignorar '\0')
    mov x3, x2                      // Guardar la longitud en x3 como índice final

reverse_loop:
    // Terminar si los índices se cruzan
    cmp x0, x1                      // Comparar el inicio y el final
    bge end_reverse                 // Si se cruzan, fin de la inversión

    // Intercambiar caracteres
    ldrb w4, [x0]                   // Cargar byte del inicio
    ldrb w5, [x1]                   // Cargar byte del final
    strb w4, [x1]                   // Almacenar byte inicial en la posición final
    strb w5, [x0]                   // Almacenar byte final en la posición inicial

    // Mover índices
    add x0, x0, 1                   // Avanzar al siguiente carácter desde el inicio
    sub x1, x1, 1                   // Retroceder al siguiente carácter desde el final
    b reverse_loop                  // Repetir hasta que los índices se crucen

end_reverse:
    // Finalizar el programa
    mov x8, 93                      // Syscall para salir
    mov x0, 0                       // Código de salida
    svc 0
