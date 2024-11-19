// Programa: Escribir en un archivo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/jZjtUQeO6lppIIlOs6FHmiW59

// Programa en C#
/*
using System;
using System.IO;

class Program
{
    static void Main()
    {
        // Nombre del archivo
        string fileName = "filebyJorge.txt";

        // Datos a escribir
        string data = "Jorge Octavio Antunez Partida 21211910\n";

        // Abrir el archivo con los mismos parámetros que en el código de ensamblador
        // O_WRONLY | O_CREAT | O_TRUNC -> Solo escritura, crear si no existe, truncar si existe
        using (StreamWriter writer = new StreamWriter(fileName, false)) // false para truncar el archivo
        {
            // Escribir los datos en el archivo
            writer.Write(data);
        }
    }
}
*/

// Programa en Ensamblador
.global _start
.section .text

_start:
    // Abrir archivo
    mov x0, #-100             // AT_FDCWD
    adr x1, filename          // Nombre del archivo
    mov x2, #0x241            // O_WRONLY | O_CREAT | O_TRUNC
    mov x3, #0644             // Permisos
    mov x8, #56               // syscall openat
    svc #0
    
    // Guardar file descriptor
    mov x19, x0
    
    // Escribir datos
    mov x0, x19               // File descriptor
    adr x1, data              // Buffer de datos
    mov x2, #44               // Longitud de datos (longitud de la cadena en 'data')
    mov x8, #64               // syscall write
    svc #0
    
    // Cerrar archivo
    mov x0, x19               // File descriptor
    mov x8, #57               // syscall close
    svc #0

exit:
    mov x0, #0
    mov x8, #93               // syscall exit
    svc #0

.section .data
filename:
    .asciz "filebyJorge.txt"       // Nombre del archivo
data:
    .asciz "Jorge Octavio Antunez Partida 21211910\n" // Datos a escribir
