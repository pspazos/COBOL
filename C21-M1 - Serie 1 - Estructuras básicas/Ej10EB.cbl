      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG10.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 WSC-MONTON-INICIAL   PIC 9(6).
           01 WSC-IVA              PIC 9V9(2) VALUE 0.21.
           01 WSC-IVA-CALCULADO    PIC 9(6).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY 'Ingrese un monto a calcular su IVA: '.
           ACCEPT WSC-MONTON-INICIAL.

           COMPUTE WSC-IVA-CALCULADO = WSC-MONTON-INICIAL * WSC-IVA.
           DISPLAY 'El IVA es: ' WSC-IVA-CALCULADO.

            STOP RUN.
