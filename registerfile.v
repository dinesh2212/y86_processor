module registerfile (dstE, dstM, valE, valM, srcA, srcB, valA, valB, clk);

input [3:0] dstE, dstM, srcA, srcB;
input [63:0] valE, valM;
output [63:0] valA, valB;
input res, clk;

wire [63:0] rax, rcx, rdx, rbx, rsp, rbp, rsi, rdi,
r8, r9, r10, r11, r12, r13, r14;

wire [63:0] rax_dat, rcx_dat, rdx_dat, rbx_dat, rsp_dat, rbp_dat, 
rsi_dat, rdi_dat, r8_dat, r9_dat, r10_dat, r11_dat, r12_dat, 
r13_dat, r14_dat;

wire rax_wrt, rcx_wrt, rdx_wrt, rbx_wrt, rsp_wrt, rbp_wrt, 
rsi_wrt, rdi_wrt, r8_wrt, r9_wrt, r10_wrt, r11_wrt, r12_wrt, 
r13_wrt, r14_wrt;

clockreg # (64) raxreg(rax, rax_dat, rax_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rcxreg(rcx, rcx_dat, rcx_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rdxreg(rdx, rdx_dat, rdx_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rbxreg(rbx, rbx_dat, rbx_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rspreg(rsp, rsp_dat, rsp_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rbpreg(rbp, rbp_dat, rbp_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rsireg(rsi, rsi_dat, rsi_wrt, 1'b0, 64'b0, clk);
clockreg # (64) rdireg(rdi, rdi_dat, rdi_wrt, 1'b0, 64'b0, clk);
clockreg # (64) r8reg(r8, r8_dat, r8_wrt, res, 64'b0, clk);
clockreg # (64) r9reg(r9, r9_dat, r9_wrt, res, 64'b0, clk);
clockreg # (64) r10reg(r10, r10_dat, r10_wrt, 1'b0, 64'b0, clk);
clockreg # (64) r11reg(r11, r11_dat, r11_wrt, 1'b0, 64'b0, clk);
clockreg # (64) r12reg(r12, r12_dat, r12_wrt, 1'b0, 64'b0, clk);
clockreg # (64) r13reg(r13, r13_dat, r13_wrt, 1'b0, 64'b0, clk);
clockreg # (64) r14reg(r14, r14_dat, r14_wrt, 1'b0, 64'b0, clk);

assign valA = srcA == 0 ? rax :
srcA == 1 ? rcx :
srcA == 2 ? rdx :
srcA == 3 ? rbx :
srcA == 4 ? rsp :
srcA == 5 ? rbp :
srcA == 6 ? rsi :
srcA == 7 ? rdi :
srcA == 8 ? r8 :
srcA == 9 ? r9 :
srcA == 10 ? r10 :
srcA == 11 ? r11 :
srcA == 12 ? r12 :
srcA == 13 ? r13 :
srcA == 14 ? r14 : 0;

assign valB = srcB == 0 ? rax :
srcB == 1 ? rcx :
srcB == 2 ? rdx :
srcB == 3 ? rbx :
srcB == 4 ? rsp :
srcB == 5 ? rbp :
srcB == 6 ? rsi :
srcB == 7 ? rdi :
srcB == 8 ? r8 :
srcB == 9 ? r9 :
srcB == 10 ? r10 :
srcB == 11 ? r11 :
srcB == 12 ? r12 :
srcB == 13 ? r13 :
srcB == 14 ? r14 : 0;    

assign rax_dat = dstM == 0 ? valM : valE;
assign rcx_dat = dstM == 1 ? valM : valE;
assign rdx_dat = dstM == 2 ? valM : valE;
assign rbx_dat = dstM == 3 ? valM : valE;
assign rsp_dat = dstM == 4 ? valM : valE;
assign rbp_dat = dstM == 5 ? valM : valE;
assign rsi_dat = dstM == 6 ? valM : valE;
assign rdi_dat = dstM == 7 ? valM : valE;
assign r8_dat = dstM == 8 ? valM : valE;
assign r9_dat = dstM == 9 ? valM : valE;
assign r10_dat = dstM == 10 ? valM : valE;
assign r11_dat = dstM == 11 ? valM : valE;
assign r12_dat = dstM == 12 ? valM : valE;
assign r13_dat = dstM == 13 ? valM : valE;
assign r14_dat = dstM == 14 ? valM : valE;

assign rax_wrt = dstM == 0 | dstE == 0; 
assign rcx_wrt = dstM == 1 | dstE == 1;
assign rdx_wrt = dstM == 2 | dstE == 2;
assign rbx_wrt = dstM == 3 | dstE == 3;
assign rsp_wrt = dstM == 4 | dstE == 4;
assign rbp_wrt = dstM == 5 | dstE == 5;
assign rsi_wrt = dstM == 6 | dstE == 6;
assign rdi_wrt = dstM == 7 | dstE == 7;
assign r8_wrt = dstM == 8 | dstE == 8;
assign r9_wrt = dstM == 9 | dstE == 9;
assign r10_wrt = dstM == 10 | dstE == 10;
assign r11_wrt = dstM == 11 | dstE == 11;
assign r12_wrt = dstM == 12 | dstE == 12;
assign r13_wrt = dstM == 13 | dstE == 13;
assign r14_wrt = dstM == 14 | dstE == 14;

endmodule