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
           01  TABLA.
               02  FILA OCCURS 20 TIMES.
                   03 ITEM1 PIC 9(5).
                   03 FILLER PIC X(3) VALUE ' + '.
                   03 ITEM2 PIC 9(5).
                   03 FILLER PIC X(3) VALUE ' = '.
                   03 ITEM3 PIC 9(5).
           01 IND1 PIC 9(1).
           01 IND2 PIC 9(2).
           01 RESTART PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Inicializo índice.
            ADD 1 TO IND1.
            ADD 1 TO IND2.
            ADD 1 TO RESTART.

            MOVE 1 TO ITEM1(IND1).
            MOVE 1 TO ITEM2(IND1).
            MOVE 0 TO RESTART.
            DISPLAY 'Fibonacci 1: ' ITEM1(IND1).
            DISPLAY 'Fibonacci 2: ' ITEM2(IND1).

      * Suma 1.
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 3: ' ITEM3(IND1).
      * Suma 2.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 4: ' ITEM3(IND1).
      * Suma 3.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 5: ' ITEM3(IND1).
      * Suma 4.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 6: ' ITEM3(IND1).
      * Suma 5.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 7: ' ITEM3(IND1).
      * Suma 6.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 8: ' ITEM3(IND1).
      * Suma 7.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 9: ' ITEM3(IND1).
      * Suma 8.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 10: ' ITEM3(IND1).
      * Suma 9.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 11: ' ITEM3(IND1).
      * Suma 10.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 12: ' ITEM3(IND1).
      * Suma 11.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 13: ' ITEM3(IND1).
      * Suma 12.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 14: ' ITEM3(IND1).
      * Suma 13.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 15: ' ITEM3(IND1).
      * Suma 14.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 16: ' ITEM3(IND1).
      * Suma 15.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 17: ' ITEM3(IND1).
      * Suma 16.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 18: ' ITEM3(IND1).
      * Suma 17.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 19: ' ITEM3(IND1).
      * Suma 18.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 20: ' ITEM3(IND1).
      * Suma 19.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 21: ' ITEM3(IND1).
      * Suma 20.
            MOVE ITEM2(IND1) TO ITEM1(IND1).
            MOVE ITEM3(IND1) TO ITEM2(IND1).
            MOVE RESTART TO ITEM3(IND1).
            ADD ITEM1(IND1) TO ITEM3(IND1).
            ADD ITEM2(IND1) TO ITEM3(IND1).
            DISPLAY 'Fibonacci 22: ' ITEM3(IND1).

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
