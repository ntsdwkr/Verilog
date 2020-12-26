`timescale 1s/100ms
`include "Moore110.v"
module Moore110_tb;
    reg in_bit,clk,reset; 
    wire out;
   Moore110 DUT (.in_bit(in_bit), .clk(clk), .reset(reset), .out(out) ); 
    
initial 
begin
    $monitor("time = %0t || input = %0b || output = %0b", $time, in_bit, out);
    $dumpfile("Moore110.vcd");
    $dumpvars;
        clk = 1'b0; 
        reset = 1'b1;  
        #15 reset = 1'b0;  
end 

always #5 clk = ~ clk;  

initial  
begin
        #15 in_bit = 0;#10 in_bit = 0 ; #10 in_bit = 1 ; #10 in_bit = 1 ;
        #10 in_bit = 0;#10 in_bit = 0 ; #10 in_bit = 1 ; #10 in_bit = 1 ;
        #10 in_bit = 0;#10 in_bit = 0 ; #10 in_bit = 0 ; #10 in_bit = 1 ; 
        #10 in_bit = 1;#10 in_bit = 1 ; #10 in_bit = 0 ; #10 in_bit = 0 ; 
        #10 $finish; 
end 

endmodule
