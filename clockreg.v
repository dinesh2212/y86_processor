module clockreg(out, in, en, res, resval, clk);
    parameter size = 8;
    output [size-1:0] out;
    reg [size-1:0] out;
    input [size-1:0] in;
    input en, res, clk;
    input [size-1:0] resval;


parameter size = 8;
always @(posedge clk) begin
    if (res)
        out <= resval;
    else if(en)
        out <= in;
    end
endmodule