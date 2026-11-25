module HS_POS(D,Br,A,B);

input A,B;

output D,Br; 

wire w1,w2,w3, ABar,BBar;

not not1(ABar,A); 

not not2(BBar,B);

or or1(w1,A,B);

            or or2(w2,ABar,Bar);

            or or3(w3,ABar,B);

            and and1(D,w1,w2);

            and and2(Br,w1,w3,w2);

endmodule


