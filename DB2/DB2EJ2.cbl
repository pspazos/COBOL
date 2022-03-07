      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
      *    Se pide leer un registro del maestro de tarjetas y buscar en
      *    la tabla de Estados , el último estado de dicha tarjeta.
      *    Grabar el archivo de salida con el estado de la tarjeta.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADAS ASSIGN TO  '..\ENTR'
                           FILE STATUS  IS FS-ENTRADA.

           SELECT SALIDAS ASSIGN TO  '..\SALD'
                          FILE STATUS  IS FS-SALIDA.

       DATA DIVISION.
       FILE SECTION.
       FD  ENTRADAS.
       01  REG-ENTRADAS.
           02 NRO-TARJ         PIC X(16).
           02 NRO-CTA          PIC X(10).
           02 NYA              PIC 9(20).

       FD  SALIDAS.
       01  REG-SALIDA.
           02 NRO-TARJ-S       PIC X(16).
           02 NRO-CTA-S        PIC X(10).
           02 NYA-S            PIC 9(20).
           02 ESTADO-S         PIC X.

       WORKING-STORAGE SECTION.

       EXEC INCLUDE SQLCA END-EXEC.
       EXEC INCLUDE T-CUENTAS END-EXEC.

           01  T-CUENTAS.
               02  T-NRO-TARJ      PIC X(16).
               02  T-FECHA-ESTADO  PIC X(10).
               02  T-ESTADO        PIC X.

           EXEC SQL
              DECLARE CURSOR-UNO  CURSOR FOR
                  SELECT T-NRO-TARJETA,
                         T-FECHA-ESTADO,
                         T-ESTADO
                  INTO   :NRO-TARJETA,
                         :T-FECHA-ESTADO,
                         :ESTADO
                  FROM   T-CUENTAS
                  WHERE  T-NRO-TARJ = :NRO-TARJETA-AUX
                  ORDER BY T-FECHA-ESTADO ASCENDING
           END-EXEC.

       01  NRO-TARJETA-AUX     PIC X(16).
       01  NRO-CTA-AUX         PIC X(10).
       01  NYA-AUX             PIC 9(20).
       01  ESTADO-AUX          PIC X.

       01  FS-ENTRADA          PIC XX.
       01  FIN-ENTRADA         PIC XX.
       01  FS-SALIDA           PIC XX.
       01  FIN-SALIDA          PIC XX.

       01  NRO-TARJETA-AUX     PIC X(16).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO
           PERFORM 1100-LEER-ENTRADAS
           PERFORM 2000-PROCESO UNTIL FIN-ENTRADA = 1
           PERFORM 3000-FINAL.

       1000-INICIO.
           OPEN INPUT ENTRADAS
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR OPEN ENTRADAS' FS-ENTRADA
               PERFORM 3000-FINAL
           END-IF

           OPEN OUTPUT SALIDAS
           IF FS-SALIDA NOT = ZEROS
               DISPLAY 'ERROR OPEN SALIDAS' FS-SALIDA
               PERFORM 3000-FINAL
           END-IF.

       1100-LEER-ENTRADAS.
           READ ENTRADAS AT END MOVE 1 TO FIN-ENTRADA
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR LECTURA ENTRADAS' FS-ENTRADA
               PERFORM 3000-FINAL
           END-IF
           MOVE NRO-TARJ TO NRO-TARJETA-AUX.

       2000-PROCESO.
           EXEC SQL
               OPEN CURSOR-UNO
           END-EXEC
           IF SQLCODE NOT EQUAL 0
               DISPLAY 'ERROR: ' SQLCODE
               PERFORM 3000-FINAL
           END-IF

      *    Por si en la primer lectura no tiene datos, tira error.
           PERFORM 2100-FETCH
           IF SQLCODE EQUAL 100
               DISPLAY 'CLIENTE SIN DATOS: ' SQLCODE
           END-IF

           PERFORM 2100-FETCH UNTIL SQLCODE = 100

           MOVE NRO-TARJETA     TO NRO-TARJETA-S
                NRO-CTA         TO NRO-CTA-S
                NYA             TO NYA-S
                ESTADO-AUX      TO ESTADO-S

           PERFORM 2200-GRABAR-ARCHIVO
           PERFORM 2300-CLOSE-CURSOR
           PERFORM 1100-LEER-ENTRADAS.

       2100-FETCH.
           EXEC SQL
               FETCH CURSOR-UNO
               INTO  NRO_TARJ,
                     FECHA_ESTADO,
                     ESTADO
           END-EXEC
           IF SQLCODE NOT EQUAL 0
               DISPLAY 'ERROR: ' SQLCODE
               PERFORM 3000-FINAL
           END-IF

           EVALUATE TRUE
               WHEN SQLCODE EQUAL 100
                   CONTINUE

               WHEN SQLCODE EQUAL 0
                   MOVE T-ESTADO   TO ESTADO-AUX

               WHEN OTHER
                   DISPLAY 'ERROR: ' SQLCODE
           END-EVALUATE.

       2200-GRABAR-ARCHIVO.
           WRITE SALIDAS
           IF FS-SALIDA NOT = ZEROS
               DISPLAY 'ERROR OPEN SALIDAS' FS-SALIDA
               PERFORM 3000-FINAL
           END-IF.

       2300-CLOSE-CURSOR.
           CLOSE CURSOR-UNO
           IF SQLCODE NOT EQUAL 0
               DISPLAY 'ERROR: ' SQLCODE
               PERFORM 3000-FINAL
           END-IF.

       3000-FINAL.
           CLOSE ENTRADAS
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR OPEN ARCHSEC' FS-ENTRADA
               PERFORM 3000-FINAL
           END-IF

           CLOSE SALIDAS
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR OPEN ARCHSEC' FS-ENTRADA
               PERFORM 3000-FINAL
           END-IF

           STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
