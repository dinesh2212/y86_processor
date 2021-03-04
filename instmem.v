module instmem(
    input [79:0] pc,
    input clk,
    output [79:0] inst;
)

initial
    inst = 

always @(negedge clk)
case (pc)
    16'd0:
        inst <= 
    16'd1:
        inst <= 
    16'd2:
        inst <= 
    16'd3:
        inst <= 
    16'd4:
        inst <= 
    16'd5:
        inst <= 
    16'd6:
        inst <= 
    16'd7:
        inst <= 
    16'd8:
        inst <= 
    default: inst <= 
endcase

endmodule