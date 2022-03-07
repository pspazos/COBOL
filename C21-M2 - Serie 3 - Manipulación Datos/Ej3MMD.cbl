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
        01 DATOS PIC X(40) VALUE
                           '0207010207100907071080600920012080920204'.
        01 NOTAS REDEFINES DATOS.
            05 ALUMNOS OCCURS 10 times.
                10 LEGAJO PIC 9(2).
                10 NOTA PIC 9(2).
        01 PROM.
            05 PROM1 OCCURS 10 times.
                10 AUXILIAR-PROM PIC 9(2).
                10 AUXILIAR-IND PIC 9(2).
        01 AUXILIAR.
            05 AUX1 PIC 9(2).
            05 AUX2 PIC 9(2).
        01 IND1 PIC 9(2).
        01 MAXM PIC 9(2).
        01 MAXI PIC 9(2).
        01 MINI PIC 9(2).
        01 PROMEDIO PIC 9(3).
        01 ACUM1 PIC 9(3).
        01 ACUM2 PIC 9(2).
        01 ANTERIOR PIC 9(2).
        01 I PIC 9(2).
        01 J PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE 0 TO AUX1
                      IND1
                      ACUM1
                      ACUM2
                      PROMEDIO.

            MOVE 1 TO I
                      J.
            MOVE 10 TO MAXM.

            PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAXM
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > MAXM - 1
                   IF LEGAJO(J) > LEGAJO(J + 1)
                       MOVE LEGAJO(J) TO AUX1
                       MOVE LEGAJO(J + 1) TO LEGAJO(J)
                       MOVE AUX1 TO LEGAJO(J + 1)

                       MOVE NOTA(J) TO AUX2
                       MOVE NOTA(J + 1) TO NOTA(J)
                       MOVE AUX2 TO NOTA(J + 1)
                   END-IF
               END-PERFORM
            END-PERFORM.

            PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAXM
               DISPLAY 'Legajo ordenados: ' LEGAJO(I) ' ' NOTA(I)
            END-PERFORM.
            DISPLAY ' '.

      * Promedios:
            MOVE NOTA(1) TO ACUM1
                            MAXI
                            MINI.
            MOVE 1 TO ACUM2.
            MOVE LEGAJO(1) TO ANTERIOR.

             PERFORM VARYING I FROM 2 BY 1 UNTIL I > MAXM
                 IF LEGAJO(I) = ANTERIOR
                     COMPUTE ACUM1 = NOTA(I) + ACUM1
                     ADD 1 TO ACUM2
                 ELSE
                     COMPUTE PROMEDIO = ACUM1/ACUM2
                     DISPLAY 'Promedio de: ' ANTERIOR ':' PROMEDIO
                     MOVE 0 TO ACUM1
                     MOVE 0 TO ACUM2
                     COMPUTE ACUM1 = NOTA(I) + ACUM1
                     ADD 1 TO ACUM2
                     MOVE LEGAJO(I) TO ANTERIOR
                 END-IF
             END-PERFORM
             COMPUTE PROMEDIO = ACUM1/ACUM2
             DISPLAY 'Promedio de: ' ANTERIOR ':' PROMEDIO

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
