// Programa: Implementar una pila usando un arreglo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/ah6IukFpVGl51bFPw48tambw5

// Programa en C#
/*
using System;

class Stack
{
    private int[] stack;       // Arreglo que representa la pila
    private int maxSize;       // Tamaño máximo de la pila
    private int top;           // Índice del elemento superior de la pila

    public Stack(int size)
    {
        maxSize = size;
        stack = new int[maxSize];
        top = -1;              // Inicialmente la pila está vacía
    }

    public void Push(int value)
    {
        if (top >= maxSize - 1)
        {
            Console.WriteLine("Error: Pila llena.");
            return;
        }

        stack[++top] = value;   // Incrementar top y agregar valor
    }

    public int Pop()
    {
        if (top < 0)
        {
            Console.WriteLine("Error: Pila vacía.");
            return -1;         // Valor de error
        }

        return stack[top--];    // Devolver el elemento superior y decrementar top
    }

    public bool IsEmpty()
    {
        return top == -1;
    }

    public bool IsFull()
    {
        return top == maxSize - 1;
    }
}

class Program
{
    static void Main(string[] args)
    {
        Stack stack = new Stack(8); // Crear una pila con capacidad para 8 elementos

        // Insertar elementos en la pila
        stack.Push(10);
        stack.Push(20);
        stack.Push(30);

        // Extraer elementos de la pila
        Console.WriteLine($"Elemento extraído: {stack.Pop()}");
        Console.WriteLine($"Elemento extraído: {stack.Pop()}");
    }
}
*/

// Programa en Ensamblador
.data
    stack: .space 64             // Espacio para la pila (8 elementos de 8 bytes)
    max_size: .quad 8            // Tamaño máximo de la pila
    stack_top: .quad -1          // Inicialmente la pila está vacía

.text
.global _start

_start:
    mov x0, #10                  // Valor a insertar
    bl push                      
    mov x0, #20
    bl push                      
    mov x0, #30
    bl push                      

    bl pop                       
    mov x1, x0                   
    bl pop                       
    mov x2, x0                   

    mov x8, #93                  // Syscall exit
    mov x0, #0                   
    svc #0

// Función push
push:
    adrp x1, stack               
    add x1, x1, :lo12:stack      
    adrp x3, stack_top           
    add x3, x3, :lo12:stack_top  
    ldr x2, [x3]                 
    adrp x4, max_size            
    add x4, x4, :lo12:max_size   
    ldr x5, [x4]                 

    add x2, x2, #1               
    cmp x2, x5                   
    bge push_error               

    str x2, [x3]                 
    lsl x2, x2, #3               
    add x1, x1, x2               
    str x0, [x1]                 
    ret                          

push_error:
    mov x0, #1                   
    mov x8, #93                  
    svc #0

// Función pop
pop:
    adrp x1, stack               
    add x1, x1, :lo12:stack      
    adrp x3, stack_top           
    add x3, x3, :lo12:stack_top  
    ldr x2, [x3]                 
    cmp x2, #0                   
    blt pop_error                

    lsl x4, x2, #3               
    add x1, x1, x4               
    ldr x0, [x1]                 
    sub x2, x2, #1               
    str x2, [x3]                 
    ret                          

pop_error:
    mov x0, #2                   
    mov x8, #93                  
    svc #0
