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

//this is my ripple carry adder for the 64th bit by using 2 32 bit adder
module rca64(c_out, sum, a, b, c_in);
input[63:0]		a, b; //declare inputs a, b and c_in, 1 bit each
input       c_in;
output	c_out;
output[63:0]  sum; //declare outputs c_out and sum, 1 bit each

wire        cout1,cout2,cout3;
    	FA32b FA (
		.c_out(cout1), 
		.sum(sum[31:0]), 
		.a(a[31:0]), 
		.b(b[31:0]), 
		.c_in(c_in)
	);	
	FA32b FA2 (
		.c_out(c_out), 
		.sum(sum[63:32]), 
		.a(a[63:32]), 
		.b(b[63:32]), 
		.c_in(cout1)
	);	

endmodule
