000000 IDENTIFICATION             DIVISION.
000000 PROGRAM-ID.                EVALUATE_LOGIC.
000000 AUTHOR.                    ELYZ.
000000 DATA                       DIVISION.
000000 WORKING-STORAGE            SECTION.
000000******************************************************************
000000 01 WS-USER-OPTION          PIC 9(01).
000000 01 ACT-OPTION              PIC X(10).
000000 01 EXIT-FLAG               PIC X VALUE 'N'.
000000******************************************************************
000000 PROCEDURE                  DIVISION.
000000******************************************************************
000000 MAIN.
000000     PERFORM                INPUT-LOGIC.
000000     PERFORM                EVALUATE-LOGIC.
000000     STOP                   RUN.
000000******************************************************************
000000 INPUT-LOGIC.
000000     PERFORM UNTIL          EXIT-FLAG = 'Y'
000000         DISPLAY "+--------------------------+"
000000         DISPLAY "|      EVALUATE LOGIC      |"
000000         DISPLAY "+--------------------------+"
000000         DISPLAY "YOUR OPTION: "
000000         WITH NO ADVANCING
000000         ACCEPT ACT-OPTION
000000         IF FUNCTION LENGTH(FUNCTION TRIM(ACT-OPTION)) = 1 
000000         AND ACT-OPTION(1:1) NUMERIC THEN
000000*Validate case input = "ABC"
000000             MOVE FUNCTION NUMVAL(ACT-OPTION) 
000000                            TO 
000000                                  WS-USER-OPTION
000000*Validate case input = "1ABC"
000000             IF WS-USER-OPTION >= 1 AND WS-USER-OPTION <= 4 THEN
000000             MOVE 'Y'     
000000                            TO 
000000                  EXIT-FLAG
000000             ELSE
000000                 DISPLAY "+-----------------------------------+"
000000                 DISPLAY "| Invalid option. Please try again. |"
000000                 DISPLAY "+-----------------------------------+"
000000             END-IF
000000         ELSE 
000000             DISPLAY "+-----------------------------------+"
000000             DISPLAY "| Invalid option. Please try again. |"
000000             DISPLAY "+-----------------------------------+"
000000         END-IF
000000     END-PERFORM. 
000000     EXIT.
000000******************************************************************
000000 EVALUATE-LOGIC.
000000     EVALUATE WS-USER-OPTION
000000         WHEN 1
000000             DISPLAY "EVALUATE 1"
000000         WHEN 2
000000             DISPLAY "EVALUATE 2"
000000         WHEN 3
000000             DISPLAY "EVALUATE 3"
000000         WHEN 4
000000             DISPLAY "EVALUATE 4"
000000         WHEN OTHER
000000             DISPLAY "+-----------------------------------+"
000000             DISPLAY "| Invalid option. Please try again. |"
000000             DISPLAY "+-----------------------------------+"
000000         END-EVALUATE.
000000     EXIT.
000000******************************************************************
000000