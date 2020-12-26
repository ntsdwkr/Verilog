//mealy 11010 sequence detector
module Mealy_11010(in_bit,clk,reset,out);
input clk,reset,in_bit;
output reg out;
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
reg [2:0] PS,NS; 

always @ (posedge clk or posedge reset)
begin
if(reset) PS <= S0;
else PS <= NS;
end

always @ (in_bit or PS)
begin
case(PS)
S0 : begin
NS <= in_bit ? S1 : S0;
out <= 0;
end
S1 : begin
NS <= in_bit ? S2 : S0;
out <= 0; 
end
S2 : begin
NS <= in_bit ? S2 : S3;
out <= 0;
end
S3 : begin
NS <= in_bit ? S4 : S0;
out <= 0;
end
S4 : begin
NS <= in_bit ? S2 : S0;
out <= in_bit ? 0 : 1;
end
default : begin
NS <= S0;
out <= 0;
end
endcase
end
endmodule
