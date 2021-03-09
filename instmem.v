module instmem(
    input [63:0] pc,
    input clk,
    output [79:0] inst
);

wire [79:0] I1, I2, I3, I4, I5, I6, I7, I8, I9, I10;

//Instruction hardcoded as 10bytes in hexadecimal
clockreg # (80) I1reg(I1, 80'h30f3000000000000000c, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I2reg(I2, 80'h30f40000000000000008, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I3reg(I3, 80'h20350000000000000000, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I4reg(I4, 80'h20460000000000000000, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I5reg(I5, 80'h61450000000000000000, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I6reg(I6, 80'h26540000000000000000, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I7reg(I7, 80'h61360000000000000000, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I8reg(I8, 80'h26630000000000000000, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I9reg(I9, 80'h74000000000000000002, 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I10reg(I10, 80'h0, 1'b1, 1'b0, 80'b0, clk);

assign inst = pc == 0 ? I1 :
pc == 1 ? I2 :
pc == 2 ? I3 :
pc == 3 ? I4 :
pc == 4 ? I5 :
pc == 5 ? I6 :
pc == 6 ? I7 :
pc == 7 ? I8 :
pc == 8 ? I9 : 
pc == 9 ? I10 : 0;

/*
The instruction is for finding HCF of two numbers (8 and 12 in this case).
The code in y86:
irmovq 8 r3
irmovq 12 r4
rrmovq r3 r5
rrmovq r4 r6
subq r4 r5
cmovg r5 r4
subq r3 r6
cmov r6 r3
jmpne 2
*/

endmodule