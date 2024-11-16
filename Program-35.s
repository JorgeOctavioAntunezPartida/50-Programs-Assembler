// Programa: Rotación de un arreglo (izquierda/derecha)
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/icZPZJehFt02s6MhNTqCCW2gG

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Arreglo de enteros
        long[] array = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        int rotaciones = 3; // Número de posiciones a rotar (positivo=izquierda, negativo=derecha)

        // Rotar el arreglo
        RotarArreglo(array, rotaciones);

        // Mostrar el resultado
        Console.WriteLine("Arreglo después de rotar:");
        foreach (var item in array)
        {
            Console.Write(item + " ");
        }
    }

    static void RotarArreglo(long[] array, int rotaciones)
    {
        int longitud = array.Length;

        // Normalizar rotaciones si son negativas o mayores que la longitud
        if (rotaciones < 0)
        {
            rotaciones = (rotaciones + longitud) % longitud;
        }
        else
        {
            rotaciones = rotaciones % longitud;
        }

        // Si no hay rotación, salir
        if (rotaciones == 0) return;

        // Paso 1: Revertir los primeros k elementos
        RevertirSubarray(array, 0, rotaciones - 1);

        // Paso 2: Revertir los elementos restantes
        RevertirSubarray(array, rotaciones, longitud - 1);

        // Paso 3: Revertir todo el arreglo
        RevertirSubarray(array, 0, longitud - 1);
    }

    static void RevertirSubarray(long[] array, int inicio, int fin)
    {
        while (inicio < fin)
        {
            // Intercambiar los elementos
            long temp = array[inicio];
            array[inicio] = array[fin];
            array[fin] = temp;

            // Actualizar índices
            inicio++;
            fin--;
        }
    }
}
*/

// Programa en Ensamblador
.data
    .align 3
    array: .quad 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    longitud = (. - array) / 8   // (elementos de 8 bytes)
    rotaciones = 3               // Número de posiciones a rotar (positivo=izquierda, negativo=derecha)

.text
.global _start

_start:
    // Cargar dirección base del arreglo
    adrp x0, array
    add x0, x0, :lo12:array
    
    // Inicializar registros
    mov x1, longitud
    mov x2, rotaciones

    // Normalizar rotaciones si son negativas o mayores que la longitud
    cmp x2, #0
    bge normalizar_positivo
    
    // Si es negativo, convertir a rotación equivalente a la izquierda
    add x2, x2, x1
    
normalizar_positivo:
    // Asegurar que rotaciones < longitud
    sdiv x3, x2, x1
    msub x2, x3, x1, x2    // x2 = x2 % longitud

    // Si rotaciones es 0, terminar
    cbz x2, fin

rotar_izquierda:
    // Paso 1: Revertir primeros k elementos
    mov x3, #0              // índice inicio
    sub x4, x2, #1          // índice fin
    bl revertir_subarray
    
    // Paso 2: Revertir elementos restantes
    mov x3, x2              // índice inicio
    sub x4, x1, #1          // índice fin
    bl revertir_subarray
    
    // Paso 3: Revertir todo el array
    mov x3, #0              // índice inicio
    sub x4, x1, #1          // índice fin
    bl revertir_subarray
    b fin

// Subrutina para revertir un subarray entre los índices x3 y x4
revertir_subarray:
    // Guardar dirección de retorno
    str x30, [sp, #-16]!
    
revertir_loop:
    // Verificar si hemos terminado
    cmp x3, x4
    bge revertir_fin
    
    // Calcular direcciones
    mov x7, x0
    mov x8, x0
    lsl x5, x3, #3         // x5 = inicio * 8
    lsl x6, x4, #3         // x6 = fin * 8
    add x7, x7, x5         // Dirección elemento inicio
    add x8, x8, x6         // Dirección elemento fin
    
    // Intercambiar elementos
    ldr x5, [x7]           // Cargar elemento inicio
    ldr x6, [x8]           // Cargar elemento fin
    str x6, [x7]           // Guardar fin en inicio
    str x5, [x8]           // Guardar inicio en fin
    
    // Actualizar índices
    add x3, x3, #1
    sub x4, x4, #1
    
    b revertir_loop

revertir_fin:
    // Restaurar dirección de retorno
    ldr x30, [sp], #16
    ret

fin:
    mov x8, #93            // Syscall exit
    mov x0, #0             // Código de retorno
    svc #0
