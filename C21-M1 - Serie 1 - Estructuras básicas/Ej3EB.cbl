      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG3.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      * Estructura inicial.
           01 FECHA.
               02 DIA1      PIC 9(2).
               02 FILLER   PIC X(1) VALUE '/'.
               02 MES1      PIC 9(2).
               02 FILLER   PIC X(1) VALUE '/'.
               02 ANIO1     PIC 9(2).

      * Estructira actualizada.
           01 FECHA-ACTUALIZADA.
               02 DIA2      PIC 9(2).
               02 FILLER   PIC X(1) VALUE '/'.
               02 MES2      PIC 9(2).
               02 FILLER   PIC X(1) VALUE '/'.
               02 ANIO2     PIC 9(4).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Igrese el día: "
            ACCEPT DIA2.
            DISPLAY "Ingrese el mes: "
            ACCEPT MES2.
            DISPLAY "Ingrese el año: "
            ACCEPT ANIO2.

            DISPLAY "La fecha ingresada es: " FECHA-ACTUALIZADA.


            STOP RUN.
