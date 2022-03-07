       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ej1A.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SERVICIO ASSIGN TO "..\ESERV"
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FS-FIENTRA.
       DATA DIVISION.
        FILE SECTION.
        FD SERVICIO.
        01 REG-SERV.
           05 COD-SERV PIC X(3).
           05 NRO-CTA PIC 9(8).
           05 DESC-SERV PIC X(30).
           05 PFAC PIC X(6) VALUE 'AAAAMM'.
           05 MFAC PIC S9(5)V9(2).
        WORKING-STORAGE SECTION.
        01 FS-FIENTRA PIC X(2).
           88 FS-FIENTRA-OK VALUE '00'.
           88 FS-FIENTRA-EOF VALUE '10'.
        01 SWITCHES PIC X(2).
           88 SI-CARGO VALUE 'SI'.
           88 NO-CARGO VALUE 'NO'.
        LINKAGE SECTION.
       PROCEDURE DIVISION.
       0000-ESTRUCTURA.
           PERFORM 1000-INICIO-PROG THRU 1000-INICIO-PROG-FIN.
           PERFORM 2000-PROCESO UNTIL NO-CARGO.
           PERFORM 9000-FINAL THRU 9000-FINAL-FIN.
       0000-ESTRUCUTRA-FIN.

       1000-INICIO-PROG.
           OPEN OUTPUT SERVICIO.
           IF NOT FS-FIENTRA-OK AND FS-FIENTRA-EOF
               DISPLAY 'ERROR: ' FS-FIENTRA
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           ELSE
               CONTINUE
           END-IF.
       1000-INICIO-PROG-FIN.
           EXIT.

       2000-PROCESO.
           MOVE 'SI' TO SWITCHES.
           DISPLAY 'Ingrese código de servicio (3 dígitos): '
           ACCEPT COD-SERV.
           DISPLAY 'Ingrese número de cuenta (8 dígitos): '
           ACCEPT NRO-CTA.
           DISPLAY 'Ingrese descripción de servicio (30 dígitos): '
           ACCEPT DESC-SERV.
           DISPLAY 'Ingrese periodo de facturación (6 dígitos AAAAMM): '
           ACCEPT PFAC.
           DISPLAY 'Ingrese monto de facturación: (formato: 99999.99)'
           ACCEPT MFAC.

           PERFORM 3000-GRABAR THRU 3000-GRABAR-FIN.

           DISPLAY 'Desea seguir ingresando registros? (SI o NO)'
           ACCEPT SWITCHES.
           IF SWITCHES = 'SI'
               PERFORM 2000-PROCESO
           ELSE
               CONTINUE
           END-IF.
       2000-PROCESO-FIN.
           EXIT.

       3000-GRABAR.
           WRITE REG-SERV.
           IF NOT FS-FIENTRA-OK AND FS-FIENTRA-EOF
               DISPLAY 'ERROR FS-FIENTRA: ' FS-FIENTRA
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           ELSE
               CONTINUE
           END-IF.
       3000-GRABAR-FIN.
           EXIT.

       9000-FINAL.
           CLOSE SERVICIO.
           IF NOT FS-FIENTRA-OK AND FS-FIENTRA-EOF
               DISPLAY 'ERROR: ' FS-FIENTRA
               PERFORM 9000-FINAL THRU 9000-FINAL-FIN
           ELSE
               CONTINUE
           END-IF.
       9000-FINAL-FIN.

             STOP RUN.
