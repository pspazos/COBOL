       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej2A.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTA ASSIGN TO '..\CUENTAS.DAT'
           ORGANIZATION IS  SEQUENTIAL
           ACCESS MODE  IS  SEQUENTIAL
           FILE STATUS  IS  FS-STATUS.
       DATA DIVISION.
       FILE SECTION.
       FD  CUENTA.
       01  REG-CUENTA.
           05 NRO-CTA          PIC X(8).
           05 COD-CLI          PIC 9(8).
           05 MCTA        PIC S9(15)V9(2).
       WORKING-STORAGE SECTION.
       01  FS-STATUS          PIC X(2).
           88 FS-STATUS-OK    VALUE "00".
           88 FS-STATUS-EOF   VALUE "10".
       01  SWITCHES         PIC X(2).
           88 CARGO-SI         VALUE "SI".
           88 CARGO-NO         VALUE "NO".

       PROCEDURE DIVISION.
           PERFORM 1000-INICIO THRU 1000-INICIO-FIN.
           PERFORM 2000-PROCESO THRU 2000-PROCESO-FIN.
           PERFORM 9000-FINAL THRU 9000-FINAL-FIN.
           STOP RUN.

       1000-INICIO.
           OPEN OUTPUT CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               DISPLAY "ERROR FS-STATUS: " FS-STATUS
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           ELSE
                CONTINUE
           END-IF.
       1000-INICIO-FIN.
           EXIT.

       2000-PROCESO.
           MOVE "SI" TO SWITCHES.

           DISPLAY "Ingrese número de cuenta (8 dígitos)"
           ACCEPT NRO-CTA.
           DISPLAY "Ingrese código de cliente (8 dígitos)"
           ACCEPT COD-CLI.
           DISPLAY 'Ingrese monto de cuenta: '
                   '(formato: 999999999999999.99)'
           ACCEPT MCTA.
           PERFORM 3000-GRABAR THRU 3000-GRABAR-FIN.

           DISPLAY 'Desea seguir ingresando registros? (SI o NO)'
           ACCEPT SWITCHES.
           IF SWITCHES = "SI"
               PERFORM 2000-PROCESO
           END-IF.
       2000-PROCESO-FIN.
           EXIT.

       3000-GRABAR.
           WRITE REG-CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               DISPLAY "ERROR FS-STATUS: " FS-STATUS
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           END-IF.
       3000-GRABAR-FIN.
           EXIT.

       9000-FINAL.
           CLOSE CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               DISPLAY "ERROR FS-STATUS EN CLOSE: " FS-STATUS
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           END-IF.
       9000-FINAL-FIN.
