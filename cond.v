module cond(
    input [3:0] ifun,
    input [2:0] CC,
    output cnd;
)

reg OF = CC [3:3];
reg SF = CC [2:2];
reg ZF = CC [1:1];

if (ifun == 0)
    cnd = 1;
else if (ifun == 1)
    cnd = (SF ^ OF) | ZF;
else if (ifun == 2)
    cnd = SF ^ OF;
else if (ifun == 3)
    cnd = ZF;
else if (ifun == 4)
    cnd = ~ZF;
else if (ifun == 5)
    cnd = ~(SF ^ OF);
else if (ifun == 6)
    cnd = ~(SF ^ OF) & ~ZF;