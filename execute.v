module execute(
    input [3:0] icode,
    input [3:0] ifun,
    input [63:0] valA,
    input [63:0] valB,
    input [63:0] valC,
    output [63:0] valE,
    output cnd;
)

wire [63:0] ALU_A;
wire [63:0] ALU_B;
wire [3:0] ALU_fn;
wire set_cc;
reg [2:0] CC;

if (icode == 2)
assign ALU_A = icode == 2 ? valA : 
icode == 6 ? valA :
icode == 3 ? valC :
icode == 4 ? valC :
icode == 5 ? valC :
icode == 8 ? -4 :
icode == 10 ? -4
icode == 9 ? 4 :
icode == 11 ? 4 : 0;

ALU_B = valB;

assign ALU_fn = icode == 6 ? ifun : 0;

ALU compute(ALU_A,ALU_B,ALU_fn,valE,cout);

if (icode == 6)
    set_cc = 1;
else 
    set_cc = 0;

assign CC[2] = valE == 0 ? 1 : 0;
assign CC[1] = valE[63] == 1 ? 1 : 0;
assign CC[0] = fun == 0 ? 
((a[63] == b[63]) & valE[63] != a[63]) :
ifun == 1 ? (a[63] != b[63]) & (b[63] != valE[63]) : 0;

cond cn(ifun,CC,cnd);