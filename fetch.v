module fetch(
    input [79:0] inst64,
    output [3:0] icode,
    output [3:0] ifun,
    output [3:0] rA,
    output [3:0] rB,
    output [63:0] valC,
    output needregid,
    output needvalC,
    output instvalid;
);

icode = inst64 [79:76];
ifun = inst64 [75:72];
instvalid = 1;
needs getval(icode,needvalC,needregid);
align doalign(needvalC,needregid,inst64,rA,rB,valC);