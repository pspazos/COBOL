       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ALUMNOS ASSIGN TO  '..\TRANSAC.DAT'
                          ORGANIZATION IS SEQUENTIAL
                          ACCESS MODE  IS SEQUENTIAL
                          FILE STATUS  IS FS-ALUMN.

           SELECT NOTAS ASSIGN TO  '..\CLIENTES.DAT'
                        ORGANIZATION IS SEQUENTIAL
                        ACCESS MODE  IS SEQUENTIAL
                        FILE STATUS  IS FS-NOTAS.

           SELECT RESULTADOS ASSIGN TO  '..\CLIENTES.DAT'
                             ORGANIZATION IS SEQUENTIAL
                             ACCESS MODE  IS SEQUENTIAL
                             FILE STATUS  IS FS-RESULT.
       DATA DIVISION.
       FILE SECTION.
       FD  ALUMNOS.
       01  REG-ALUMNO.
           03  COD-ALUMNO-A        PIC 9(8).
           03  NOMBRE-A            PIC X(30).
           03  PROMEDIO-A          PIC 9(2).
       FD  NOTAS.
       01  REG-NOTA.
           03 COD-ALUMNO-N         PIC 9(8).
           03 NOTA                 PIC 9(10).
           03 MATERIA              PIC X(30).
       FD  RESULTADOS.
       01  REG-RESULT.
           03 COD-ALUMNO-r         PIC 9(8).
           03 PROMEDIO-R           PIC 9(2).
           03 NOMB-ALUMNO          PIC X(30).
       WORKING-STORAGE SECTION.
       01  FS-ALUMN                PIC X(2).
           88 FS-ALUMN-OK          VALUE "00".
       01  FS-NOTAS                PIC X(2).
           88 FS-NTA-OK            VALUE "00".
       01  FS-RESULT               PIC X(2).
           88 FS-RESULT-OK         VALUE "00".

       01  FS-A-EOF                PIC 9 VALUE 0.
       01  FS-N-EOF                PIC 9 VALUE 0.

       01  ACUMULADOR              PIC 9(2).
       01  CANT-NOTA               PIC 9(2).
       01  PROM                    PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 10000-INICIO.
           PERFORM 20000-PROCESO UNTIL FS-A-EOF = 1 AND FS-N-EOF = 1.
           PERFORM 30000-FINAL.

       10000-INICIO.
           OPEN INPUT ALUMNOS
           IF NOT FS-ALUMN-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO INICIO'
               DISPLAY 'FILE STATUS ' FS-ALUMN
               PERFORM 30000-FINAL
           END-IF

           OPEN INPUT NOTAS
           IF NOT FS-NTA-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO NOTAS'
               DISPLAY 'FILE STATUS ' FS-NOTAS
               PERFORM 30000-FINAL
           END-IF

           OPEN OUTPUT RESULTADOS
           IF NOT FS-RESULT-OK
               DISPLAY 'ERROR AL ABRIR ARCHIVO RESULTADOS'
               DISPLAY 'FILE STATUS ' FS-RESULT
               PERFORM  30000-FINAL
           END-IF

           PERFORM 25000-LEER-ALUMNOS
           PERFORM 26000-LEER-NOTAS.

       20000-PROCESO.
           EVALUATE TRUE
               WHEN COD-ALUMNO-A = COD-ALUMNO-N
                   PERFORM 28000-IGUALDAD UNTIL
                   COD-ALUMNO-A NOT = COD-ALUMNO-N OR FS-N-EOF
                   COMPUTE PROM = ACUMULADOR / CANT-NOTA
                   MOVE COD-ALUMNO-A TO COD-ALUMNO-R
                   MOVE NOMBRE-A TO NOMB-ALUMNO
                   MOVE PROM TO PROMEDIO-R
                   MOVE 0 TO CANT-NOTA
                   MOVE 0 TO ACUMULADOR
                   PERFORM 27000-GRABAR
                   PERFORM 25000-LEER-ALUMNOS
               WHEN COD-ALUMNO-A < COD-ALUMNO-N
                   DISPLAY "ERROR: NOTA SIN ALUMNO"
                   PERFORM 25000-LEER-ALUMNOS
               WHEN COD-ALUMNO-A > COD-ALUMNO-N
                   DISPLAY "ERROR: ALUMNO SIN NOTA"
                   PERFORM 26000-LEER-NOTAS
           END-EVALUATE.

       25000-LEER-ALUMNOS.
           READ ALUMNOS AT END MOVE 1 TO FS-A-EOF.
           IF NOT FS-ALUMN-OK
                DISPLAY 'ERROR LECTURA ARCHIVO ALUMNOS'
                PERFORM 30000-FINAL
           END-IF

           IF FS-N-EOF = 1
               MOVE 99999999 TO COD-ALUMNO-A
           END-IF.

       26000-LEER-NOTAS.
           READ NOTAS AT END MOVE 1 TO FS-N-EOF.
           IF NOT FS-NTA-OK
               DISPLAY 'ERROR LECTURA ARCHIVO NOTAS'
               PERFORM 30000-FINAL
           END-IF.

       27000-GRABAR.
           WRITE REG-RESULT AFTER ADVANCING 1 LINE
           IF NOT FS-RESULT-OK
               DISPLAY "ERROR DE ESCRITURA EN RESULTADOS  " FS-RESULT
               PERFORM 30000-FINAL
           END-IF.

       28000-IGUALDAD.
           ADD 1 TO CANT-NOTA
           COMPUTE ACUMULADOR = ACUMULADOR + NOTA
           PERFORM 25000-LEER-ALUMNOS.

       30000-FINAL.
           CLOSE ALUMNOS
                 NOTAS
                 RESULTADOS
           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
