      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG8.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01  WSV-NUMEROS-1     PIC S9(5) VALUE 49234.
           01  WSV-NUMEROS-2     PIC S99999 VALUE 49234.
           01  WSV-NUMEROS-3     PIC +9(5).
           01  WSV-NUMEROS-4     PIC -9(5).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
