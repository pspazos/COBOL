       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej3.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT SERVICIOS ASSIGN TO '..\SERVICIOS.DAT'
                        ORGANISATION IS SEQUENTIAL
                        ACCESS MODE IS SEQUENTIAL
                        FILE STATUS  IS FS-STATUS.

       DATA DIVISION.
        FILE SECTION.
        FD SERVICIOS.
        01 REG-SERV.
           05 COD-SERV PIC X(3).
           05 NRO-CTA PIC X(8).
           05 DESC-SERV PIC X(30).
           05 PFAC PIC X(6).
           05 MFAC PIC S9(5)V9(2).

       WORKING-STORAGE SECTION.
       01  CUENTA-FORMATO.
           02 COD-SERV-F PIC X(3).
           02 NRO-CTA-F PIC X(8).
           02 DESC-SERV-F PIC X(30).
           02 PFAC-F PIC X(6).
           02 MFAC-F PIC S9(5)V9(2).

       01  FS-STATUS          PIC X(2).
           88 FS-STATUS-OK    VALUE "00".
           88 FS-STATUS-EOF   VALUE "10".
       01  FS-STATUS1         PIC X(2).
           88 FS-STATUS-OK1   VALUE "00".

       01  LINEA-ENCAB.
           02 FILLER        PIC X(5) VALUE '*----'.
           02 FILLER        PIC X(12) VALUE '*-----------'.
           02 FILLER        PIC X(31) VALUE
           '*------------------------------'.
           02 FILLER        PIC X(8) VALUE '*-------'.
           02 FILLER        PIC X(8) VALUE '*------*'.

       01  DESCRIP-ENCAB.
           02 FILLER        PIC X(1) VALUE '|'.
           02 CODSERV        PIC X(4) VALUE 'SER.'.
           02 FILLER        PIC X VALUE '|'.
           02 NROCTA        PIC X(11) VALUE '   CUENTA  '.
           02 FILLER        PIC X VALUE '|'.
           02 DESCSERVF      PIC X(30) VALUE ' DESCRIPCION'.
           02 FILLER        PIC X VALUE '|'.
           02 PFACF      PIC X(7) VALUE 'PERIODO'.
           02 FILLER        PIC X VALUE '|'.
           02 MFACF      PIC X(6) VALUE ' MONTO'.
           02 FILLER        PIC X VALUE '|'.

       01  DIVISIONES.
           02 A1        PIC X(1) VALUE '|'.
           02 A2        PIC x VALUE '-'.
           02 A3        PIC X(2) VALUE ' |'.

       01  SW-EOF             PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM 1000-INICIO.
            PERFORM 2000-PROCESO UNTIL SW-EOF = 1.
            PERFORM 9000-FINAL.

            1000-INICIO.
           OPEN INPUT SERVICIOS.
           IF NOT FS-STATUS-OK
               DISPLAY "ERROR EN OPEN CUENTA: " FS-STATUS
               MOVE 1 TO SW-EOF
           END-IF.

           PERFORM 5000-LEER-ARCHIVO.

           DISPLAY LINEA-ENCAB.
           DISPLAY DESCRIP-ENCAB.
           DISPLAY LINEA-ENCAB.

       2000-PROCESO.
           MOVE COD-SERV OF REG-SERV TO COD-SERV-F.
           MOVE NRO-CTA OF REG-SERV TO NRO-CTA-F.
           MOVE DESC-SERV OF REG-SERV TO DESC-SERV-F.
           MOVE PFAC OF REG-SERV TO PFAC-F.
           MOVE PFAC OF REG-SERV TO PFAC-F.

           DISPLAY A1 COD-SERV-F A3 NRO-CTA-F(1:2) A2 NRO-CTA-F(3:5)
                   A2 NRO-CTA-F(7:) A1 DESC-SERV-F A1 PFAC-F A3
                   PFAC-F A1
           PERFORM 5000-LEER-ARCHIVO.

       5000-LEER-ARCHIVO.
           READ SERVICIOS AT END MOVE 1 TO SW-EOF.
           IF NOT FS-STATUS-OK AND NOT FS-STATUS-EOF
                MOVE 1 TO SW-EOF
           END-IF.

       9000-FINAL.
           DISPLAY LINEA-ENCAB
           CLOSE SERVICIOS
           STOP RUN.
