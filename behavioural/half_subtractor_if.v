 module hs_IF( d, br,  a, b);      

  input wire a, b;   output reg d, br;

always @(a or b)

   begin 

    if(a==0 && b==0)       begin     d=0;  br=0;       end

       else if(a==0 && b==1)         begin d=1;  br=1;      end

      else if(a==1 && b==0)        begin  d=1;   br=0;       end

       else if(a==1 && b==1 )        begin  d=0;br=0;    end

end

endmodule


