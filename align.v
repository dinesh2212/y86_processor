module align (
    inst, needregid, rA, rB, valC
);
input [79:0] inst;
output [3:0] rA, rB;
output [63:0] valC;
input needregid;

assign rA = needregid ? inst[71:68] : 15;
assign rB = needregid ? inst[67:64] : 15;

assign valC = inst[63:0];
endmodule