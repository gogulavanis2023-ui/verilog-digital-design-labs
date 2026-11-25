 module FS_case(input wire x, y, z, output reg b, output reg d);

 always @(x or y or z)

  begin 

   case (x | y | z) 

   3'b000: begin b = 0; d = 0; end   

3'b001: begin b = 1; d =1; end  

3'b010: begin b = 1; d = 1; end 

   3'b011: begin b = 0; d =1; end  

  3'b100: begin b= 1; d = 0; end 

3'b101: begin b = 0; d = 0; end 

     3'b110: begin b = 0; d= 0; end   

  3'b111: begin b = 1; d = 1; end 

   endcase 

end

endmodule 
