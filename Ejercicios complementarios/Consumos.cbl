       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TARJETAS ASSIGN TO  '..\TARJETA'
                           ORGANIZATION IS SEQUENTIAL
                           ACCESS MODE IS SEQUENTIAL
                           FILE STATUS IS FS-TARJETAS.

           SELECT CONSUMOS ASSIGN TO '..\CONSUMO'
                           ORGANIZATION IS SEQUENTIAL
                           ACCESS MODE IS SEQUENTIAL
                           FILE STATUS IS FS-CONSUMOS.

           SELECT LIQUIDACIONES ASSIGN TO '..\LIQUID'
                                ORGANIZATION IS SEQUENTIAL
                                ACCESS MODE IS SEQUENTIAL
                                FILE STATUS IS FS-LIQUIDACIONES.

           SELECT DEUDAS ASSIGN TO '..\DEUDA'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE  IS SEQUENTIAL
                         FILE STATUS  IS FS-DEUDAS.

       DATA DIVISION.
       FILE SECTION.
       FD  TARJETAS.
       01  REG-TARJETAS.
           02  NRO-CLI                 PIC 9(8).
           02  NYA                     PIC X(30).
           02  NRO-CTA-T               PIC 9(8).
           02  MONTO-DIS               PIC 9(15)V99.

       FD  CONSUMOS.
       01  REG-CONSUMOS.
           02  NRO-CTA–C               PIC 9(8).
           02  MONT-CONS               PIC 9(15)V99.
           02  NRO-COMERCIO            PIC X(10).

       FD  LIQUIDACIONES.
       01  REG-LIQUIDACION.
           02  NRO-CTA-L               PIC 9(8).
           02  NRO-CLI-L               PIC 9(8).
           02  MONTO-LIQ               PIC 9(15)V99.

       FD  DEUDAS.
       01  REG-DEUDAS.
           02  NRO-CTA-D               PIC 9(8).
           02  NRO-CLI–D               PIC 9(8).
           02  MONTO-D                 PIC 9(15)V99.

       WORKING-STORAGE SECTION.
       01  FS-TARJETAS                 PIC XX.
       01  FS-CONSUMOS                 PIC XX.
       01  FS-LIQUIDACIONES            PIC XX.
       01  FS-DEUDAS                   PIC XX.

       01  FS-T-EOF                    PIC 9.
       01  FS-C-EOF                    PIC 9.

       01  SUMA-DEU                    PIC 9(15)V99.
       01  SALDO-NUEVO                 PIC 9(5)V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 10000-INICIO.
           PERFORM 20000-PROCESO UNTIL FS-T-EOF = 1 AND FS-C-EOF = 1.
           PERFORM 30000-FINAL.

       10000-INICIO.
           OPEN INPUT TARJETAS.
            IF FS-TARJETAS NOT = ZEROS
               DISPLAY 'ERROR OPEN TARJETAS ' FS-TARJETAS
               PERFORM 30000-FINAL
           END-IF

           OPEN INPUT CONSUMOS.
            IF FS-CONSUMOS NOT = ZEROS
               DISPLAY 'ERROR OPEN SERVICIO ' FS-CONSUMOS
                PERFORM 30000-FINAL
           END-IF

           OPEN OUTPUT LIQUIDACIONES
            IF FS-LIQUIDACIONES NOT = ZEROS
               DISPLAY 'ERROR OPEN RECHAZOS ' FS-LIQUIDACIONES
               PERFORM 30000-FINAL
            END-IF.

           OPEN OUTPUT DEUDAS
            IF FS-DEUDAS NOT = ZEROS
               DISPLAY 'ERROR OPEN INCIDENCIAS ' FS-DEUDAS
               PERFORM 30000-FINAL
            END-IF.

           PERFORM 21000-LEER-TARJETAS.
           PERFORM 22000-LEER-CONSUMOS.

       20000-PROCESO.
           IF NRO-CTA-T = NRO-CTA–C
                PERFORM 23000-ARCIGUAL UNTIL
                        FS-C-EOF = 1 OR NRO-CTA-T NOT = NRO-CTA–C
                PERFORM 24000-GRABAR-ARCHIVO
                PERFORM 21000-LEER-TARJETAS
            ELSE
                IF NRO-CTA–C < NRO-CTA-T
                    DISPLAY 'TARJETA SIN DEUDA'
                    MOVE NRO-CTA-T TO NRO-CTA-L
                    MOVE NRO-CLI TO NRO-CLI-L
                    MOVE 0 TO MONTO-LIQ

                    PERFORM 27000-GRABAR-LIQUIDACION
                    PERFORM 22000-LEER-CONSUMOS
                ELSE
                    IF NRO-CTA–C > NRO-CTA-T
                        DISPLAY 'ERROR, NO HAY DATOS DISPONIBLES'
                        PERFORM 27000-GRABAR-LIQUIDACION
                        PERFORM 21000-LEER-TARJETAS
                    END-IF
                END-IF
            END-IF.

       21000-LEER-TARJETAS.
           READ TARJETAS AT END MOVE 1 TO FS-T-EOF.

       22000-LEER-CONSUMOS.
           READ CONSUMOS AT END MOVE 1 TO FS-C-EOF.

       23000-ARCIGUAL.
           COMPUTE SUMA-DEU = MONT-CONS + SUMA-DEU
           PERFORM 22000-LEER-CONSUMOS.

       24000-GRABAR-ARCHIVO.
           IF SUMA-DEU > MONTO-DIS
              PERFORM 25000-DEUDA
           ELSE
              PERFORM 26000-LIQUIDACION
           END-IF
           MOVE ZERO TO SUMA-DEU.

       25000-DEUDA.
           COMPUTE SUMA-DEU = SUMA-DEU - MONTO-DIS
           MOVE NRO-CLI TO NRO-CLI–D
           MOVE NRO-CTA-T TO NRO-CTA-D
           MOVE SUMA-DEU TO MONTO-D.
           WRITE REG-DEUDAS.

       26000-LIQUIDACION.
           COMPUTE SALDO-NUEVO = MONTO-DIS - SUMA-DEU
           MOVE NRO-CTA-T TO NRO-CTA-L
           MOVE NRO-CLI TO NRO-CLI-L
           MOVE SALDO-NUEVO TO MONTO-LIQ.

       27000-GRABAR-LIQUIDACION.
           WRITE REG-LIQUIDACION.

       30000-FINAL.
           CLOSE TARJETAS
                 CONSUMOS
                 LIQUIDACIONES
                 DEUDAS
           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
