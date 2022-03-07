       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej5A.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTA ASSIGN TO "..\ECUENTAS"
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
       01  MAXIMO PIC S9(15)V9(2).
       01  MINIMO PIC S9(15)V9(2).
       01  COD-CLI-MAX PIC 9(8).
       01  COD-CLI-MIN PIC 9(8).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO THRU 1000-INICIO-FIN.
           PERFORM 2000-PROCESO THRU 2000-PROCESO-FIN UNTIL CARGO-SI
           PERFORM 9000-FINAL THRU 9000-FINAL-FIN.

       1000-INICIO.
           OPEN INPUT CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               DISPLAY "ERROR FS-STATUS: " FS-STATUS
               SET CARGO-SI TO TRUE
           END-IF.

           PERFORM 2500-READ THRU 2500-READ-FIN.

           MOVE 999999999999999 TO MINIMO.
           MOVE 0 TO MAXIMO.
       1000-INICIO-FIN.
           EXIT.

       2000-PROCESO.
           PERFORM 2100-MAX-MIN THRU 2100-MAX-MIN-FIN.
           PERFORM 2500-READ THRU 2500-READ-FIN.
       2000-PROCESO-FIN.

       2100-MAX-MIN.
           IF MCTA < MINIMO
               MOVE MCTA TO MINIMO
               MOVE COD-CLI TO COD-CLI-MIN
           END-IF

           IF MCTA > MAXIMO
               MOVE MCTA TO MAXIMO
               MOVE COD-CLI TO COD-CLI-MAX
           END-IF.
       2100-MAX-MIN-FIN.

       2500-READ.
           READ CUENTA AT END SET CARGO-SI TO TRUE.
       2500-READ-FIN.

       9000-FINAL.
           DISPLAY 'Monto mínimo: ' MINIMO
           DISPLAY 'Código de cliente: ' COD-CLI-MIN.
           DISPLAY 'Monto máximo: ' MAXIMO
           DISPLAY 'Código de cliente: ' COD-CLI-MAX.
           CLOSE CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               DISPLAY "ERROR FS-STATUS EN CLOSE: " FS-STATUS
           END-IF.
       9000-FINAL-FIN.
            STOP RUN.
