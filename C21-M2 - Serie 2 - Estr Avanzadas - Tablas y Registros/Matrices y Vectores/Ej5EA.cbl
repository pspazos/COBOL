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
               02  FILA OCCURS 10 TIMES.
                   03 ITEM1 PIC 9(2).
           01 IND1 PIC 9(2).
           01 SUMA PIC 9(2).
           01 POS1 PIC 9(2).
           01 POS2 PIC 9(2).
           01 POS3 PIC 9(2).
           01 POS4 PIC 9(2).
           01 POS5 PIC 9(2).
           01 POS6 PIC 9(2).
           01 POS7 PIC 9(2).
           01 POS8 PIC 9(2).
           01 POS9 PIC 9(2).
           01 POS10 PIC 9(2).
           01 NOTA PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE 1 TO IND1.
            MOVE 0 TO SUMA.
            MOVE 1 TO ITEM1(IND1).
            MOVE 1 TO POS1.

            ADD 1 TO IND1.
            ADD IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS2.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS3.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS4.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS5.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS6.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS7.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS8.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS9.

            ADD 1 TO IND1.
            MOVE IND1 TO SUMA.
            MOVE SUMA TO ITEM1(IND1).
            MOVE SUMA TO POS10.

            DISPLAY 'Ingrese nota: '.
            ACCEPT NOTA.

            DISPLAY 'Nota ingresada: ' NOTA.

            IF NOTA = POS1
                DISPLAY 'Nota equivalente: F'
            END-IF.

            IF NOTA = POS2
                DISPLAY 'Nota equivalente: E'
            END-IF.

            IF NOTA = POS3
                DISPLAY 'Nota equivalente: D'
            END-IF.

            IF NOTA = POS4 OR NOTA = POS5 OR NOTA = POS6 OR NOTA = POS7
                DISPLAY 'Nota equivalente: C'
            END-IF.

            IF NOTA = POS8 OR NOTA = POS9
                DISPLAY 'Nota equivalente: B'
            END-IF.

            IF NOTA = POS10
                DISPLAY 'Nota equivalente: A'
            END-IF.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
