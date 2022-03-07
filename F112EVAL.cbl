       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANSACCIONES ASSIGN TO  '..\TRANSAC.DAT'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE  IS SEQUENTIAL
                         FILE STATUS  IS FS-TRANS.

           SELECT CLIENTES ASSIGN TO  '..\CLIENTES.DAT'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE  IS SEQUENTIAL
                         FILE STATUS  IS FS-CLIENTE.

           SELECT RESULTADOS ASSIGN TO  '..\CLIENTES.DAT'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE  IS SEQUENTIAL
                         FILE STATUS  IS FS-RESULT.

       DATA DIVISION.
       FILE SECTION.
       FD  TRANSACCIONES.
       01  REG-TRANS.
           02 NRO-CLIENTE-T            PIC 9(7).
           02 COD-SERVICIO             PIC x(3).
           02 IMPORTE-T                PIC 9(7)v99.

       FD  CLIENTES.
       01  REG-CLT.
           02 NRO-CLIENTE-C            PIC 9(7).
           02 NYAR-C                   PIC X(60).
           02 IMPORTE-C                PIC 9(7)v99.

       FD  RESULTADOS.
       01  REG-RESULT.
           02 NRO-CLIENTE-R            PIC 9(7).
           02 NYAR-R                   PIC X(60).
           02 IMPORTE-T-R                PIC 9(7)V99.
           02 CANT-TR                  PIC 9(3).

       WORKING-STORAGE SECTION.
       01  FS-TRANS                    PIC X(2).
           88 FS-TRANS-OK          VALUE "00".
           88 FS-TRANS-EOF         VALUE "10".
       01  FS-CLIENTE                  PIC X(2).
           88 FS-CTE-OK            VALUE "00".
           88 FS-CTE-EOF           VALUE "10".
       01  FS-RESULT                   PIC X(2).
           88 FS-RESULT-OK         VALUE "00".
       01  INFO-ER                     PIC X(25).

       01  IMPORTE-SUMA                PIC 9(7).

       01  CTE-LDOS                    PIC 9(2).
       01  CTE-NO-LDOS                 PIC 9(2).

       01  CTE-ANTERIOR                PIC 9(7).
       01  CANT-TRANS                  PIC 9(2).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 10000-INICIO.
           PERFORM 20000-PROCESO UNTIL FS-TRANS-EOF AND FS-CTE-EOF.
           PERFORM 30000-FINAL.

       10000-INICIO.
           OPEN INPUT TRANSACCIONES.
           IF NOT FS-TRANS-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO SERVICIOS'
               DISPLAY 'FILE STATUS ' FS-TRANS
               PERFORM 30000-FINAL
           END-IF

           OPEN INPUT CLIENTES.
           IF NOT FS-TRANS-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO SERVICIOS'
               DISPLAY 'FILE STATUS ' FS-CLIENTE
               PERFORM 30000-FINAL
           END-IF

           OPEN I-O RESULTADOS.
           IF NOT FS-RESULT-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO CUENTAS'
               DISPLAY 'FILE STATUS ' FS-RESULT
               PERFORM  30000-FINAL
           END-IF

           PERFORM 25000-LEER-CTES
           IF FS-CTE-EOF
               DISPLAY 'ARCHIVO VACIO'
           END-IF

           PERFORM 26000-LEER-TRANS
           IF FS-TRANS-EOF
               DISPLAY 'ARCHIVO VACIO'
           END-IF.

       20000-PROCESO.
           MOVE 0 TO CANT-TRANS.
           EVALUATE TRUE
               WHEN NRO-CLIENTE-C = NRO-CLIENTE-T
                  PERFORM 65000-IGUALDAD UNTIL FS-TRANS = "10"
                          OR NRO-CLIENTE-T NOT = NRO-CLIENTE-C
                  MOVE NRO-CLIENTE-C TO NRO-CLIENTE-R
                  MOVE NYAR-C TO NYAR-R
                  MOVE IMPORTE-SUMA TO IMPORTE-T-R
                  MOVE CANT-TRANS TO CANT-TR
                  PERFORM 60000-GRABAR
                  MOVE NRO-CLIENTE-C TO CTE-ANTERIOR
               WHEN  NRO-CLIENTE-C > NRO-CLIENTE-T
                     MOVE ' CLIENTE SIN TRANSACCION ' TO INFO-ER
                     PERFORM 26000-LEER-TRANS
                     MOVE NRO-CLIENTE-C TO CTE-SIN-T
               WHEN NRO-CLIENTE-C < NRO-CLIENTE-T
                     MOVE ' TRANSACCION SIN CLIENTE ' TO INFO-ER
                     PERFORM 25000-LEER-CTES
                     PERFORM 66000-DUPLICADOS
           END-EVALUATE.

       25000-LEER-CTES.
           READ CLIENTES.
           IF NOT FS-CTE-EOF AND FS-CTE-OK
                DISPLAY 'ERROR LECTURA ARCHIVO SERVICIO'
                PERFORM 30000-FINAL
           END-IF.

       26000-LEER-TRANS.
           READ TRANSACCIONES.
           IF NOT FS-TRANS-EOF AND FS-TRANS-OK
               DISPLAY 'ERROR LECTURA ARCHIVO CTAS'
               PERFORM 30000-FINAL
           END-IF
           ADD 1 TO CANT-TRANS.

       60000-GRABAR.
           WRITE REG-RESULT.

       65000-IGUALDAD.
           COMPUTE IMPORTE-SUMA = IMPORTE-SUMA + IMPORTE-C
           PERFORM 25000-LEER-CTES
           PERFORM 26000-LEER-TRANS.

       66000-DUPLICADOS.
           IF NRO-CLIENTE-C = CTE-ANTERIOR
               DISPLAY 'ERROR FATAL: ' FS-CLIENTE
           END-IF.

       30000-FINAL.
           CLOSE TRANSACCIONES
                 CLIENTES
                 RESULTADOS.
           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
