// Programa: Leer entrada desde el teclado
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/wX7N848ovvAyI9Zg05jEJn2Kx

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Solicitar al usuario que ingrese una cadena
        Console.Write("Ingrese texto: ");
        
        // Leer la entrada del teclado (hasta que se presione Enter)
        string input = Console.ReadLine();
        
        // Mostrar el texto ingresado
        Console.WriteLine("Usted ingresó: " + input);
    }
}
*/

// Programa en Ensamblador
.global _start

.section .text
_start:
    // Crear un búfer para almacenar la entrada (tamaño de 128 bytes)
    mov x1, 128          // Tamaño del búfer
    sub sp, sp, x1       // Reservar espacio en la pila para el búfer
    mov x0, 0            // Descriptor de archivo para entrada estándar (stdin)
    
    // Llamada al sistema sys_read (número 0)
    mov x2, sp           // Dirección del búfer
    mov x8, 0            // Número de syscall: sys_read
    svc 0                // Realizar la llamada al sistema

    // Imprimir el texto recibido
    // Usar sys_write (número 1)
    mov x0, 1            // Descriptor de archivo para salida estándar (stdout)
    mov x1, sp           // Dirección del búfer
    mov x2, 128          // Tamaño del búfer (en bytes)
    mov x8, 64           // Número de syscall: sys_write
    svc 0                // Realizar la llamada al sistema

    // Terminar el programa
    mov x8, 93           // Número de syscall: exit
    mov x0, 0            // Código de salida
    svc 0                // Realizar la llamada al sistema
