      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG11.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 FECHA PIC X(10).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE '2006-04-18' TO FECHA.
            DISPLAY 'AÑO: ' FECHA(1:4).
            DISPLAY 'MES: ' FECHA(6:2).
            DISPLAY 'DIA: ' FECHA(9:2).

            STOP RUN.
