       IDENTIFICATION DIVISION.
       PROGRAM-ID. math1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 taikhoan PIC X(20).
       01 matkhau PIC X(20).
       01 dangnhapthanhcong PIC X(9) VALUE 'N'.
       01 gioihandangnhap PIC 9 VALUE 3.
       01 solanthu PIC 9 VALUE 1.
       PROCEDURE DIVISION.
           PERFORM UNTIL dangnhapthanhcong = 'Y'
           DISPLAY "NHAP VAO TAI KHOAN: "
           ACCEPT taikhoan
           DISPLAY "NHAP VAO MAT KHAU: "
           ACCEPT matkhau
           IF matkhau = "1234" AND taikhoan = "A"
                   DISPLAY "DANG NHAP THANH CONG"
                   MOVE "Y" TO dangnhapthanhcong
           ELSE 
               DISPLAY "SAI TAI KHOAN HOAC MAT KHAU"
               DISPLAY "============================"
               ADD 1 TO solanthu
               IF solanthu > gioihandangnhap THEN
             DISPLAY "NHAP SAI QUA NHIEU LAN! "
             STOP RUN
                END-IF
            END-IF
           END-PERFORM.
           STOP RUN.
