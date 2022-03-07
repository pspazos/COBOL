      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG12.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 FECHA PIC X(10).
           01 GUION1   PIC X VALUE '-'.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE '2006-04-18' TO FECHA.
            DISPLAY 'Fecha: '
            DISPLAY FECHA(9:2) GUION1 FECHA(6:2) GUION1 FECHA(1:4).
            STOP RUN.
