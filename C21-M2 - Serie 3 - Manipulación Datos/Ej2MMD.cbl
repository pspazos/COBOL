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
           01 AUX PIC 9(2).
           01 IND1 PIC 9(2).
           01 IND2 PIC 9(2).
           01 ACUMULADOR PIC 9(3).
           01 PROMEDIO PIC 99V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE 0 TO AUX
                      IND1
                      IND2
                      ACUMULADOR
                      PROMEDIO.

            ADD 1 TO IND1.
            MOVE 10 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 20 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 2 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 5 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 4 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 89 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 32 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 88 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 99 TO ITEM(IND1).
            ADD 1 TO IND1.
            MOVE 0 TO ITEM(IND1).

      * Calcular valor máximo.
            PERFORM VARYING IND2 FROM 1 BY 1 UNTIL IND2 = 10
                   ADD ITEM(IND2) TO ACUMULADOR
            END-PERFORM.

            COMPUTE PROMEDIO = ACUMULADOR/10.

            DISPLAY 'Promedio del vector: ' PROMEDIO.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
