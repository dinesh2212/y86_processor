module instmem(
    input [63:0] pc,
    input clk,
    output [79:0] inst;
)

wire [79:0] I1, I2, I3, I4, I5, I6, I7, I8, I9, I10;

clockreg # (80) I1reg(I1, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I2reg(I2, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I3reg(I3, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I4reg(I4, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I5reg(I5, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I6reg(I6, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I7reg(I7, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I8reg(I8, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I9reg(I9, , 1'b1, 1'b0, 80'b0, clk);
clockreg # (80) I10reg(I10, , 1'b1, 1'b0, 80'b0, clk);

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

endmodule