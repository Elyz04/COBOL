012122 IDENTIFICATION                  DIVISION.
916637 PROGRAM-ID.                     LOGIN.
646646 AUTHOR.                         ELYZ.
646466******************************************************************
916637 DATA                            DIVISION.
916637 WORKING-STORAGE                 SECTION.
636366 01  WS-USERNAME                 PIC X(20).
828282 01  WS-PASSWORD                 PIC X(20).
616161 01  WS-LIMIT-ATTEMPTS           PIC 9       VALUE    3.
818181 01  WS-ATTEMPT-COUNT            PIC 9       VALUE    0.
818188 01  WS-LOGIN-SUCCESS            PIC X       VALUE    'N'.
121212 01  WS-WAITED-FLG               PIC X.
646466******************************************************************
916637 PROCEDURE                       DIVISION.
646466******************************************************************
737373 MAIN-PARA.
646466     PERFORM         DISPLAY-HEADER.
757577     PERFORM         LOGIN-PROCESS.
656656     EXIT            PROGRAM.
646466******************************************************************
916637 DISPLAY-HEADER.
916637     DISPLAY "+-----------------------+".
232882     DISPLAY "|         LOGIN         |".
916637     DISPLAY "+-----------------------+".
646466     EXIT.
646466******************************************************************
646464 LOGIN-PROCESS.
646464     PERFORM UNTIL WS-LOGIN-SUCCESS = 'Y'
646464         OR WS-ATTEMPT-COUNT >= WS-LIMIT-ATTEMPTS
646464         DISPLAY "Enter Username: " WITH NO ADVANCING
646464         ACCEPT WS-USERNAME
646464         DISPLAY "Enter Password: " WITH NO ADVANCING
646464         ACCEPT WS-PASSWORD
141444         PERFORM DISPLAY-MESSAGE
646464     END-PERFORM.
646466     EXIT.
646466******************************************************************
665656 DISPLAY-MESSAGE.
646646     IF      WS-USERNAME = "admin" 
646466         AND WS-PASSWORD = "1234" THEN
916637         DISPLAY "+----------------------------------+"
232882         DISPLAY "|         LOGIN SUCCESSFUL         |"
916637         DISPLAY "+----------------------------------+"
545545         MOVE 'Y' TO WS-LOGIN-SUCCESS
646464         CALL "MENU_MANAGEMENT"
656566     ELSE
916637         DISPLAY "+----------------------------------+"
232882         DISPLAY "|          LOGIN FAILED            |" 
916637         DISPLAY "+----------------------------------+"
757573         ADD 1 TO WS-ATTEMPT-COUNT
747474         IF WS-ATTEMPT-COUNT = 3 THEN
646464             DISPLAY "Too many failed attemps. Exiting program."
656565             STOP RUN
515155         END-IF
656566     END-IF.
515155     PERFORM CONTINUE-RUN.
916637     EXIT.
646466******************************************************************
656565 CONTINUE-RUN.
515155     DISPLAY "Press enter to continue..." 
515155     WITH NO ADVANCING
515155     ACCEPT WS-WAITED-FLG.
515155     EXIT.
646466******************************************************************
151555