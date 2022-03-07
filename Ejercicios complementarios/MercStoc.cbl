       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT MERCADERIA ASSIGN TO  '..\MERC.DAT'
                             ORGANIZATION IS SEQUENTIAL
                             ACCESS MODE  IS SEQUENTIAL
                             FILE STATUS  IS FS-MERC.

           SELECT STOCK ASSIGN TO  '..\CLIENTES.DAT'
                        ORGANIZATION IS SEQUENTIAL
                        ACCESS MODE  IS SEQUENTIAL
                        FILE STATUS  IS FS-STOCK.

       DATA DIVISION.
       FILE SECTION.
       FD  MERCADERIA.
       01  ARCH-MERC.
           03 NRO-ART              PIC 9(8).
           03 NOM-ART              PIC X(20).
           03 CANT-ART             PIC 9(10).
           03 IMP-ART              PIC S9(15)V99.

       FD  STOCK.
       01  STOCK-REG.
           03 NRO-ART-STOCK        PIC X(8).
           03 NOM-STOCK            PIC X(20).
           03 IMP-STOCK            PIC S9(15)V99.

       WORKING-STORAGE SECTION.
       01  FS-MERC                 PIC X(2).
           88 FS-MERC-OK           VALUE "00".
       01  FS-STOCK                PIC X(2).
           88 FS-STK-OK            VALUE "00".
       01  FS-RESULT               PIC X(2).
           88 FS-RESULT-OK         VALUE "00".

       01  FS-M-EOF                PIC 9 VALUE 0.
       01  FS-S-EOF                PIC 9 VALUE 0.

       01  ACUMULADOR              PIC 9(2).
       01  CANT-ART-AUX            PIC 9(10).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 10000-INICIO.
           PERFORM 20000-PROCESO UNTIL FS-M-EOF = 1 AND FS-S-EOF = 1.
           PERFORM 30000-FINAL.

       10000-INICIO.
           OPEN I-O MERCADERIA
           IF NOT FS-MERC-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO MERCADERIA'
               DISPLAY 'FILE STATUS ' FS-MERC
               PERFORM 30000-FINAL
           END-IF

           OPEN INPUT STOCK
           IF NOT FS-STK-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO STOCK'
               DISPLAY 'FILE STATUS ' FS-STOCK
               PERFORM 30000-FINAL
           END-IF

           PERFORM 25000-LEER-MERCADERIA
           PERFORM 26000-LEER-STOCK.

       20000-PROCESO.
           EVALUATE TRUE
               WHEN NRO-ART = NRO-ART-STOCK
                   PERFORM 28000-IGUALDAD UNTIL
                   NRO-ART NOT = NRO-ART-STOCK OR FS-S-EOF
                   PERFORM 27000-GRABAR
                   MOVE 0 TO ACUMULADOR
                   MOVE 0 TO CANT-ART-AUX
                   PERFORM 25000-LEER-MERCADERIA
               WHEN NRO-ART < NRO-ART-STOCK
                   DISPLAY "ERROR"
                   PERFORM 25000-LEER-MERCADERIA
               WHEN NRO-ART > NRO-ART-STOCK
                   DISPLAY "ERROR"
                   PERFORM 26000-LEER-STOCK
           END-EVALUATE.

       25000-LEER-MERCADERIA.
           READ MERCADERIA AT END MOVE 1 TO FS-M-EOF.
           IF NOT FS-MERC-OK
                DISPLAY 'ERROR LECTURA ARCHIVO MERCADERIA'
                PERFORM 30000-FINAL
           END-IF

           IF FS-M-EOF = 1
               MOVE 99999999 TO NRO-ART
           END-IF.

       26000-LEER-STOCK.
           READ STOCK AT END MOVE 1 TO FS-S-EOF.
           IF NOT FS-STK-OK
               DISPLAY 'ERROR LECTURA ARCHIVO STOCK'
               PERFORM 30000-FINAL
           END-IF.

       27000-GRABAR.
           COMPUTE CANT-ART-AUX = CANT-ART + ACUMULADOR
           MOVE CANT-ART-AUX TO CANT-ART
           REWRITE ARCH-MERC
           IF NOT FS-MERC-OK
               DISPLAY "ERROR" FS-MERC
               PERFORM 30000-FINAL
           END-IF.

       28000-IGUALDAD.
           MOVE CANT-ART TO CANT-ART-AUX
           COMPUTE ACUMULADOR = ACUMULADOR + 1
           PERFORM 25000-LEER-MERCADERIA.

       30000-FINAL.
           CLOSE MERCADERIA
                 STOCK
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
