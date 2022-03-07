      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG7.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01  CTA-CTE.
               02  COD-SUCURSAL        PIC 9(3).
               02  FILLER              PIC X VALUE '-'.
               02  COD-PRODUCTO        PIC 9(2).
                   88  COD-CAJA-AHORRO     VALUE 40.
                   88  COD-PRES-PRENDARIO  VALUE 50.
                   88  COD-PRES-HIPOTEC    VALUE 60.
                   88  COD-CUENTA-CTE      VALUE 45.
               02  FILLER              PIC X VALUE '-'.
               02  COD-CTA-CTE          PIC 9(5).
               02  FILLER              PIC X VALUE '-'.
               02  COD-VERIFICADOR     PIC 9(1).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            STOP RUN.
