      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG6.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 RESP-INVALIDA        PIC X(2).
               88 AFIRMATIVO       VALUE 'SI'.
               88 NEGATIVO         VALUE 'NO'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *      DISPLAY 'Responda solo por SI o por NO'.
      *      DISPLAY 'Ingrese S para SI, y N para NO'.
      *      ACCEPT RESPUESTAS.

      *      IF AFIRMATIVO
      *          DISPLAY 'Respuesta: SI'
      *      ELSE
      *          IF NEGATIVO
      *              DISPLAY 'Respuesta: NO'
      *          ELSE
      *              DISPLAY 'Respuesta no válida.'
      *          END-IF
      *      END-IF.

            STOP RUN.
