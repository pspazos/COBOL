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
           01 UNO PIC 9(1).
           01 SUMA1 PIC 9(2).
           01 SUMA2 PIC 9(2).
           01 FILA1 PIC 9(1).
           01 FILA2 PIC 9(1).
           01 FILA3 PIC 9(1).
           01 FILA4 PIC 9(1).
           01 FILA5 PIC 9(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Inicializo índices.
            ADD 1 TO IND1.
            ADD 1 TO IND2.
            ADD 1 TO SUMA1.
            ADD 1 TO SUMA2.

      * Cargo números Fila 1.
            MOVE 1 TO ITEM1(IND1,IND2).
            MOVE IND2 TO FILA1.

            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).
            MOVE IND2 TO FILA2.

            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).
            ADD IND2 TO FILA3.

            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).
            ADD IND2 TO FILA4.

            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).
            ADD IND2 TO FILA5.

      * Cargo hacia abajo.
            ADD 1 TO IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia la izquierda.
            SUBTRACT 1 FROM IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            SUBTRACT 1 FROM IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            SUBTRACT 1 FROM IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            SUBTRACT 1 FROM IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia arriba.
            SUBTRACT 1 FROM IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            SUBTRACT 1 FROM IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            SUBTRACT 1 FROM IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia la derecha.
            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia abajo.
            ADD 1 TO IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia la izquierda.
            SUBTRACT 1 FROM IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            SUBTRACT 1 FROM IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia arriba.
            SUBTRACT 1 FROM IND1.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

      * Cargo hacia la derecha.
            ADD 1 TO IND2.
            COMPUTE SUMA1 = SUMA1 + SUMA2.
            MOVE SUMA1 TO ITEM1(IND1,IND2).

            DISPLAY 'Matriz: '
            DISPLAY FILAS(FILA1).
            DISPLAY FILAS(FILA2).
            DISPLAY FILAS(FILA3).
            DISPLAY FILAS(FILA4).
            DISPLAY FILAS(FILA5).

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
