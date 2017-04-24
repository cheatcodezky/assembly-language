MOV A,#20H
MOV A,R0 (R0~R7)
MOV A,20H
MOV A,@R1(R0,R1,DPTR)
MOVC A,@A+DPTR



MOV A,Rn
MOV A,direct
MOV A,#data


MOV Rn,A
MOV Rn,direct
MOV Rn,#data


MOV direct,A
MOV direct,Rn
MOV direct,direct
MOV direct,@Ri;
MOV direct,#data;

MOVX A,@DPTR
MOVX @DPTR,A
MOVX A,@Ri
MOVX @Ri,A


MOV A,R0;
MOV R6,A;

MOV A,30H
MOV R0,#60H
MOVX @R0,A


MOV DPTR,#1000H
MOVX A,@DPTR
MOV 20H,A

MOV A,#0
MOV DPTR,#2000H
MOVC A,@A+DPTR
MOV 30H,A

XCH A,Rn
XCH A,direct
XCH A,@Ri

PUSH A
PUSH B

POP B
POP A


ADD A,Rn
ADD A,direct
ADD A,@Ri
ADD A,#data

ADDC A,Rn
ADDC A,direct
ADDC A,@Ri
ADDC A,#data
(CY AC OV P)

INC A
INC Rn
INC direct
INC @Ri
INC DPTR
(P)

MOV A,R2
ADD A,R4
MOV R6,A
MOV A,R1
ADDC A,R4
MOV R5,A

SUBB A,Rn
SUBB A,direct
SUBB A,@Ri
SUBB A,#data

DEC A
DEC Rn
DEC direct
DEC @Ri


MOV A,R2
CLR C
SUBB A,R1
MOV R3,A

MUL AB(A LOW B HIGH)
(CY OV 255)

DIV AB(A LOW B HIGH)
(CY OV 0 0)


DA A

MOV A,R3
ADD A,R2
DA A
MOV R5,A

ANL A,Rn
ANL A,direct
ANL A,@Ri
ANL A,#data
ANL direct,A
ANL direct,#data


ORL A,Rn
ORL A,direct
ORL A,@Ri
ORL A,#data
ORL direct,A
ORL direct,#data
ORL direct,#data

XRL A,Rn
XRL A,direct
XRL A,@Ri
XRL A,#data
XRL direct,A
XRL direct,#data


ANL A,#11010101B


ANL A,#01010100B
ORL A,Rn
ORL A,direct
ORL A,@Ri
ORL A,#data


RL A
RR A
RLC A
RRC A

LJMP addr16
AJMP addr11
SJMP rel


LJMP addr16
AJMP addr11
SJMP rel
(PC <-  PC +2 + rel)
JMP @A+DPTR
JZ rel 
JNZ rel 
        MOV R0,#30H
        MOV R1,#40H
LOOP:   MOVX A,@R0
        MOV @R1,A
        INC R1
        INC R0
        JNZ LOOP
        SJMP $


        CJNE A,#data,rel
        CJNE Rn,#data,rel
        CJNE @Ri,#data,rel
        CJNE A,direct,rel
        
        
        DJNZ Rn,rel
        DJNZ direct,rel
        
        
        MOV R0,#30H
        MOV R2,#20
        MOV R7,#0
LOOP:   MOV A,@R0
        CJNE A,#0,NEXT
        INC R7
NEXT    INC R0
        DJNZ R2,LOOP
        SJMP $
        
        
        LCALL addr16
        ACALL addr11
        RET
        RETI
        MOV C,bit
        MOV bit,C
        MOV C,20H
        MOV 30H,C
        
        CLR C
        CLR bit
        
        SETB C
        SETB bit
        
        CPL C
        CPL bit
        
        ANL C,bit
        ANL C,/bit
        ORL C,bit
        ORL C,/bit
        
        MOV C,P1.0
        ANL C,P1.1
        CPL C
        ORL C,/P1.2
        MOV F0,C
        MOV C,P1.3
        ORL C,P1.4
        CPL C
        MOV P1.5,C
        SJMP $
        
        JC rel
        JNC rel
        
        JB bit,rel
        JNB bit,rel
        JBC bit,rel
        
        JC rel
        JNC rel
        JB bit,rel
        JNB bit,rel
        JBC bit,rel
        
        
        
        MOV R2,#100
        MOV R0,#30H
        MOV R5,#0
        MOV R6,#0
        MOV R7,#0
