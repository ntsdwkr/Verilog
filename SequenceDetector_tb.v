`timescale 1s/100ms
`include "SeqDet.v"
module SeqDet_tb;
    reg in_bit,clk,reset;
    wire out;
    Mealy_1011 N36 (.in_bit(in_bit), .clk(clk), .reset(reset), .out(out) );
    
initial
begin
    $monitor("time = %0t || input = %0b || output = %0b", $time, in_bit, out);
    $dumpfile("SeqDet.vcd");
    $dumpvars;
        clk = 1'b0;
        reset = 1'b1;
        #15 reset = 1'b0; 
end

always #5 clk = ~ clk;  

initial 
begin
        #12 in_bit = 0;#10 in_bit = 0 ; #10 in_bit = 1 ; #10 in_bit = 0 ;
        #12 in_bit = 1;#10 in_bit = 1 ; #10 in_bit = 0 ; #10 in_bit = 1 ;
        #12 in_bit = 1;#10 in_bit = 0 ; #10 in_bit = 0 ; #10 in_bit = 1 ; 
        #12 in_bit = 0;#10 in_bit = 1 ; #10 in_bit = 1 ; #10 in_bit = 0 ; 
        #12 $finish; 
end 
      
    
endmodule
