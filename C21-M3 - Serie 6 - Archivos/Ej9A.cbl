       IDENTIFICATION DIVISION.
       PROGRAM-ID. S6EJER4.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTA ASSIGN TO '..\ECUENTAS'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE IS SEQUENTIAL
                         FILE STATUS IS FS-STATUS.

           SELECT SALIDAS ASSIGN TO  '..\SALIDA'
                          ORGANIZATION IS SEQUENTIAL
                          ACCESS MODE  IS SEQUENTIAL
                          FILE STATUS  IS FS-SALIDAS.

       DATA DIVISION.
       FILE SECTION.
       FD  CUENTA.
           01 REG-CUENTA.
              05 NRO-CTA          PIC X(8).
              05 CLT-CTA          PIC 9(8).
              05 MONTO-CTA        PIC S9(15)V9(2).

       FD  SALIDAS.
           01 REG-SALIDA.
              05 NRO-CTA-S          PIC X(8).
              05 CLT-CTA-S          PIC 9(8).
              05 MONTO-CTA-S        PIC S9(15)V9(2).

       WORKING-STORAGE SECTION.
       01  CUENTA-FORMATO.
           02 NRO-CTA-F          PIC X(8).
           02 CLT-CTA-F          PIC 9(8).
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
           02 NROCTA        PIC X(11) VALUE '  CUENTA  '.
           02 FILLER        PIC X VALUE '|'.
           02 CODCLI        PIC X(8) VALUE 'CLIENTE '.
           02 FILLER        PIC X VALUE '|'.
           02 MONTOCTA      PIC X(19) VALUE '       MONTO '.
           02 FILLER        PIC X VALUE '|'.

       01  DIVISIONES.
           02 A1        PIC X VALUE '|'.
           02 A2        PIC x VALUE '-'.

       01  SW-EOF       PIC 9 VALUE 0.
       01  FS-SALIDAS   PIC XX.

       01  FECHA PIC 9(8).
       01  FECHA-ACTUAL REDEFINES FECHA.
           02 ANIO          PIC 9(4).
           02 MES           PIC 9(2).
           02 DIA           PIC 9(2).

       01  CONT PIC 9(2).
       01  CONT-REG PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO UNTIL SW-EOF = 1.
           PERFORM 9000-FINAL.

       1000-INICIO.
           OPEN I-O CUENTA.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               MOVE 1 TO SW-EOF
               DISPLAY "ERORR: " FS-STATUS
               PERFORM 9000-FINAL
           END-IF

           OPEN OUTPUT SALIDAS.
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
               MOVE 1 TO SW-EOF
               DISPLAY "ERORR: " FS-STATUS
               PERFORM 9000-FINAL
           END-IF

           MOVE FUNCTION CURRENT-DATE TO FECHA-ACTUAL

           PERFORM 5000-LEER-CUENTA

           MOVE 1 TO CONT

           PERFORM 2100-ENCABEZADO.

       2000-PROCESO.
           IF CONT-REG = 59
               PERFORM 2100-ENCABEZADO
               MOVE 0 TO CONT-REG
           END-IF

           MOVE NRO-CTA OF REG-CUENTA TO NRO-CTA-F
           MOVE CLT-CTA OF REG-CUENTA TO CLT-CTA-F
           MOVE MONTO-CTA OF REG-CUENTA TO MONTO-CTA-F

           DISPLAY A1 NRO-CTA-F(1:2) A2 NRO-CTA-F(3:5) A2 NRO-CTA-F(7:)
                   A1 CLT-CTA-F A1 MONTO-CTA-F A1

           PERFORM 5000-LEER-CUENTA
           PERFORM 5100-LEER-SALIDA
           PERFORM 2400-SALIDA-REG
           PERFORM 2500-GRABAR-SALIDA.

       2100-ENCABEZADO.
           DISPLAY 'FECHA: ' DIA '/' MES '/' ANIO
                   '                PAGINA ' CONT
           DISPLAY LINEA-ENCAB
           DISPLAY DESCRIP-ENCAB
           DISPLAY LINEA-ENCAB.

       2400-SALIDA-REG.
           MOVE NRO-CTA TO NRO-CTA-S
           MOVE CLT-CTA TO CLT-CTA-S
           MOVE MONTO-CTA TO MONTO-CTA-S.

       2500-GRABAR-SALIDA.
           MOVE 1 TO CONT-REG
           WRITE REG-SALIDA.

       5000-LEER-CUENTA.
           READ CUENTA AT END MOVE 1 TO SW-EOF
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
                MOVE 1 TO SW-EOF
           END-IF.

       5100-LEER-SALIDA.
           READ SALIDAS AT END MOVE 1 TO SW-EOF
           IF NOT FS-STATUS-OK AND FS-STATUS-EOF
                MOVE 1 TO SW-EOF
           END-IF.

       9000-FINAL.
           DISPLAY LINEA-ENCAB.
           CLOSE CUENTA.
           CLOSE SALIDAS.
           STOP RUN.
