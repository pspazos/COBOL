       IDENTIFICATION DIVISION.
       PROGRAM-ID. S6EJER4.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTA ASSIGN TO '..\ECUENTAS'
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FS-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  CUENTA.
           01 REG-CUENTA.
              05 NRO-CTA          PIC X(8).
              05 COD-CLI          PIC 9(8).
              05 MONTO-CTA        PIC S9(15)V9(2).
       WORKING-STORAGE SECTION.
       01  CUENTA-FORMATO.
           02 NRO-CTA-F          PIC X(8).
           02 COD-CLI-F          PIC 9(8).
           02 MONTO-CTA-F        PIC S9(15)V9(2).

       01  FS-STATUS          PIC X(2).
           88 FS-STATUS-OK    VALUE '00'.
           88 FS-STATUS-EOF   VALUE '10'.

       01  LINEA-ENCAB.
           02 FILLER        PIC X(12) VALUE '*-----------'.
           02 FILLER        PIC X(9) VALUE '*--------'.
           02 FILLER        PIC X(21) VALUE '*-------------------*'.

       01  DESCRIP-ENCAB.
           02 FILLER        PIC X VALUE '|'.
           02 NROCTA        PIC X(11) VALUE '  NRO-CTA  '.
           02 FILLER        PIC X VALUE '|'.
           02 CODCLI        PIC X(8) VALUE 'COD-CLI '.
           02 FILLER        PIC X VALUE '|'.
           02 MONTOCTA      PIC X(19) VALUE ' DISPONIBLE CUENTA'.
           02 FILLER        PIC X VALUE '|'.

       01  DIVISIONES.
           02 A1        PIC X VALUE '|'.
           02 A2        PIC x VALUE '-'.

       01  SW-EOF             PIC 9 VALUE 0.

       PROCEDURE DIVISION.

           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO UNTIL SW-EOF = 1.
           PERFORM 9000-FINAL.

       1000-INICIO.
           OPEN INPUT CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               MOVE 1 TO SW-EOF
               DISPLAY "ERORR: " FS-STATUS
               PERFORM 9000-FINAL
           END-IF

           PERFORM 5000-LEER-ARCHIVO.

           DISPLAY LINEA-ENCAB.
           DISPLAY DESCRIP-ENCAB.
           DISPLAY LINEA-ENCAB.

       2000-PROCESO.
           MOVE NRO-CTA OF REG-CUENTA TO NRO-CTA-F.
           MOVE COD-CLI OF REG-CUENTA TO COD-CLI-F.
           MOVE MONTO-CTA OF REG-CUENTA TO MONTO-CTA-F.

           DISPLAY A1 NRO-CTA-F(1:2) A2 NRO-CTA-F(3:5) A2 NRO-CTA-F(7:)
                   A1 COD-CLI-F A1 MONTO-CTA-F A1

           PERFORM 5000-LEER-ARCHIVO.

       5000-LEER-ARCHIVO.
           READ CUENTA AT END MOVE 1 TO SW-EOF.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
                MOVE 1 TO SW-EOF
           END-IF.

       9000-FINAL.
           DISPLAY LINEA-ENCAB.
           CLOSE CUENTA.
           STOP RUN.
