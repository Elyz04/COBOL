       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATH1.
       AUTHOR. ELYZ.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-USERS.
          03 WS-USER-TABLE OCCURS 3 TIMES INDEXED BY I.
             05 WS-USER-ID      PIC 9(06).
             05 WS-USERNAME     PIC X(20).
             05 WS-PASSWORD     PIC X(20).

       01 WS-INPUT-USERNAME PIC X(20).
       01 WS-INPUT-PASSWORD PIC X(20).
       01 WS-FOUND          PIC X VALUE 'N'.
       01 WS-ATTEMPTS       PIC 9 VALUE 1.
       01 WS-MAX-ATTEMPTS   PIC 9 VALUE 3.

       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM INITIALIZE-ACCOUNTS
           PERFORM USER-LOGIN
           EXIT PROGRAM.

       INITIALIZE-ACCOUNTS.
           MOVE "ACC1"   TO WS-USERNAME(1)
           MOVE "123"    TO WS-PASSWORD(1)

           MOVE "ACC2"   TO WS-USERNAME(2)
           MOVE "1234"   TO WS-PASSWORD(2)

           MOVE "ACC3"   TO WS-USERNAME(3)
           MOVE "12345"  TO WS-PASSWORD(3)
           EXIT.

       USER-LOGIN.
           PERFORM UNTIL WS-FOUND = "Y" OR WS-ATTEMPTS > WS-MAX-ATTEMPTS
               DISPLAY "Enter Username: " WITH NO ADVANCING
               ACCEPT WS-INPUT-USERNAME

               DISPLAY "Enter Password: " WITH NO ADVANCING
               ACCEPT WS-INPUT-PASSWORD

               MOVE "N" TO WS-FOUND

               PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3 
               OR WS-FOUND = "Y"
                   IF WS-INPUT-USERNAME = WS-USERNAME(I)
                      AND WS-INPUT-PASSWORD = WS-PASSWORD(I)
                      MOVE "Y" TO WS-FOUND
                   END-IF
               END-PERFORM

               IF WS-FOUND = "Y"
                   DISPLAY "Login successful! Welcome, " 
                   WS-INPUT-USERNAME "."
               ELSE
                   DISPLAY "Invalid credentials, please try again."
                   ADD 1 TO WS-ATTEMPTS
                   IF WS-ATTEMPTS > WS-MAX-ATTEMPTS
                       DISPLAY "Too many failed attempts. Exiting..."
                       STOP RUN
                   END-IF
               END-IF

           END-PERFORM
           EXIT.
