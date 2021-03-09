module proc_tb;
    reg clk;
    y86seq run(.clk(clk));

    initial begin
        clk = 0;
    end

    parameter PERIOD = 1;
    always # (PERIOD) clk = ~clk;


    initial begin        
        $dumpfile("proc.vcd");
        $dumpvars(0, proc_tb);
    end
    
endmodule