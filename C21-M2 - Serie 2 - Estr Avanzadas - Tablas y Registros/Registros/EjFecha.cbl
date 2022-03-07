      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 FECHA1 PIC X(6).
           01 FECHA2 REDEFINES FECHA1.
               02 DIA2      PIC 9(2).
               02 MES2      PIC 9(2).
               02 ANIO2     PIC 9(2).
           01 DIA PIC 9(2).
           01 MES PIC 9(2).
           01 ANIO PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Recibo  una fecha con formato DDMMAA, y la quiero mostrar como DD/MM/AA.

            DISPLAY 'Ingrese fecha en formato DDMMAA: '

            DISPLAY 'DIA:'
            ACCEPT DIA.
            MOVE DIA TO DIA2.

            DISPLAY 'MES:'
            ACCEPT MES.
            MOVE MES TO MES2.

            DISPLAY 'ANIO:'
            ACCEPT ANIO.
            MOVE ANIO TO ANIO2.

            DISPLAY 'Fecha en formato DDMMAA: ' DIA MES ANIO.

            DISPLAY 'Fecha en DD/MM/AA: ' DIA2 '/' MES2 '/' ANIO2.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
