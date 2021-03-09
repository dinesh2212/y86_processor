module memory(addr, data, read, write, clk, valM);

input [63:0] addr, data;
input read, write, res, clk;
//output memerr;
output [63:0] valM;
wire [63:0] M1, M2, M3, M4, M5, M6, M7, M8, M9, M10,
M11, M12, M13, M14, M15, M16, M17, M18, M19, M20;

wire [63:0] mvalM, M1_dat, M2_dat, M3_dat, M4_dat, M5_dat, M6_dat,
M7_dat, M8_dat, M9_dat, M10_dat, M11_dat, M12_dat, M13_dat,
M14_dat, M15_dat, M16_dat, M17_dat, M18_dat, M19_dat, M20_dat;

wire M1_wrt, M2_wrt, M3_wrt, M4_wrt, M5_wrt, M6_wrt,
M7_wrt, M8_wrt, M9_wrt, M10_wrt, M11_wrt, M12_wrt, M13_wrt,
M14_wrt, M15_wrt, M16_wrt, M17_wrt, M18_wrt, M19_wrt, M20_wrt;

clockreg # (64) M1reg(M1, M1_dat, M1_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M2reg(M2, M2_dat, M2_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M3reg(M3, M3_dat, M3_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M4reg(M4, M4_dat, M4_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M5reg(M5, M5_dat, M5_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M6reg(M6, M6_dat, M6_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M7reg(M7, M7_dat, M8_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M8reg(M8, M8_dat, M8_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M9reg(M9, M9_dat, M9_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M10reg(M10, M10_dat, M10_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M11reg(M11, M11_dat, M11_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M12reg(M12, M12_dat, M12_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M13reg(M13, M13_dat, M13_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M14reg(M14, M14_dat, M14_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M15reg(M15, M15_dat, M15_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M16reg(M16, M16_dat, M16_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M17reg(M17, M17_dat, M17_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M18reg(M18, M18_dat, M18_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M19reg(M19, M19_dat, M19_wrt, 1'b0, 64'b0, clk);
clockreg # (64) M20reg(M20, M20_dat, M20_wrt, 1'b0, 64'b0, clk);

assign mvalM = addr == 1 ? M1 :
addr == 2 ? M2 :
addr == 3 ? M3 :
addr == 4 ? M4 :
addr == 5 ? M5 :
addr == 6 ? M6 :
addr == 7 ? M7 :
addr == 8 ? M8 :
addr == 9 ? M9 :
addr == 10 ? M10 :
addr == 11 ? M11 :
addr == 12 ? M12 :
addr == 13 ? M13 :
addr == 14 ? M14 :
addr == 15 ? M15 :
addr == 16 ? M16 :
addr == 17 ? M17 :
addr == 18 ? M18 :
addr == 19 ? M19 : 
addr == 20 ? M20 : 0;

assign valM = read == 1 ? mvalM : 0;

assign M1_dat = data;
assign M2_dat = data;
assign M3_dat = data;
assign M4_dat = data;
assign M5_dat = data;
assign M6_dat = data;
assign M7_dat = data;
assign M8_dat = data;
assign M9_dat = data;
assign M10_dat = data;
assign M11_dat = data;
assign M12_dat = data;
assign M13_dat = data;
assign M14_dat = data;
assign M15_dat = data;
assign M16_dat = data;
assign M17_dat = data;
assign M18_dat = data;
assign M19_dat = data;
assign M20_dat = data;

assign M1_wrt = addr == 1 ? 1 : 0;
assign M2_wrt = addr == 2 ? 1 : 0;
assign M3_wrt = addr == 3 ? 1 : 0;
assign M4_wrt = addr == 4 ? 1 : 0;
assign M5_wrt = addr == 5 ? 1 : 0;
assign M6_wrt = addr == 6 ? 1 : 0;
assign M7_wrt = addr == 7 ? 1 : 0;
assign M8_wrt = addr == 8 ? 1 : 0;
assign M9_wrt = addr == 9 ? 1 : 0;
assign M10_wrt = addr == 10 ? 1 : 0;
assign M11_wrt = addr == 11 ? 1 : 0;
assign M12_wrt = addr == 12 ? 1 : 0;
assign M13_wrt = addr == 13 ? 1 : 0;
assign M14_wrt = addr == 14 ? 1 : 0;
assign M15_wrt = addr == 15 ? 1 : 0;
assign M16_wrt = addr == 16 ? 1 : 0;
assign M17_wrt = addr == 17 ? 1 : 0;
assign M18_wrt = addr == 18 ? 1 : 0;
assign M19_wrt = addr == 19 ? 1 : 0;
assign M20_wrt = addr == 20 ? 1 : 0;

endmodule