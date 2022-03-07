       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej2A.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTAS ASSIGN TO "..\ECUENTAS"
           ORGANIZATION IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.

           SELECT CTAINDX ASSIGN TO "..\CTASIX"
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS RANDOM
           RECORD KEY   IS NRO-CTA1
           FILE STATUS  IS FS-STATUS1.
       DATA DIVISION.
       FILE SECTION.
       FD  CUENTAS.
       01  REG-CUENTA.
           05 NRO-CTA          PIC X(8).
           05 COD-CLI          PIC X(8).
           05 MCTA        PIC S9(15)V9(2).

       FD  CTAINDX.
       01  REG-CUENTA-NV.
           05 NRO-CTA1          PIC X(8).
           05 COD-CLI1          PIC 9(8).
           05 MCTA1        PIC S9(15)V9(2).

       WORKING-STORAGE SECTION.
       01  FS-STATUS          PIC X(2).
           88 FS-STATUS-OK    VALUE "00".
           88 FS-STATUS-EOF    VALUE "10".
       01  FS-STATUS1          PIC X(2).
           88 FS-STATUS-OK1   VALUE "00".
       01  FIN-ARCH            PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM 1000-INICIO THRU 1000-INICIO-FIN.
           PERFORM 2000-PROCESO UNTIL FIN-ARCH = 1.
           PERFORM 9000-FINAL THRU 9000-FINAL-FIN.

       1000-INICIO.
           OPEN INPUT CUENTAS.
           IF NOT FS-STATUS-OK
               DISPLAY "ERROR EN OPEN CUENTA: " FS-STATUS
               MOVE 1 TO FIN-ARCH
           END-IF.
           OPEN OUTPUT CTAINDX.
           IF NOT FS-STATUS-OK1
               DISPLAY "ERROR EN OPEN OUTPUT: " FS-STATUS1
               MOVE 1 TO FIN-ARCH
           END-IF.
           PERFORM 2500-LEER-CTAS THRU 2500-LEER-CTA-FIN.
       1000-INICIO-FIN.
           EXIT.

       2000-PROCESO.
           MOVE NRO-CTA TO NRO-CTA1.
           MOVE COD-CLI TO COD-CLI1.
           MOVE MCTA TO MCTA1.
           PERFORM 2600-GRABAR  THRU 2600-GRABAR-FIN.
           PERFORM 2500-LEER-CTAS THRU 2500-LEER-CTA-FIN.
       2000-PROCESO-FIN.
           EXIT.
       2500-LEER-CTAS.
           READ CUENTAS AT END MOVE 1 TO FIN-ARCH.
           IF  NOT FS-STATUS-OK AND NOT FS-STATUS-EOF
               DISPLAY "ERROR EN READ: " FS-STATUS
               MOVE 1 TO FIN-ARCH
           END-IF.
       2500-LEER-CTA-FIN.

       2600-GRABAR.
           WRITE REG-CUENTA-NV.
           IF NOT FS-STATUS-OK1
               DISPLAY "ERROR EN GRABAR: " FS-STATUS1
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           END-IF.
       2600-GRABAR-FIN.
           EXIT.

       9000-FINAL.
           CLOSE CUENTAS.
           CLOSE CTAINDX.
           STOP RUN.
       9000-FINAL-FIN.
