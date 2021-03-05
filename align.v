module align(
    input needvalC,
    input needregid,
    input inst64,
    output [3:0] rA,
    output [3:0] rB,
    output [63:0] valC;
)

if(needregid == 0) begin
    rA = 15;
    rB = 15;
    valC = inst64 [71:8];
end

else if(needregid == 1) begin
    rA = inst64 [71:68];
    rB = inst64 [67:64];
    valC = inst64 [63:0];
end
