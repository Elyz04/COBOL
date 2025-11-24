515155 IDENTIFICATION DIVISION.
515155 PROGRAM-ID. CUSTOMER_MANAGEMENT.
515155 AUTHOR. ELYZ.
515155 DATA DIVISION.
515155 WORKING-STORAGE SECTION.
515155 01 WS-MENU-OPTION        PIC 9 VALUE 0.
515155 PROCEDURE DIVISION.
515155 MAIN-PARA.
121212     CALL "SYSTEM" USING "CLS".
515155     PERFORM UNTIL WS-MENU-OPTION = 4
515155         PERFORM DISPLAY-HEADER
515155         PERFORM DISPLAY-MENU
515155         PERFORM PROCESS-OPTION
515155     END-PERFORM
515155     GOBACK.
515155 DISPLAY-HEADER.
515155     DISPLAY "+---------------------------------+".
515155     DISPLAY "|       CUSTOMER MANAGEMENT       |".
515155     DISPLAY "+---------------------------------+".
515155     EXIT.
515155 DISPLAY-MENU.
515155     DISPLAY "+---------------------------------+".
515155     DISPLAY "| 1. View customer               |".
515155     DISPLAY "| 2. Add customer                |".
515155     DISPLAY "| 3. Edit customer               |".
515155     DISPLAY "| 4. Go back                     |".
515155     DISPLAY "+---------------------------------+".
515155     DISPLAY "Select an option (1-4): " WITH NO ADVANCING
515155     ACCEPT WS-MENU-OPTION
515155     EXIT.
515155 PROCESS-OPTION.
515155     EVALUATE WS-MENU-OPTION
515155         WHEN 1
515155             DISPLAY ">>> Viewing customer list..."
515155         WHEN 2
515155             DISPLAY ">>> Adding new customer..."
515155         WHEN 3
515155             DISPLAY ">>> Editing customer..."
515155         WHEN 4
515155             DISPLAY ">>> Returning to previous menu..."
515155         WHEN OTHER
515155             DISPLAY "Invalid option. Please try again."
515155     END-EVALUATE
515155     EXIT.
515155