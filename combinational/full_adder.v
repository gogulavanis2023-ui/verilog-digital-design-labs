module FullAdder(    input a,b,cin,     output sum,carry );

wire c,c1,s;

HA_SL_NAND ha0(s,c,a,b);

HA_SL_NAND ha1(sum,c1,cin,s);

or or1 (carry,c,c1);     // assign carry = c | c1 ;

                      endmodule


