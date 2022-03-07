       IDENTIFICATION DIVISION.
       PROGRAM-ID. PromAp.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ALUMNO ASSIGN TO  '..\ALMN'
                         ORGANIZATION IS SEQUENTIAL
                         ACCESS MODE  IS SEQUENTIAL
                         FILE STATUS  IS FS-ALUMNO.

           SELECT NOTA ASSIGN TO  '..\NTA'
                           ORGANIZATION IS SEQUENTIAL
                           ACCESS MODE  IS SEQUENTIAL
                           FILE STATUS  IS FS-NOTA.

           SELECT ERRORES ASSIGN TO  '..\ERRS'
                           ORGANIZATION IS SEQUENTIAL
                           ACCESS MODE  IS SEQUENTIAL
                           FILE STATUS  IS FS-ERRORES.

           SELECT PROMEDIO ASSIGN TO  '..\INCID'
                          ORGANIZATION IS SEQUENTIAL
                          ACCESS MODE  IS SEQUENTIAL
                          FILE STATUS  IS FS-PROMEDIO.

       DATA DIVISION.
       FILE SECTION.
       FD  ALUMNO.
       01  REG-ALM.
           02 NRO-A PIC X(8).
           02 NOM-A PIC X(30).

       FD  NOTA.
       01  REG-NOTA.
           02 NRO-A-N PIC X(8).
           02 NTA-N PIC 9(2).

       FD  ERRORES.
       01  REG-ERROR.
           02 NRO-A-ER PIC X(8).
           02 NOM-A-ER PIC X(30).
           02 NTA-N-ER PIC 9(2).
           02 INFO-ER PIC X(30).

       FD  PROMEDIO.
       01  REG-PROM.
           02 NRO-A-P PIC X.
           02 NOM-A-P PIC X(30).
           02 PROM-P PIC 9(2).

       WORKING-STORAGE SECTION.
       01  FS-ALUMNO PIC XX.
       01  FS-NOTA PIC XX.
       01  FS-ERRORES PIC XX.
       01  FS-PROMEDIO PIC XX.

       01  FIN-NTA PIC 9.
       01  FIN-ALM PIC 9.

       01  SUMA-NOTA PIC 9(2).
       01  PROM PIC 9(2).
       01  CONTADOR PIC 9(2).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESAR-DATOS UNTIL FIN-ALM=1 OR FIN-NTA = 1.
           PERFORM 3000-FIN.

       1000-INICIO.
           OPEN INPUT ALUMNO.
            IF FS-ALUMNO NOT = ZEROS
               DISPLAY 'ERROR OPEN ALUMNO ' FS-ALUMNO
               PERFORM 3000-FIN
           END-IF

           OPEN INPUT NOTA.
            IF FS-NOTA NOT = ZEROS
               DISPLAY 'ERROR OPEN NOTA ' FS-NOTA
               PERFORM 3000-FIN
           END-IF

           OPEN OUTPUT ERRORES
            IF FS-ERRORES NOT = ZEROS
               DISPLAY 'ERROR OPEN ERRORES ' FS-ERRORES
               PERFORM 3000-FIN
            END-IF

           OPEN OUTPUT PROMEDIO
            IF FS-PROMEDIO NOT = ZEROS
               DISPLAY 'ERROR OPEN PROMEDIOCIAS ' FS-PROMEDIO
               PERFORM 3000-FIN
            END-IF

            PERFORM 2100-LEER-ALUMNO
            PERFORM 2200-LEER-NOTA.

       2000-PROCESAR-DATOS.
            EVALUATE TRUE
                WHEN NRO-A = NRO-A-N
                     PERFORM 2300-SUMAR-NOTAS UNTIL FIN-NTA = 1 OR
                                                 NRO-A-N NOT = NRO-A
                     PERFORM 3200-GRABAR-ARCHIVO
                     PERFORM 2100-LEER-ALUMNO
                WHEN NRO-A-N < NRO-A
                     MOVE ' ALUMNO SIN NOTA ' TO INFO-ER
                     PERFORM 3100-GRABAR-PROMEDIO
                     PERFORM 2200-LEER-NOTA
                WHEN NRO-A-N > NRO-A
                     MOVE ' NOTA SIN ALUMNO ' TO INFO-ER
                     PERFORM 3100-GRABAR-PROMEDIO
                     PERFORM 2100-LEER-ALUMNO
            END-EVALUATE.

       2100-LEER-ALUMNO.
           READ ALUMNO AT END MOVE 1 TO FIN-ALM.

       2200-LEER-NOTA.
           READ NOTA AT END MOVE 1 TO FIN-NTA.

       2300-SUMAR-NOTAS.
           COMPUTE SUMA-NOTA = NTA-N + SUMA-NOTA
           ADD 1 TO CONTADOR.
           PERFORM 2200-LEER-NOTA.

       2400-RECHAZA-REG.
           IF NRO-A > NRO-A-N
               MOVE NRO-A TO NRO-A-ER
               MOVE NOM-A TO NOM-A-ER
               WRITE REG-ERROR
           ELSE
               MOVE NRO-A-N TO NRO-A-ER
               MOVE NTA-N TO NTA-N-ER
               WRITE REG-ERROR
           END-IF.

       2500-CALCULAR-PROM.
           COMPUTE PROM = SUMA-NOTA / CONTADOR.

       3000-FIN.
           PERFORM 4000-CERRAR-ARCHIVO.
           STOP RUN.

       3100-GRABAR-PROMEDIO.
            WRITE REG-PROM.

       3200-GRABAR-ARCHIVO.
           IF NRO-A NOT = NRO-A-N
              PERFORM 2400-RECHAZA-REG
           ELSE
              PERFORM 2500-CALCULAR-PROM
              MOVE PROM TO PROM-P
              MOVE NRO-A TO NRO-A-P
              MOVE NOM-A TO NOM-A-P
           END-IF
           MOVE ZERO TO SUMA-NOTA
           MOVE ZERO TO CONTADOR.

       4000-CERRAR-ARCHIVO.
           CLOSE ALUMNO,
           CLOSE NOTA,
           CLOSE ERRORES,
           CLOSE PROMEDIO.
