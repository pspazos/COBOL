       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej2MA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTA ASSIGN TO  '..\CTA'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE  IS SEQUENTIAL
                         FILE STATUS  IS FS-CUENTA.

           SELECT SERVICIO ASSIGN TO  '..\SRVCIO'
                           ORGANIZATION IS SEQUENTIAL
                           ACCESS MODE  IS SEQUENTIAL
                           FILE STATUS  IS FS-SERVICIO.

           SELECT RECHAZOS ASSIGN TO  '..\RECHAZO'
                           ORGANIZATION IS SEQUENTIAL
                           ACCESS MODE  IS SEQUENTIAL
                           FILE STATUS  IS FS-RECHAZOS.

           SELECT INCIDEN ASSIGN TO  '..\INCID'
                          ORGANIZATION IS SEQUENTIAL
                          ACCESS MODE  IS SEQUENTIAL
                          FILE STATUS  IS FS-INCIDEN.

       DATA DIVISION.
       FILE SECTION.
       FD  CUENTA.
       01  REG-CTA.
           02 NRO-C PIC X.
           02 NOM-C PIC X(20).
           02 MNT-C PIC 9(3)V99.

       FD  SERVICIO.
       01  REG-SERV.
           02 NRO-C-S PIC X.
           02 COD-S PIC X(3).
           02 MNT-C-S PIC 9(3)V99.

       FD  RECHAZOS.
       01  REG-RCHZO.
           02 NRO-C-RZ PIC X.
           02 NOM-C-RZ PIC X(20).
           02 SAL-CTA PIC 9(5)V99.
           02 DUEDA-TOT PIC 9(5)V99.

       FD  INCIDEN.
       01  REG-INCID.
           02 NRO-C-I PIC X.
           02 AUSENC PIC X(20).

       WORKING-STORAGE SECTION.
       01  FS-CUENTA PIC XX.
       01  FS-SERVICIO PIC XX.
       01  FS-RECHAZOS PIC XX.
       01  FS-INCIDEN PIC XX.

       01  FIN-SERV PIC 9.
       01  FIN-CTA PIC 9.

       01  SUMA-DEU PIC 9(5)V99.
       01  SALDO-NUEVO PIC 9(5)V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-LEER-ARCHIVOS.
           PERFORM 2100-LEER-CUENTA.
           PERFORM 2200-LEER-SERVICIO.
           PERFORM 2000-PROCESAR-DATOS UNTIL FIN-CTA=1 OR FIN-SERV = 1.
           PERFORM 4100-FIN.

       1000-LEER-ARCHIVOS.
           OPEN I-O CUENTA  .
            IF FS-CUENTA NOT = ZEROS
               DISPLAY 'ERROR OPEN CUENTA ' FS-CUENTA
               PERFORM 4100-FIN
           END-IF

           OPEN INPUT SERVICIO.
            IF FS-SERVICIO NOT = ZEROS
               DISPLAY 'ERROR OPEN SERVICIO ' FS-SERVICIO
                PERFORM 4100-FIN
           END-IF

           OPEN OUTPUT RECHAZOS
            IF FS-RECHAZOS NOT = ZEROS
               DISPLAY 'ERROR OPEN RECHAZOS ' FS-RECHAZOS
               PERFORM 4100-FIN
            END-IF.

           OPEN OUTPUT INCIDEN
            IF FS-INCIDEN NOT = ZEROS
               DISPLAY 'ERROR OPEN INCIDENCIAS ' FS-INCIDEN
               PERFORM 4100-FIN
            END-IF.

       2000-PROCESAR-DATOS.
            IF NRO-C-S = NRO-C
                PERFORM 2300-ARCIGUAL UNTIL
                        FIN-SERV = 1 OR NRO-C-S NOT = NRO-C
                PERFORM 3000-GRABAR-ARCHIVO
                PERFORM 2100-LEER-CUENTA
            ELSE
                IF NRO-C-S < NRO-C
                    MOVE 'CLIENTE NO EXISTE ' TO AUSENC
                    MOVE NRO-C-S TO NRO-C-I
                    PERFORM 3100-GRABAR-INCIDENCIA
                    PERFORM 2200-LEER-SERVICIO
                ELSE
                    IF NRO-C-S > NRO-C
                        MOVE 'CLIENTE SIN DEUDA ' TO AUSENC
                        MOVE NRO-C  TO NRO-C-I
                        PERFORM 3100-GRABAR-INCIDENCIA
                        PERFORM 2100-LEER-CUENTA
                    END-IF
                END-IF
            END-IF.

       2100-LEER-CUENTA.
           READ CUENTA AT END MOVE 1 TO FIN-CTA.

       2200-LEER-SERVICIO.
           READ SERVICIO AT END MOVE 1 TO FIN-SERV.

       2300-ARCIGUAL.
           COMPUTE SUMA-DEU = MNT-C-S + SUMA-DEU
           PERFORM 2200-LEER-SERVICIO.

       3000-GRABAR-ARCHIVO.
           IF SUMA-DEU > MNT-C
              PERFORM 2400-RECHAZA-REG
           ELSE
              PERFORM 2500-ACTUALIZA-SALDO-CTA
           END-IF
           MOVE ZERO TO SUMA-DEU.

       3100-GRABAR-INCIDENCIA.
            WRITE REG-INCID.

       2400-RECHAZA-REG.
           MOVE NRO-C TO NRO-C-RZ
           MOVE NOM-C TO NOM-C-RZ
           MOVE MNT-C TO SAL-CTA.
           MOVE SUMA-DEU TO DUEDA-TOT.
           WRITE REG-RCHZO.

       2500-ACTUALIZA-SALDO-CTA.
           COMPUTE SALDO-NUEVO = MNT-C - SUMA-DEU
           MOVE SALDO-NUEVO TO MNT-C.

       4000-CERRAR-ARCHIVO.
           CLOSE CUENTA,
           CLOSE SERVICIO,
           CLOSE RECHAZOS,
           CLOSE INCIDEN.

       4100-FIN.
           PERFORM 4000-CERRAR-ARCHIVO.
           STOP RUN.
