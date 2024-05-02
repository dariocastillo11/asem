; Procesador y configuraciones
PROCESSOR   16F887
_CONFIG     _CP_OFF & _DEBUG_OFF & _WRT_OFF & _CPD_OFF & _LVP_OFF & _BODEN_ON & _PWRTE_ON & _WDT_OFF & _HS_OSC

; Incluir el archivo de definiciones del microcontrolador
#include <16F887.INC>
;INCLUDE     <include/16F887.INC>

; Definir constantes
LED_PIN     equ RB0      ; Pin del LED

; Sección de código
org 0x0000
goto start

; Interrupción de reset
org 0x0004
start:
    ; Configurar el pin del LED como salida
    bsf TRISB, LED_PIN  ; Configurar RB0 como salida

main_loop:
    ; Encender el LED
    bsf PORTB, LED_PIN  ; Poner RB0 en alto
    call delay          ; Llamar a la función de retardo

    ; Apagar el LED
    bcf PORTB, LED_PIN  ; Poner RB0 en bajo
    call delay          ; Llamar a la función de retardo

    goto main_loop      ; Repetir el bucle principal

; Función de retardo
delay:
    ; Insertar aquí el código para el retardo
    ; Por ejemplo, puedes utilizar un temporizador o un bucle de conteo
    ; Para este ejemplo, vamos a utilizar un bucle de conteo simple

    movlw 0xFF          ; Cargar un valor en el registro W
    movwf 0x20          ; Guardar el valor en el registro de trabajo

delay_loop:
    decfsz 0x20, f      ; Decrementar el registro y saltar si es cero
    goto delay_loop     ; Repetir el bucle si no es cero

    return              ; Retornar de la función de retardo

; Fin del programa
end
