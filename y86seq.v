module y86seq (input clk);
    
reg [63:0] pc = 0;
initial pc = 0;

wire [79:0] inst;
wire [3:0] icode, ifun, dstE, dstM, srcA, srcB, ALU_fn, rA, rB;
wire [63:0] valC, valA, valB, valE, valM, ALU_A, ALU_B, addr, data, nextpc, valP;
wire needregid, cnd, read, write, set_cc;
wire [2:0] CC,CCnew;

//Getting Instruction from Instruction memory
instmem getinst(pc,clk,inst);

//Fetch stage
//split runsplit(inst,icode,ifun);
assign icode = inst [79:76];
assign ifun = inst [75:72];
align runalign(inst,needregid,rA,rB,valC);

//Register file for Decode and Write-back
registerfile runreg(dstE,dstM,valE,valM,srcA,srcB,valA,valB,clk);

//ALU instance for Execute stage
ALU run(ALU_A,ALU_B,ALU_fn,valE,CCnew);
clockreg # (3) CCreg(CC,CCnew,set_cc,1'b0,3'b0,clk);
cond runcond(ifun,CC,cnd);

//Reading and writing in Data Memory
memory runmem(addr,data,read,write,clk,valM);

//updating PC:
assign valP = pc + 1;
assign nextpc = (icode == 7 & cnd) ? valC :
 ~(icode == 0) ? valP : pc;
always @(posedge clk) begin
    if(nextpc)
        pc = nextpc;
end 

//assigning control values
assign needregid = (icode == 2 | icode == 3 | icode == 4 |
 icode == 5 | icode == 6 | icode == 10 | icode == 11) ? 1 : 0;

assign srcA = ((icode == 2 | icode == 4 | icode == 6 | icode == 10) ? rA : 
(icode == 11 | icode == 9) ? 4 : 15);

assign srcB = ((icode == 6 | icode == 4 | icode == 5) ? rB : 
(icode == 10 | icode == 11 | icode == 8 | icode == 9) ? 4 : 15);

assign dstE = (((icode == 2 & cnd == 1) | icode == 3 | icode == 6) ? rB : 
(icode == 10 | icode == 11 | icode == 8 | icode == 9) ? 4 : 14);

assign dstM = ((icode == 5 | icode == 11) ? rA : 15);

assign ALU_A = ((icode == 2 | icode == 6) ? valA : 
(icode == 3 | icode == 4 | icode == 5) ? valC : 
(icode == 8 | icode == 10) ? -8 : 
(icode == 9 | icode == 11) ? 8 : 0);

assign ALU_B = (icode == 4 | icode == 5 | icode == 6 | icode == 8 | icode == 10 | icode == 9 | icode == 11) ? valB : 0;

assign ALU_fn = icode == 6 ? ifun : 0;

assign set_cc = icode == 6 ? 1 : 0;

assign read = icode == 4 ? 1 : 0;

assign write = icode == 5 ? 1 : 0;

assign addr = (icode == 4 | icode == 5) ? valE : 32;

assign data = read ? valA : 0;

endmodule