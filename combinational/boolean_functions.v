module boolean_functions(Y1,Y2,Y3,Y4,A,B,C,D);
input A,B,C,D;
output Y1,Y2,Y3,Y4;
assign Y1=((~A&~C&~D)|(~A&~B&C)|(~A&C&D)|(~B&C&D)|(A&B&~D));
assign Y2=((~A&B&C&~D)|(A&~B&~D)|(A&B&D)|(~C&D));
assign Y3=((A|C|D)&(A|B|~C)&(A&~C&~D)&(B&~C&~D)&(~A&~B&D));
assign Y4=((A|~B|~C|D)&(~A|B|D)&(~A|~B|~D)&(C|~D));
endmodule
