`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 06:36:52 PM
// Design Name: 
// Module Name: Verification_1bit2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Verification_Nbit(c_out, sum, not_a, a, b, c_in, select, final_out);

	parameter n=16;

	input[n-1:0]	 a, b;
	input  c_in, select; //declare inputs a, b, and c_in, one bit each
	output c_out;
	output[n:0]     sum; //declare outputs c_out and sum, one bit each
	output[n:0]     not_a, final_out;
	
	
	assign {c_out, sum} = a + b + c_in;
	assign not_a = {~a,1'b1};
	assign final_out = select ?  not_a: {sum,c_out};
	
	

endmodule