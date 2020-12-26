module que2_moore(in_bit,clk,reset,out);
input clk,reset,in_bit;
output reg out;
parameter S0=0,S1=1,S2=2,S3=3;
reg [1:0] PS,NS;

always@(posedge clk or posedge reset)
begin 
if(reset)
PS <= S0;   
else      
PS <= NS; 
end             

always@(PS or in_bit)
begin            
case(PS)
   S0 : begin 
   NS = in_bit ? S1 : S0 ;
   end
   S1 : begin 
   NS = in_bit ? S2 : S0 ;
   end
   S2 : begin 
   NS = in_bit ? S2 : S3 ;
   end 
   S3 : begin 
   NS = in_bit ? S1 : S0 ;
   end  

   default NS = S0;  
endcase
end

always@(PS)
begin
  case(PS)
  S0 : out = 0;
  S1 : out = 0;
  S2 : out = 0;
  S3 : out = 1; 

  default out = 0; 
  endcase
end
endmodule
