      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      ******************************************************************
      * FORMA 1 DE DEFINIR LA FECHA
      ******************************************************************
           01 FECHA.
               03 DIA      PIC 9(2).
               03 GUION1   PIC X.
               03 MES      PIC 9(2).
               03 GUION2   PIC X.
               03 ANIO     PIC 9(4).

      ******************************************************************
      * FORMA 2 DE DEFINIR LA FECHA
      ******************************************************************
           01 FECHA2.
               03 DIA2      PIC 9(2).
               03 FILLER    PIC X VALUE '-'.
               03 MES2      PIC 9(2).
               03 FILLER    PIC X VALUE '-'.
               03 ANIO2     PIC 9(4).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      ******************************************************************
      * FORMA 1 DE DEFINIR LA FECHA
      ******************************************************************
           MOVE 10 TO      DIA.
           MOVE '-' TO     GUION1
                           GUION2.
           MOVE 02 TO      MES.
           MOVE 2022 TO    ANIO.

      ******************************************************************
      * FORMA 2 DE DEFINIR LA FECHA
      ******************************************************************
           MOVE 10 TO      DIA2.
           MOVE 02 TO      MES2.
           MOVE 2022 TO    ANIO2.

      ******************************************************************
      * SALIDA EN CONSOLA
      ******************************************************************
           DISPLAY "Fecha 1: " DIA GUION1 MES GUION2 ANIO.
           DISPLAY "Fecha 2: " DIA "-" MES "-" ANIO.

           STOP RUN.
