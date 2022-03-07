       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  DATOS PIC X(40) VALUE '123024001024010023167023001'.
       01  NUMEROS REDEFINES DATOS.
           05 NUM OCCURS 3 TIMES.
               10 NOTA1 PIC 9(3).
               10 NOTA2 PIC 9(3).
               10 NOTA3 PIC 9(3).
       01  AUX PIC 9(3).
       01  RESULTADO PIC S9(3).
       01  I PIC 9.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE 1 TO I.
            MOVE 0 TO RESULTADO.

            PERFORM VARYING I FROM 1 BY 1 UNTIL I > 1
               COMPUTE RESULTADO = NOTA1(I) + NOTA2(I) + NOTA3(I)
               DISPLAY NOTA1(I) ' + ' NOTA2(I) ' + ' NOTA3(I) ' = '
                    RESULTADO
            END-PERFORM.
            MOVE 0 TO RESULTADO

            PERFORM VARYING I FROM 2 BY 1 UNTIL I > 2
               COMPUTE RESULTADO = NOTA1(I) - NOTA2(I) - NOTA3(I)
               DISPLAY NOTA1(I) ' - ' NOTA2(I) ' - ' NOTA3(I) ' = '
                    RESULTADO
            END-PERFORM.
            MOVE 0 TO RESULTADO

            PERFORM VARYING I FROM 3 BY 1 UNTIL I > 3
               COMPUTE RESULTADO = NOTA1(I) + NOTA2(I) - NOTA3(I)
               DISPLAY NOTA1(I) ' + ' NOTA2(I) ' - ' NOTA3(I) ' = '
                    RESULTADO
            END-PERFORM.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
