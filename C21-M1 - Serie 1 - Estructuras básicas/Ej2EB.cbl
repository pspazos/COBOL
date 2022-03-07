      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 FECHA.
               03 DIA      PIC 9(2).
               03 GUION1   PIC X VALUE '-'.
               03 MES      PIC 9(2).
               03 GUION2   PIC X VALUE '-'.
               03 ANIO     PIC 9(4).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Ingreso de datos del usuario.
            DISPLAY 'Ingrese el dia: '.
            ACCEPT DIA.
            DISPLAY 'Ingrese el mes: '.
            ACCEPT MES.
            DISPLAY 'Ingrese el año: '.
            ACCEPT ANIO.
      * Salida en consola.
            DISPLAY 'La fecha ingresada es: ' FECHA.
      * Para que me salgan los guiones en el DISPLAY tengo que inicializarlos como VALUE.
            STOP RUN.
