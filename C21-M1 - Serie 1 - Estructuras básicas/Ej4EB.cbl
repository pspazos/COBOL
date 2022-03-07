      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG4.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 ESTADO-CIVIL     PIC X(1).
               88 CASADO       VALUE 'C'.
               88 SOLTERO      VALUE 'S'.
               88 VIUDO        VALUE 'V'.
               88 DIVORSIADO   VALUE 'D'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY 'Ingrese su estado civil: '
            DISPLAY 'Ingrese C para Casado'.
            DISPLAY 'Ingrese S para Soltero'.
            DISPLAY 'Ingrese V para Viudo'.
            DISPLAY 'Ingrese D para Divorsiado'.
            ACCEPT ESTADO-CIVIL.

            IF ESTADO-CIVIL = 'C'
                DISPLAY 'Estado civil: CASADO'
            END-IF

            IF ESTADO-CIVIL = 'S'
                DISPLAY 'Estado civil: SOLTERO'
            END-IF

            IF ESTADO-CIVIL = 'V'
                DISPLAY 'Estado civil: VIUDO'
            END-IF

            IF ESTADO-CIVIL = 'D'
                DISPLAY 'Estado civil: DIVORSIADO'
            END-IF

            STOP RUN.
