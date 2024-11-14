// Programa: Resta de dos números
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

//asciinema: https://asciinema.org/a/keiZGoNshD1mdyBQdw799Yueh

// Programa en C#
/*
using System;

class Program
{
    static void Main()
    {
        // Definir los dos números
        long num1 = 50;
        long num2 = 30;

        // Restar los números
        long result = num1 - num2;

        // Imprimir el resultado
        Console.Write("Result: ");
        PrintNumber(result);
        Console.WriteLine();
    }

    // Método para imprimir un número
    static void PrintNumber(long number)
    {
        // Convertir el número a string y mostrar en consola
        Console.Write(number.ToString());
    }
}
*/

// Programa en Ensamblador
.global _start           // Hace _start visible para el enlazador

.section .data
num1:    .quad 50        // Primer número
num2:    .quad 30        // Segundo número
result:  .quad 0         // Almacena el resultado

msg:     .ascii "Result: "
msglen = . - msg
newline: .ascii "\n"

.section .text
_start:
    // Cargar num1 en X0
    adr     x3, num1
    ldr     x0, [x3]
    
    // Cargar num2 en X1
    adr     x3, num2
    ldr     x1, [x3]
    
    // Restar X1 de X0 y guardar en X2
    sub     x2, x0, x1
    
    // Guardar el resultado
    adr     x3, result   
    str     x2, [x3]     
    
    // Imprimir "Result: "
    mov     x0, #1              
    adr     x1, msg             
    mov     x2, msglen          
    mov     x8, #64             
    svc     #0                  
    
    // Convertir resultado a ASCII y imprimir
    adr     x3, result          
    ldr     x0, [x3]            
    bl      print_num
    
    // Imprimir nueva línea
    mov     x0, #1              
    adr     x1, newline         
    mov     x2, #1              
    mov     x8, #64             
    svc     #0                  
    
    // Salir del programa
    mov     x0, #0              
    mov     x8, #93             
    svc     #0                  

// Función para imprimir un número
print_num:
    // Guardar el registro de enlace
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    
    // Preparar buffer para conversión a ASCII
    sub     sp, sp, #16
    mov     x1, sp              
    mov     x2, #10             
    
    // Conversión a ASCII
    mov     x4, #0              
convert_loop:
    mov     x3, x0              
    udiv    x0, x3, x2          
    msub    x3, x0, x2, x3      
    add     x3, x3, #'0'        
    strb    w3, [x1, x4]        
    add     x4, x4, #1          
    cbnz    x0, convert_loop    
    
    // Imprimir dígitos en orden inverso
print_loop:
    sub     x4, x4, #1          
    mov     x0, #1              
    add     x1, sp, x4          
    mov     x2, #1              
    mov     x8, #64             
    svc     #0                  
    cbnz    x4, print_loop      
    
    // Restaurar pila y retornar
    add     sp, sp, #16
    ldp     x29, x30, [sp], #16
    ret
