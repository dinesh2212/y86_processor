module cond(
    input [3:0] ifun,
    input [2:0] CC,
    output cnd;
);

parameter ZF = CC [2];
parameter SF = CC [1];
parameter OF = CC [0];

assign cnd = ifun == 0 ? 1 :
ifun == 1 ? (SF ^ OF) | ZF :
ifun == 2 ? SF ^ OF :
ifun == 3 ? ZF :
ifun == 4 ? ~ZF :
ifun == 5 ? ~(SF ^ OF) : ~(SF ^ OF) & ~ZF ;