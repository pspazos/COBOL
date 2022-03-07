      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej1I.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  FRASE.
           02 PALABRAS OCCURS 8 times.
               05 PALABRA PIC A(15).
       01  CONTADOR PIC 9(1).
       01  I PIC 9(1).
       01  AUX PIC A(15).
       01  REMPLAZAR PIC A(15).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE 0 TO CONTADOR.
           MOVE 1 TO I.

           DISPLAY 'Ingrese frase de 8 palabras de a 1 a la vez'
                   'y precione ENTER: '

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               DISPLAY 'Ingrese la palabra ' I
               ACCEPT PALABRA(I)
           END-PERFORM
           DISPLAY FRASE.
           DISPLAY 'Ingresar palabra. Puede estar o no en la frase: '
           ACCEPT AUX.

           DISPLAY 'Ingrese una palabra para remplazarla: '
           ACCEPT REMPLAZAR.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               IF AUX = PALABRA(I)
                   ADD 1 TO CONTADOR
                   MOVE REMPLAZAR TO PALABRA(I)
               END-IF
           END-PERFORM

           DISPLAY 'La palabra aparece ' CONTADOR ' veces.'
           DISPLAY 'La frase ahora es asi: '
           DISPLAY FRASE.

            STOP RUN.
