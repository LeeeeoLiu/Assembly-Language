DSEG    SEGMENT
B1      DW      1234H,5678H,8000H
B2      DW      256*16,46H,-25
B3      DW      ?,OFFSET B1
B4      DW      3 DUP (1234H)
DSEG    ENDS
        END
