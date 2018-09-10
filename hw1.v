module demorgan1 //~A*~B
(
	input A,
	input B,
	output nA,
	output nB,
	output nAandnB
);
	
	wire nA;
	wire nB;
	not Ainv(nA, A);
	not Binv(nB, B);
	and andgate(nAandnB, nA, nB);
endmodule // demorgan1

module demorgan2 // ~(A + B)
(
	input A,
	input B,
	output AorB,
	output nAorB
);
	
	wire AorB;
	or orgate(AorB, A, B);
	not notgate(nAorB, AorB);
endmodule // demorgan2

module demorgan3 // ~A + ~B
(
	input A,
	input B,
	output nA,
	output nB,
	output nAornB
);
	wire nA;
	wire nB;
	not Ainv(nA, A);
	not Binv(nB, B);
	or  orgate(nAornB, nA, nB);
endmodule // demorgan3

module demorgan4 // ~(A*B)
(
	input A,
	input B,
	output AandB,
	output nAandB
);
	
	wire AandB;
	and andgate(AandB, A, B);
	not notgate(nAandB, AandB);
endmodule // demorgan4