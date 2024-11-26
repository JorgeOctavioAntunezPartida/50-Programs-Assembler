    .section .text
    .global activate_electrode
    .global deactivate_electrode

    // Dirección base del GPIO
    .equ GPIO_BASE, 0x3F200000    // Dirección ficticia, ajusta según el hardware específico

    // Offset del registro de salida (para controlar pines específicos)
    .equ GPIO_SET, 0x1C          // Registro de configuración para establecer (activar)
    .equ GPIO_CLR, 0x28          // Registro de configuración para limpiar (desactivar)

    // Bit correspondiente al electrodo (por ejemplo, pin GPIO 5)
    .equ ELECTRODE_PIN, 5

    // Subrutina para activar el electrodo
    
activate_electrode:

    LDR X0, =GPIO_BASE
    ADD X0, X0, GPIO_SET

    MOV X1, #1
    LSL X1, X1, ELECTRODE_PIN

    STR X1, [X0]

    RET

    // Subrutina para desactivar el electrodo
deactivate_electrode:
    // Cargar la dirección del registro de configuración de desactivación
    LDR X0, =GPIO_BASE
    ADD X0, X0, GPIO_CLR         // Dirección del registro para desactivar el GPIO

    // Cargar el bit del electrodo en el registro
    MOV X1, #1                  // Poner en bajo el bit
    LSL X1, X1, ELECTRODE_PIN   // Desplazar al pin correspondiente

    // Escribir en el registro para desactivar el pin
    STR X1, [X0]

    RET                         // Retorna de la subrutina
