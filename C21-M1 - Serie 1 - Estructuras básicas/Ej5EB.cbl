      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG5.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 RIESGO       PIC 9(1).
               88 UNO          VALUE 1.
               88 DOS          VALUE 2.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY 'Ingrese el nivel de riesgo de la operación.'.
            ACCEPT RIESGO.

            IF UNO OR DOS
                DISPLAY 'Operación aprobada.'
            END-IF.

            STOP RUN.
