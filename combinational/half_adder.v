module 	ha_sl(s,c,x,y); 

    input x,y;    output s,c;

            and and1 (c,x,y);          xor xor1 (s,x,y);

endmodule

module xor_gate(a1, b1, c1);

input a1, b1;output c1;

assign c1 = a1 ^ b1;

endmodule  //AND gate

module and_gate(a2, b2, c2);

input a2, b2; output c2; 

assign c2 = a2 & b2; 

endmodule
