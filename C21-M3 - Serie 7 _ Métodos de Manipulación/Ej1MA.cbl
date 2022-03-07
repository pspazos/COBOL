       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej1MA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTA ASSIGN TO "..\CUENTAS"
           ORGANIZATION IS  SEQUENTIAL
           ACCESS MODE  IS  SEQUENTIAL
           FILE STATUS  IS  FS-STATUS.
       DATA DIVISION.
       FILE SECTION.
       FD  CUENTA.
       01  REG-CUENTA.
           05 COD-CLI         PIC 9(3).
           05 NOMBRE-CLI      PIC X(25).
           05 MCTA            PIC z(4)9.99.

       WORKING-STORAGE SECTION.
       01  FS-STATUS          PIC X(2).
           88 FS-STATUS-OK    VALUE "00".
           88 FS-STATUS-EOF   VALUE "10".
       01  FIN-ARCH           PIC 9 VALUE 0.
       01  COD-CLI-ING        PIC 9(3).
       01  NOMBRE-CLI-ING     PIC X(25).
       01  ENCONTRADO         PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM 1000-INICIO THRU 1000-INICIO-FIN.
            PERFORM 2000-PROCESO UNTIL FIN-ARCH = 1.
            PERFORM 9000-FINAL THRU 9000-FINAL-FIN.

       1000-INICIO.
           OPEN INPUT CUENTA.

           IF NOT FS-STATUS-OK
               DISPLAY "ERROR EN OPEN CUENTA: " FS-STATUS
               MOVE 1 TO FIN-ARCH
           END-IF.

           DISPLAY 'Ingrese el numero de cuenta.'
           ACCEPT COD-CLI-ING.
       1000-INICIO-FIN.

       2000-PROCESO.
               PERFORM 2100-BUSCAR-COD UNTIL FIN-ARCH = 1.

               IF ENCONTRADO = 1
                   DISPLAY 'Nombre: ' NOMBRE-CLI
                   DISPLAY 'Número: ' COD-CLI
                   DISPLAY 'Monto: ' MCTA
               ELSE
                   DISPLAY 'Registro ' NOMBRE-CLI-ING ' no existe.'
               END-IF.
       2000-PROCESO-FIN.

       2100-BUSCAR-COD.
           PERFORM 2500-LEER-CTAS THRU 2500-LEER-CTA-FIN.
           IF COD-CLI = COD-CLI-ING
               MOVE 1 TO ENCONTRADO
               MOVE 1 TO FIN-ARCH
           END-IF.
       2100-COMPARAR-NOMBRE-FIN.

       2500-LEER-CTAS.
           READ CUENTA AT END MOVE 1 TO FIN-ARCH.
           IF  NOT FS-STATUS-OK AND NOT FS-STATUS-EOF
               DISPLAY "READ ERROR: " FS-STATUS
               MOVE 1 TO FIN-ARCH
           END-IF.
       2500-LEER-CTA-FIN.

       9000-FINAL.
           CLOSE CUENTA.
           STOP RUN.
       9000-FINAL-FIN.
