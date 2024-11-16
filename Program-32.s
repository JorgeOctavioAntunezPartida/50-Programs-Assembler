// Programa: Potencia (x^n)
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/IaN92rDkImCJrrDmyt1Osp6Ts

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Ejemplo: calcular 2^10
        int baseX = 2;   // Base
        int exponente = 10; // Exponente

        // Calcular la potencia
        int resultado = CalcularPotencia(baseX, exponente);

        // Mostrar el resultado
        Console.WriteLine($"{baseX}^{exponente} = {resultado}");
    }

    static int CalcularPotencia(int x, int n)
    {
        // Casos especiales
        if (n == 0) return 1; // Cualquier número elevado a 0 es 1
        if (n == 1) return x; // Cualquier número elevado a 1 es sí mismo

        int resultado = 1; // Inicializar resultado
        int baseTemporal = x; // Copia de la base

        while (n > 0)
        {
            // Verificar el bit menos significativo de n
            if ((n & 1) == 1)
            {
                resultado *= baseTemporal; // Multiplicar si el bit es 1
            }

            // Cuadrar la base temporal
            baseTemporal *= baseTemporal;

            // Desplazar el exponente a la derecha
            n >>= 1;
        }

        return resultado;
    }
}
*/

// Programa en Ensamblador
.global _start
.text

_start:
    // Ejemplo: calcular 2^10
    mov x0, #2          // Base (x)
    mov x1, #10         // Exponente (n)
    
    // Comprobar casos especiales
    cmp x1, #0          // Verificar si exponente es 0
    beq exponente_cero
    cmp x1, #1          // Verificar si exponente es 1
    beq exponente_uno
    
    // Inicializar
    mov x2, #1          // Resultado = 1
    mov x3, x0          // Base temporal = x
    mov x4, x1          // Copiar exponente para examinar bits

calcular_potencia:
    // Verificar si llegamos al final
    cmp x4, #0
    beq fin
    
    // Verificar el bit menos significativo
    tst x4, #1
    beq no_multiplicar
    
    // Si el bit es 1, multiplicar resultado por base temporal
    mul x2, x2, x3
    
no_multiplicar:
    // Cuadrar la base temporal
    mul x3, x3, x3
    
    // Desplazar exponente a la derecha
    lsr x4, x4, #1
    
    b calcular_potencia

exponente_cero:
    mov x2, #1          // Si exponente es 0, resultado es 1
    b fin

exponente_uno:
    mov x2, x0          // Si exponente es 1, resultado es la base
    b fin

fin:
    // x2 contiene el resultado de x^n
    mov x8, #93         // Syscall exit
    mov x0, x2          // Mover resultado a x0 para retorno
    svc #0