LOOP:   MOVX A,@R0
        CJNE A,#0,NEXT1
        INC R6
        SJMP NEXT3
NEXT1:  CLR C
        SUBB A,#80H
        JC NEXT2
        INC R7
        SJMP NEXT3
NEXT2:  INC R5
NEXT3   INC R0
        DJNZ R2,LOOP
        SJMP $
        
        
        
        
        NOP
        
        ORG 1000H
START:  MOV A,#7FH
        
        
        DB
        
        
        DW
        
        
        
        DS
        
        
        ORG 3000H
TAB1:   DB 12H,34H
        DS 4H
        DB '5'
        
        
        TAB1 EQU 1000H
        TAB2 EQU 2000H
        
        RESULT DATA 60H
        
        
        MOV RESULT,A
        
        
        PORT1 XDATA 2000H
        
        
        
        MOV DPTR 60H
        MOV RESULT,A
        
        
        PLG bit F0
        A1 bit P1.0
        END
        
        
        
        
        
        ORG 0000H
        LJMP MAIN
MAIN:   ORG 0100H
        MOV R0,#40H
        MOV DPTR,#2000H
        MOV R2,#16
LOOP:   MOV A,@R0
        MOVX @DPTR,A
        INC R0
        INC DPTR
        DJNZ R2,LOOP
        SJMP $
        END
        
        
        
        ORG 0000H
        LJMP MAIN
        
MAIN:   ORG 0100H
        MOV R0,#30H
        MOV R1,#40H
        MOV R2,#16
        CLR C
LOOP:   MOV A,@R1
        ADDC A,@R1
        MOV @R0,A
        INC R0
        INC R1
        DJNZ R2,LOOP
        SJMP $
        END
        
        
        ORG 0000H
        LJMP MAIN
        
MAIN:   ORG 1000H
        MOV R0,#30H
        MOV R1,#40H
        MOV R2,#16
        CLR C
LOOP:   MOV A,@R0
        SUBB A,@R1
        MOV @R0,A
        INC R0
        INC R1
        DJNZ R2,LOOP
        SJMP $
        END
        
        
        ORG 0000H
        LJMP MAIN
        
MAIN:   ORG 0100H
        MOV R0,#ADDR
MUL1:   MOV A,R6
        MOV B,R4
        MUL AB
        MOV @R0,A
        MOV R3,B
MUL2:   MOV A,R7
        MOV B,R4
        MUL AB
        ADD A,R3
        MOV R3,A
        MOV A,B
        ADDC A,#00
        MOV R2,A
MUL3:   MOV A,R6
        MOV B,R5
        MUL AB
        ADD A,R3
        INC R0
        MOV @R,A
        MOV A,R2
        ADDC A,B
        MOV R2,A
        MOV A,#00
        MOV R1,A
MUL4:   MOV A,R7
        MOV B,R5
        MUL AB
        ADD A,R2
        INC R0
        MOV @R0,A
        MOV A,B
        ADDC A,R1
        INC R0
        MOV @R0,A
        SJMP $
        END
        
        
        
        ORG 1000H
        MOV R2,#08H
        MOV R0,#30H
        MOV A,@R0
        CPL A
        ADD A,#01
        MOV @R0,A
        DEC R2
LOOP:   INC R0
        MOV A,@R0
        CPL A
        ADDC A,#00
        MOV @R0,A
        CPL A
        ADDC A,#00
        MOV @R0,A
        DJNZ R2,LOOP
        RET

        ORG 0200H
        MOV A,R2
        CLR C
        SUBB A,#07H
        MOV A,R2
        JC ADD30
        ADD A,#07H
ADD30:  ADD A,#03H
        MOV R2,A
        RET




