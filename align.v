module align(
    input needvalC,
    input needregid,
    input inst64,
    output [3:0] rA,
    output [3:0] rB,
    output [63:0] valC;
);

assign rA = needregid ? inst64 [71:68] : 15;
assign rB = needregid ? inst64 [67:64] : 15;

assign valC = needregid = inst64 [63:0] : inst64 [71:8];