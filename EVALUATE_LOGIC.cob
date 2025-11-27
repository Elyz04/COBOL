       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALUATE_LOGIC.
       AUTHOR. ELYZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-USER-OPTION PIC 9(01).
       01 ACT-OPTION PIC X(10).
       01 EXIT-FLAG PIC X VALUE 'N'.
       PROCEDURE DIVISION.
       MAIN.
           PERFORM INPUT-LOGIC.
           PERFORM EVALUATE-LOGIC.
           STOP RUN.
       INPUT-LOGIC.
           PERFORM UNTIL EXIT-FLAG = 'Y'
           DISPLAY "+--------------------------+"
           DISPLAY "|      EVALUATE LOGIC      |"
           DISPLAY "+--------------------------+"
           DISPLAY "YOUR OPTION: "
           WITH NO ADVANCING
           ACCEPT ACT-OPTION
           IF FUNCTION LENGTH(FUNCTION TRIM(ACT-OPTION)) = 1 
           AND ACT-OPTION(1:1) NUMERIC THEN
      *Validate case input = "ABC"
               MOVE FUNCTION NUMVAL(ACT-OPTION) TO WS-USER-OPTION
      *Validate case input = "1ABC"
               IF WS-USER-OPTION >= 1 AND WS-USER-OPTION <= 4 THEN
                   MOVE 'Y' TO EXIT-FLAG
               ELSE
                   DISPLAY "+-----------------------------------+"
                   DISPLAY "| Invalid option. Please try again. |"
                   DISPLAY "+-----------------------------------+"
               END-IF
           ELSE 
               DISPLAY "+-----------------------------------+"
               DISPLAY "| Invalid option. Please try again. |"
               DISPLAY "+-----------------------------------+"
           END-IF
           END-PERFORM. 
           EXIT.
       EVALUATE-LOGIC.
           EVALUATE WS-USER-OPTION
               WHEN 1
                   DISPLAY "EVALUATE 1"
               WHEN 2
                   DISPLAY "EVALUATE 2"
               WHEN 3
                   DISPLAY "EVALUATE 3"
               WHEN 4
                   DISPLAY "EVALUATE 4"
               WHEN OTHER
                   DISPLAY "+-----------------------------------+"
                   DISPLAY "| Invalid option. Please try again. |"
                   DISPLAY "+-----------------------------------+"
              END-EVALUATE.
           EXIT.
