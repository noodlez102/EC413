`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 06:04:02 PM
// Design Name: 
// Module Name: FA4b
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
//32 bit adder, not too much to say about it it just uses the properties of ripple carry adders.

module FA32b(c_out, sum, a, b, c_in);
input[31:0]		a, b; //declare inputs a, b and c_in, 1 bit each
input       c_in;
output	c_out;
output[31:0]  sum; //declare outputs c_out and sum, 1 bit each

wire        cout1,cout2,cout3;
    	FA16b FA (
		.c_out(cout1), 
		.sum(sum[15:0]), 
		.a(a[15:0]), 
		.b(b[15:0]), 
		.c_in(c_in)
	);	
	FA16b FA2 (
		.c_out(c_out), 
		.sum(sum[31:16]), 
		.a(a[31:16]), 
		.b(b[31:16]), 
		.c_in(cout1)
	);	

endmodule
