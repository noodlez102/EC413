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


module FA16b(c_out, sum, a, b, c_in);
input[15:0]		a, b; //declare inputs a, b and c_in, 1 bit each
input       c_in;
output	c_out;
output[15:0]  sum; //declare outputs c_out and sum, 1 bit each

wire        cout1,cout2,cout3;
    	FA4b FA (
		.c_out(cout1), 
		.sum(sum[3:0]), 
		.a(a[3:0]), 
		.b(b[3:0]), 
		.c_in(c_in)
	);	
	FA4b FA2 (
		.c_out(cout2), 
		.sum(sum[7:4]), 
		.a(a[7:4]), 
		.b(b[7:4]), 
		.c_in(cout1)
	);	
	FA4b FA3 (
		.c_out(cout3), 
		.sum(sum[11:8]), 
		.a(a[11:8]), 
		.b(b[11:8]), 
		.c_in(cout2)
	);
		FA4b FA4(
		.c_out(c_out), 
		.sum(sum[15:12]), 
		.a(a[15:12]), 
		.b(b[15:12]), 
		.c_in(cout3)
	);

endmodule
