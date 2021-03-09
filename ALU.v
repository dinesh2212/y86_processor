module ALU(
    input [63:0] ALU_A,
    input [63:0] ALU_B,
    input [3:0] ALU_fn,
    output [63:0] valE,
    output [2:0] CCnew
);

assign valE = ALU_fn == 0 ? ALU_A + ALU_B :
ALU_fn == 1 ? ALU_A - ALU_B :
ALU_fn == 2 ? ALU_A & ALU_B : ALU_A ^ ALU_B; 
assign CCnew[2] = valE == 0 ? 1 : 0; 
assign CCnew[1] = valE[63] == 1 ? 1 : 0;
assign CCnew[0] = ALU_fn == 0 ?   ((ALU_A[63] == ALU_B[63]) & valE[63] != ALU_A[63]) :
ALU_fn == 1 ? (ALU_A[63] != ALU_B[63]) & (ALU_B[63] != valE[63]) : 0;

endmodule