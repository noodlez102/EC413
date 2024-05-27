`timescale 1ns / 1ps




`define	D		0	// definition of the delay



module xorgate(out, a, b);

input a, b;
output out;

assign y = a ^ b;

endmodule