module ALU(
    input [63:0] ALU_A,
    input [63:0] ALU_B,
    input [3:0] ALU_fn,
    output [63:0] valE,
);

assign valE = ALU_fn == 0 ? ALU_A + ALU_B :
ALU_fn == 1 ? ALU_A - ALU_B :
ALU_fn == 2 ? ALU_A & ALU_B : ALU_A ^ ALU_B; 