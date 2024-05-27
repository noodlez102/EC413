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

//full adder using the built in gates but you can change it to use the defined gates from before

module FA4b(c_out, sum, a, b, c_in);
input[3:0]		a, b; //declare inputs a, b and c_in, 1 bit each
input       c_in;
output	c_out;
output[3:0]  sum; //declare outputs c_out and sum, 1 bit each

wire        cout1,cout2,cout3;
    	FA_str_gate FA (
		.c_out(cout1), 
		.sum(sum[0]), 
		.a(a[0]), 
		.b(b[0]), 
		.c_in(c_in)
	);	
	FA_str_gate FA2 (
		.c_out(cout2), 
		.sum(sum[1]), 
		.a(a[1]), 
		.b(b[1]), 
		.c_in(cout1)
	);	
	FA_str_gate FA3 (
		.c_out(cout3), 
		.sum(sum[2]), 
		.a(a[2]), 
		.b(b[2]), 
		.c_in(cout2)
	);
		FA_str_gate FA4(
		.c_out(c_out), 
		.sum(sum[3]), 
		.a(a[3]), 
		.b(b[3]), 
		.c_in(cout3)
	);

endmodule
