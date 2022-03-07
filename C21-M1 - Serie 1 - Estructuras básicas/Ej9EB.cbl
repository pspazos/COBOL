      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG9.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 NOMBRE-COMPLETO      PIC X(50).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY 'Ingrese su nombre y apellido:'.
            ACCEPT NOMBRE-COMPLETO.

            DISPLAY 'Su nombre completo es: ' NOMBRE-COMPLETO.
            STOP RUN.
