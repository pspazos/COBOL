      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT MAESTRO ASSIGN TO  '..\SALD'
                          FILE STATUS  IS FS-MAESTRO.

       DATA DIVISION.
       FILE SECTION.
       FD  MAESTRO.
       01  REG-MAE-TARJETAS.
           03 NRO-TARJETA-T        PIC X(16).
           03 NRO-CTA-T            PIC X(10).
           03 NYA-T                PIC X(20).
           03 FEC-PROCESO-T        PIC X(10).

       WORKING-STORAGE SECTION.

       EXEC INCLUDE SQLCA END-EXEC.
       EXEC INCLUDE PIEZAS END-EXEC.

       01  REG-TABLA.
           03 NRO-TARJETA          PIC X(16).
           03 NRO-CTA              PIC X(10).
           03 FEC-ALTA             PIC X(10).
           03 FEC-PROCESO          PIC X(10).

       01  NRO-TARJETA-AUX         PIC X(16).

       01  FS-MAESTRO              PIC XX.
       01  FIN-MAESTRO             PIC XX.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO
           PERFORM 1100-LEER-ENTRADAS
           PERFORM 2000-PROCESO UNTIL FIN-MAESTRO = 1 OR SQLCODE = 100
           PERFORM 3000-FINAL.

       1000-INICIO.
           OPEN INPUT MAESTRO
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR OPEN MAESTRO' FS-MAESTRO
               PERFORM 3000-FINAL
           END-IF.

       1100-LEER-ENTRADAS.
           READ MAESTRO AT END MOVE 1 TO FIN-MAESTRO
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR LECTURA MAESTRO' FS-MAESTRO
               PERFORM 3000-FINAL
           END-IF
           MOVE NRO-TARJ TO NRO-TARJETA-AUX.

       2000-PROCESO.
           IF SQLCODE EQUAL 0
               EXEC SQL
                   UPDATE PIEZAS
                   SET FEC-PROCESO = FEC-PROCESO-T
                   WHERE NRO-TARJ = NRO-TARJETA-AUX
               END-EXEC
           END-IF
           IF SQLCODE NOT EQUAL 0
                DISPLAY " ERROR " SQLCODE " " NRO-TAR-T
                PERFORM 3000-FINAL
           END-IF

           PERFORM 1100-LEER-ENTRADAS.

       3000-FINAL.
           CLOSE MAESTRO
           IF FS-MAESTRO NOT = ZEROS
               DISPLAY 'ERROR CLOSE MAESTRO' FS-MAESTRO
           END-IF

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
