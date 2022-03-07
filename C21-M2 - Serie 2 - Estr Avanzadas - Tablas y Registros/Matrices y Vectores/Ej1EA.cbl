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
           01  MATRIZ.
               02  FILAS   OCCURS 5 TIMES.
                   03  COLUMNAS  OCCURS 5 TIMES.
                       04 ITEM1 PIC 9(2).
                       04 FILLER PIC X(1) VALUE ' '.
           01 IND1 PIC 9(2).
           01 IND2 PIC 9(2).
           01 NUM PIC 9(3).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Inicializo índices.
            ADD 1 TO IND1.
            ADD 1 TO IND2.
      * Cargo números Fila 1.
            MOVE 1 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 2 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 3 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 4 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 5 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            DISPLAY 'Matriz: '
            DISPLAY FILAS(1).
      * Cambio valor de índices.
            ADD 1 TO IND1.
            MOVE 1 TO IND2.
      * Cargo números Fila 2.
            MOVE 6 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 7 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 8 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 9 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 10 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            DISPLAY FILAS(2).
      * Cambio valor de índices.
            ADD 1 TO IND1.
            MOVE 1 TO IND2.

      * Cargo números Fila 3.
            MOVE 11 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 12 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 13 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 14 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 15 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            DISPLAY FILAS(3).
      * Cambio valor de índices.
            ADD 1 TO IND1.
            MOVE 1 TO IND2.
      * Cargo números Fila 4.
            MOVE 16 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 17 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 18 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 19 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 20 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            DISPLAY FILAS(4).
      * Cambio valor de índices.
            ADD 1 TO IND1.
            MOVE 1 TO IND2.
      * Cargo números Fila 5.
            MOVE 21 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 22 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 23 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 24 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.

            ADD 1 TO IND2.
            MOVE 25 TO ITEM1(IND1,IND2).
            IF IND1 = IND2
                COMPUTE NUM = NUM + ITEM1(IND1,IND2)
            END-IF.
            DISPLAY FILAS(5).

            DISPLAY 'Suma de la diagonal: '
            DISPLAY NUM.

      *65
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
