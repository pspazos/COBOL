       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENSIX ASSIGN TO '..\CTASIX'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS ID-CLIENTE
           FILE STATUS IS FS-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  CLIENSIX.
       01  REG-CLIENTE.
           05 ID-CLIENTE PIC X(8).
           05 COD-CLI1 PIC 9(8).
           05 MCTA1 PIC S9(15)V9(2).

       WORKING-STORAGE SECTION.
       01  FS-STATUS PIC X(2).
           88 FS-STATUS-OK VALUE '00'.
           88 FS-STATUS-NOENC VALUE '23'.
           88 FS-STATUS-EOF VALUE '10'.
       01  NRO-ING PIC X(8).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO.
           PERFORM 3000-FINAL.

       1000-INICIO.

           OPEN INPUT CLIENSIX.
           IF NOT FS-STATUS-OK
               DISPLAY "ERROR EN OPEN CUENTA: " FS-STATUS
           END-IF

           DISPLAY 'Ingrese clave 1: '
           ACCEPT NRO-ING.

       2000-PROCESO.
           MOVE NRO-ING TO ID-CLIENTE
           PERFORM 2500-LEER-CTAS.

           DISPLAY 'Ingrese clave 2: '
           ACCEPT NRO-ING.

           MOVE NRO-ING TO ID-CLIENTE
           PERFORM 2500-LEER-CTAS.

       2500-LEER-CTAS.
           READ CLIENSIX

           IF FS-STATUS-NOENC
               DISPLAY 'CLiente no existe: ' NRO-ING
               DISPLAY ' '
           ELSE
               DISPLAY 'El cliente existe ' REG-CLIENTE
               DISPLAY ' '
           END-IF.

           IF NOT FS-STATUS-OK AND NOT FS-STATUS-NOENC
               DISPLAY "ERROR EN READ: " FS-STATUS
               PERFORM 3000-FINAL
           END-IF.

       3000-FINAL.
           PERFORM 9900-CERRAR.
            STOP RUN.

       9900-CERRAR.
           CLOSE CLIENSIX
           IF NOT FS-STATUS-OK AND NOT FS-STATUS-EOF
               DISPLAY 'Error en cierre de archivo: ' FS-STATUS
           END-IF.

       END PROGRAM YOUR-PROGRAM-NAME.
