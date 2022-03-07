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
           01 NUMEROS.
               02 INDICE OCCURS 10 TIMES.
                   03 ITEM PIC 9(2).
                   03 FILLER PIC X VALUE ' '.
           01 AUX1 PIC 9(2).
           01 AUX2 PIC 9(2).
           01 IND PIC 9(2).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE 0 TO AUX1.
            MOVE 99 TO AUX2.
            MOVE 0 TO IND.

            ADD 1 TO IND.
            MOVE 10 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 20 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 2 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 5 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 4 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 89 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 32 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 88 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 99 TO ITEM(IND).
            ADD 1 TO IND.
            MOVE 0 TO ITEM(IND).

            PERFORM VARYING IND FROM 1 BY 1 UNTIL IND > 10
      *        Calcular valor máximo.
               IF ITEM(IND) > AUX1
                   MOVE ITEM(IND) TO AUX1
               END-IF

      *        Calcular valor mínimo.
               IF ITEM(IND) < AUX2
                   MOVE ITEM(IND) TO AUX2
               END-IF
            END-PERFORM.

            DISPLAY 'Vector desordenado: ' NUMEROS.
            DISPLAY 'Valor máximo: ' AUX1.
            DISPLAY 'Valor mínimo: ' AUX2.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
