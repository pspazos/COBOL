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
           SELECT SALIDAS ASSIGN TO  '..\SALD'
                          FILE STATUS  IS FS-SALIDA.

       DATA DIVISION.
       FILE SECTION.
       FD  SALIDAS.
       01  REG-SALIDA.
           02 NRO-TARJETA-S        PIC X(16).
           02 NRO-PIEZA            PIC X(10).
           02 FEC-EMBOZO           PIC 9(20).

       WORKING-STORAGE SECTION.

       EXEC INCLUDE SQLCA END-EXEC.
       EXEC INCLUDE POLIZAS END-EXEC.
       EXEC INCLUDE EMBOZO END-EXEC.

       01  RG-POLIZAS.
           03 NRO-TARJETA            PIC X(16).
           03 FEC-ALTA               PIC X(10).
           03 NRO-PIEZA              PIC X(8).

       01  RG-EMBOZO.
           03 NRO-TARJETA-E          PIC X(16).
           03 FEC-ALTA-E             PIC X(10).
           03 FEC-EMBOZO             PIC X(10).

       01  RG-SALIDA.
           03 NRO-TARJETA-S          PIC X(16).
           03 FEC-ALTA-S             PIC X(10).
           03 NRO-PIEZA-S            PIC X(8).

       EXEC SQL
           DECLARE CURSOR-UNO CURSOR FOR
               SELECT NRO-TARJETA,
                      NRO-PIEZA,
                      FEC-EMBOZO,
               INTO   :NRO-TARJETA
                      :NRO-PIEZA,
                      :FEC-EMBOZO
               FROM   POLIZAS,
                      EMBOZO
               WHERE  NRO-TARJETA = NRO-TARJETA-E
               AND    FEC-ALTA LIKE '2022-01-20'
       END-EXEC.

       01  FS-SALIDA               PIC XX.
       01  FIN-SALIDA              PIC XX.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO
           PERFORM 2000-PROCESO UNTIL SQLCODE = 100
           PERFORM 3000-FINAL.

       1000-INICIO.
           OPEN OUTPUT SALIDAS
           IF FS-SALIDA NOT = ZEROS
               DISPLAY 'ERROR OPEN SALIDAS' FS-SALIDA
               PERFORM 3000-FINAL
           END-IF.

           EXEC SQL
               OPEN CURSOR-UNO
           END-EXEC
           IF SQLCODE NOT EQUAL 0
               DISPLAY 'ERROR: ' SQLCODE
               PERFORM 3000-FINAL
           END-IF.

       2000-PROCESO.
           EXEC SQL
               FETCH CURSOR-UNO
               INTO :NRO-TARJETA, :NRO-PIEZA, :FEC-EMBOZO
           END-EXEC

           MOVE NRO-TARJETA     TO NRO-TARJETA-S
                NRO-PIEZA       TO NRO-PIEZA-S
                FEC-EMBOZO      TO FEC-EMBOZO-S

           PERFORM 2200-GRABAR-ARCHIVO.

       2200-GRABAR-ARCHIVO.
           WRITE SALIDAS
           IF FS-SALIDA NOT = ZEROS
               DISPLAY 'ERROR WRITE SALIDAS' FS-SALIDA
               PERFORM 3000-FINAL
           END-IF.

       3000-FINAL.
           CLOSE SALIDAS
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR CLOSE ' FS-ENTRADA
           END-IF

           CLOSE CURSOR-UNO
           IF SQLCODE NOT EQUAL 0
               DISPLAY 'ERROR: ' SQLCODE
           END-IF

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
