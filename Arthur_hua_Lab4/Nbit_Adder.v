`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    dff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Nbit_Adder(c_out, sum, a, b, c_in);
	parameter n=8;
	input [n-1:0] a, b;
	input c_in;
	output c_out;
	output [n-1:0] sum;
	
	wire [n:0] carry;
	
	assign carry[0] = c_in;
	assign c_out = carry[n];
	
	genvar i;
	generate
	for (i=0; i<n;i=i+1) begin:adderblk
		FA_str Adder1Bit (carry[i+1],sum[i],a[i],b[i],carry[i]);
	end
endgenerate
endmodule
