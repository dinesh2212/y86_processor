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
    ALU_A = valA;
else if (icode == 6)
    ALU_A = valA;
else if (icode == 3)
    ALU_A = valC;
else if (icode == 4)
    ALU_A = valC;
else if (icode == 5)
    ALU_A = valC;
else if (icode == 8)
    ALU_A = -4;
else if (icode == 10)
    ALU_A = -4;
else if (icode == 9)
    ALU_A = 4;
else if (icode == 11)
    ALU_A = 4;

ALU_B = valB;

if(icode == 6)
    ALU_fn = ifun;
else
    ALU_fn = 0;

ALU compute(ALU_A,ALU_B,ALU_fn,valE,cout);

if (icode == 6)
    set_cc = 1;
else 
    set_cc = 0;

if (set_cc == 1) begin
    if (ALU_fn == 0) begin
        if (cout == 1)
            CC[3:3] = 1;
        else
            CC[3:3] = 0;
    end
    else if (ALU_fn == 1) begin
        if (cout = 1)
            CC [2:2] = 1;
        else 
            CC [2:2] = 0;
        CC [3:3] = 0;
    end
    else begin
        CC [3:3] = 0;
        CC [2:2] = 0;
    end 
    if(valE == 0)
        CC [1:1] = 1;
    else 
        CC [1:1] = 0;
end

cond cn(ifun,CC,cnd);