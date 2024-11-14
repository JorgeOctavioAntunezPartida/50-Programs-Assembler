// Programa: Verificar si un número es primo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/i3dew2aMku5EFlE1X5Udt9RtX

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        int numero = 17; // Ejemplo de entrada: Número a verificar
        bool esPrimo = EsPrimo(numero);
        Console.WriteLine($"¿El número {numero} es primo? {esPrimo}");
    }

    static bool EsPrimo(int numero)
    {
        if (numero <= 1) return false; // Los números menores o iguales a 1 no son primos
        if (numero <= 3) return true;  // 2 y 3 son primos

        for (int i = 2; i * i <= numero; i++)
        {
            if (numero % i == 0)
            {
                return false; // Si es divisible por i, no es primo
            }
        }
        
        return true; // Si no es divisible por ningún i, es primo
    }
}
*/

// Programa en Ensamblador

.section .data
.section .text
.global _start

_start:
    mov x0, #17            // Ejemplo de entrada: Número a verificar (17)
    mov x1, #1             // Inicializa x1 como 1 (asumiendo que el número es primo)
    mov x2, #2             // Divisor inicial (comienza en 2)

check_prime:
    // Si x2 * x2 > x0, terminamos la verificación
    mul x3, x2, x2         // x3 = x2 * x2
    cmp x3, x0             // Compara x3 con x0
    bgt end_check          // Si x3 > x0, salta al final (es primo)

    // Verifica si x0 es divisible por x2
    mov x4, x0             // Copia x0 a x4
    udiv x4, x0, x2        // x4 = x0 / x2
    msub x4, x4, x2, x0    // x4 = x0 - (x4 * x2) (resto de la división)
    cbz x4, not_prime      // Si x4 es cero, x0 es divisible por x2 (no es primo)

    // Incrementa el divisor y repite
    add x2, x2, #1         // Incrementa el divisor x2 en 1
    b check_prime          // Repite el ciclo

not_prime:
    mov x1, #0             // Si encontramos un divisor, el número no es primo

end_check:
    // Fin del programa
    mov x8, #93            // Llamada al sistema para salir (exit)
    svc #0 
