// Programa: Convertir temperatura de Celsius a Fahrenheit
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/xrPUraEziNc5Mg1mLbfM5aTd8

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int celsius = 25;  // Valor a convertir

        // Convertir Celsius a Fahrenheit
        int fahrenheit = (celsius * 9 / 5) + 32;

        // Imprimir el resultado
        Console.WriteLine("Temperatura en Celsius: " + celsius + "°C");
        Console.WriteLine("Temperatura en Fahrenheit: " + fahrenheit + "°F");
    }
}
*/

// Programa en Ensamblador
.global _start

.text
_start:
    // x0 = Temperatura en Celsius
    // Fórmula: °F = (°C × 9/5) + 32
    
    // Multiplicar por 9
    mov x1, #9
    mul x0, x0, x1
    
    // Dividir por 5
    mov x1, #5
    udiv x0, x0, x1
    
    // Sumar 32
    add x0, x0, #32
    
    // El resultado está ahora en x0
    
    // Salir del programa
    mov x8, #93        // syscall exit
    mov x0, #0         // return code 0
    svc #0             // realizar syscall

.data
    celsius: .word 25   // Ejemplo: 25°C
