module ALU(
    input [63:0] ALU_A,
    input [63:0] ALU_B,
    input [3:0] ALU_fn,
    output [63:0] valE,
    output car;
)

if (ALU_fn == 0)
    assign {car,valE} = {1'b0,ALU_A} + {1'b0,ALU_B};
else if (ALU_fn == 1)
    assign {car,valE} = {1'b0,ALU_A} - {1'b0,ALU_B};
else if (ALU_fn == 2) begin
    valE = ALU_A & ALU_B;
    car = 0;
end
else if (ALU_fn == 3) begin
    valE = ALU_A ^ ALU_B;
    car = 0;
end