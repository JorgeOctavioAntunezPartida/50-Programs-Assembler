// Programa: Implementar una cola usando un arreglo
// Alumno: Antunez Partida Jorge Octavio - 21211910
// Carrera: Ing. Sistemas computacionales

// asciinema: https://asciinema.org/a/gZfqpqEN9Zur3evk2m0xByTFT

// Programa en C#
/*
using System;

class CircularQueue
{
    private int[] queue;
    private int maxSize;
    private int front;
    private int rear;
    private int count;

    public CircularQueue(int size)
    {
        maxSize = size;
        queue = new int[maxSize];
        front = 0;
        rear = -1;
        count = 0;
    }

    public void Enqueue(int value)
    {
        if (count == maxSize)
        {
            Console.WriteLine("Queue Overflow: Cannot enqueue, the queue is full.");
            return;
        }

        rear = (rear + 1) % maxSize;
        queue[rear] = value;
        count++;
    }

    public int Dequeue()
    {
        if (count == 0)
        {
            Console.WriteLine("Queue Underflow: Cannot dequeue, the queue is empty.");
            return -1;
        }

        int value = queue[front];
        front = (front + 1) % maxSize;
        count--;
        return value;
    }

    public void Display()
    {
        if (count == 0)
        {
            Console.WriteLine("Queue is empty.");
            return;
        }

        Console.WriteLine("Queue elements:");
        for (int i = 0; i < count; i++)
        {
            Console.Write(queue[(front + i) % maxSize] + " ");
        }
        Console.WriteLine();
    }
}

class Program
{
    static void Main()
    {
        CircularQueue queue = new CircularQueue(8); // Queue with a capacity of 8

        queue.Enqueue(10);
        queue.Enqueue(20);
        queue.Enqueue(30);

        queue.Display();

        Console.WriteLine("Dequeued: " + queue.Dequeue());
        Console.WriteLine("Dequeued: " + queue.Dequeue());

        queue.Display();

        queue.Enqueue(40);
        queue.Enqueue(50);
        queue.Display();
    }
}
*/

// Programa en Ensamblador
.data
    queue: .space 64           // Espacio para la cola (8 elementos de 8 bytes)
    max_size: .quad 8          // Tamaño máximo de la cola
    front: .quad 0             // Índice del frente de la cola
    rear: .quad -1             // Índice del final de la cola
    count: .quad 0             // Número de elementos en la cola

.text
.global _start

_start:
    mov x0, #10
    bl enqueue
    mov x0, #20
    bl enqueue
    mov x0, #30
    bl enqueue

    bl dequeue
    mov x1, x0
    bl dequeue
    mov x2, x0

    mov x8, #93
    mov x0, #0
    svc #0

enqueue:
    adrp x1, queue
    add x1, x1, :lo12:queue

    adrp x2, rear
    add x2, x2, :lo12:rear
    ldr x3, [x2]

    adrp x4, count
    add x4, x4, :lo12:count
    ldr x5, [x4]

    adrp x6, max_size
    add x6, x6, :lo12:max_size
    ldr x7, [x6]

    cmp x5, x7
    bge enqueue_error

    add x3, x3, #1
    udiv x8, x3, x7
    msub x3, x8, x7, x3
    str x3, [x2]

    lsl x3, x3, #3
    add x1, x1, x3
    str x0, [x1]

    add x5, x5, #1
    str x5, [x4]
    ret

enqueue_error:
    mov x0, #1
    mov x8, #93
    svc #0

dequeue:
    adrp x1, queue
    add x1, x1, :lo12:queue

    adrp x2, front
    add x2, x2, :lo12:front
    ldr x3, [x2]

    adrp x4, count
    add x4, x4, :lo12:count
    ldr x5, [x4]

    cmp x5, #0
    ble dequeue_error

    lsl x3, x3, #3
    add x1, x1, x3
    ldr x0, [x1]

    add x3, x3, #1
    adrp x6, max_size
    add x6, x6, :lo12:max_size
    ldr x7, [x6]
    udiv x8, x3, x7
    msub x3, x8, x7, x3
    str x3, [x2]

    sub x5, x5, #1
    str x5, [x4]
    ret

dequeue_error:
    mov x0, #2
    mov x8, #93
    svc #0
