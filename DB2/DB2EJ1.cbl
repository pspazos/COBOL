      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************

      * Tengo un archivo de entrada secuencial que es el maestro de tarjetas, y los datos que tiene es NRO-TARJ PIC X(16), NRO-CTA PIC X(10),
      * NOMBRE y APELLIDO PIC X(20). Por cada registro que lee del nro de tarjeta voy a ir a buscar a la tabla de ESTADOS para ingresar por
      * número de tarjeta y obtener el estado de esa tarjeta.
      * La tabla ESTADOS tiene NRO-TARJ-E, FECHA-ESTADO PIC X(10) Y ESTADO PIC X. El estado es de 1, puede ser R (rechazada), A (aceptada),
      * H (habilitada) y I (inhabilitada), B (baja) y P en (proceso).
      * Por cada registro que se lee del archivo, buscamos el estado de la tarjeta y se graba un archivo de salida que tenga, el NRO-TARJ, el
      * NRO-CTA, NOMBRE, APELLIDO y ESTADO.
      * Si hay error y no se encuentra, displayar ERROR, sin volver al final. Nada más.

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

       01  FS-ENTRADA          PIC XX.
       01  FIN-ENTRADA         PIC XX.
       01  FS-SALIDA           PIC XX.
       01  FIN-SALIDA          PIC XX.

       01  NRO-TARJETA-AUX     PIC X(16).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO
           PERFORM 2000-PROCESO UNTIL FIN-ENTRADA = 1 OR SQLCODE = 100
           PERFORM 3000-FINAL.

       1000-INICIO.
           PERFORM 2200-OPEN-ARCHIVOS
           PERFORM 2100-LEER-ARCHIVOS.

       2000-PROCESO.
           PERFORM 2400-MOVER-DATOS
           PERFORM 2300-GRABAR-ARCHIVO
           PERFORM 2100-LEER-ENTRADAS.

       2100-LEER-ENTRADAS.
           READ ENTRADAS AT END MOVE 1 TO FIN-ENTRADA
           IF FS-ENTRADA NOT = ZEROS
               DISPLAY 'ERROR LECTURA ENTRADAS' FS-ENTRADA
               PERFORM 3000-FINAL
           END-IF

           MOVE NRO-TARJ TO NRO-TARJETA-AUX.

       2200-OPEN-ARCHIVOS.
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

       2300-GRABAR-ARCHIVO.
           WRITE SALIDAS
           IF FS-SALIDA NOT = ZEROS
               DISPLAY 'ERROR OPEN SALIDAS' FS-SALIDA
               PERFORM 3000-FINAL
           END-IF.

       2400-MOVER-DATOS.
           EXEC SQL
               SELECT T-NRO-TARJ,
                      T-FECHA-ESTADO,
                      T-ESTADO
               INTO   :NRO_TARJ,
                      :FECHA_ESTADO,
                      :ESTADO
               FROM   T-CUENTAS
               WHERE  T-NRO-TARJ = :NRO-TARJETA-AUX
           END-EXEC

           EVALUATE SQLCODE
               WHEN +100
                   DISPLAY 'Row not found. ERROR: ' SQLCODE
               WHEN <> 0
                   DISPLAY 'ERROR'
           END-EVALUATE

           MOVE T-NRO-TARJETA TO NRO-TARJETA-S
                NRO-CTA       TO NRO-CTA-S
                NYA           TO NYA-S
                T-ESTADO      TO ESTADO-S.

       3000-FINAL.
           PERFORM 2300-GRABAR-ARCHIVO

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

           EXEC SQL
               CLOSE CURSOR-UNO
           END-EXEC
           EVALUATE SQLCODE
               WHEN +100
                   DISPLAY 'Row not found. ERROR: ' SQLCODE
               WHEN <> 0
                   DISPLAY 'ERROR'
           END-EVALUATE

           STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
