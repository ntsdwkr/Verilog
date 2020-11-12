module Mealy_1011(in_bit,clk,reset,out);
input in_bit,clk,reset;
output reg out;

parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;
reg [1:0] PS,NS ;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS ;
        end             

    always@(PS or in_bit)
        begin 
            
            case(PS)
                S0 : begin 
                            out = 0 ;
                            NS = in_bit ? S1 : S0 ;
                        end
                S1 : begin 
                            out = 0 ;
                            NS = in_bit ? S1 : S2 ;
                        end
                S2 : begin 
                            out = 0 ;
                            NS = in_bit ? S3 : S0 ;
                        end 
                S3 : begin 
                            out = in_bit ? 1 : 0 ; 
                            NS = in_bit ? S1 : S2 ;
                        end
            
            endcase
        end
endmodule
