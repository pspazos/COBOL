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
           01 NUM1 PIC 9(2).
           01 NUM2 PIC 9(1).
           01 FILA1 PIC 9(2).
           01 FILA2 PIC 9(2).
           01 FILA3 PIC 9(2).
           01 FILA4 PIC 9(2).
           01 FILA5 PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * Inicializo índices.
            ADD 1 TO IND1.
            ADD 1 TO IND2.
            ADD 1 TO NUM1.
            ADD 1 TO NUM2.
      * Cargo números Fila 1.
            DISPLAY 'Columna 1: '
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).

      *Guardo índice de fila para mostrar la matriz al final.
            MOVE IND2 TO FILA1.

            DISPLAY COLUMNAS(IND1,IND2).

            DISPLAY ' '.
      * Cambio valor de índices.
            ADD 1 TO IND2.
            MOVE 1 TO IND1.
      * Cargo números Fila 2.
            DISPLAY 'Columna 2: '
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).

      *Guardo índice de fila para mostrar la matriz al final.
            MOVE IND2 TO FILA2.

            DISPLAY COLUMNAS(IND1,IND2).

            DISPLAY ' '.
      * Cambio valor de índices.
            ADD 1 TO IND2.
            MOVE 1 TO IND1.
      * Cargo números Fila 3.
            DISPLAY 'Columna 3: '
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).

      *Guardo índice de fila para mostrar la matriz al final.
            MOVE IND2 TO FILA3.

            DISPLAY COLUMNAS(IND1,IND2).

            DISPLAY ' '.
      * Cambio valor de índices.
            ADD 1 TO IND2.
            MOVE 1 TO IND1.
      * Cargo números Fila 4.
            DISPLAY 'Columna 4: '
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).

      *Guardo índice de fila para mostrar la matriz al final.
            MOVE IND2 TO FILA4.

            DISPLAY COLUMNAS(IND1,IND2).

            DISPLAY ' '.
      * Cambio valor de índices.
            ADD 1 TO IND2.
            MOVE 1 TO IND1.
      * Cargo números Fila 5.
            DISPLAY 'Columna 5: '
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).
            DISPLAY COLUMNAS(IND1,IND2).

            ADD 1 TO IND1.
            COMPUTE NUM1 = NUM1 + NUM2.
            MOVE NUM1 TO ITEM1(IND1,IND2).

      *Guardo índice de fila para mostrar la matriz al final.
            MOVE IND2 TO FILA5.

            DISPLAY COLUMNAS(IND1,IND2).

            DISPLAY ' '.
            DISPLAY 'Matriz: '
            DISPLAY FILAS(FILA1).
            DISPLAY FILAS(FILA2).
            DISPLAY FILAS(FILA3).
            DISPLAY FILAS(FILA4).
            DISPLAY FILAS(FILA5).

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
