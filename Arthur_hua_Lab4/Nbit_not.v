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

module Nbit_not(in,out);

	parameter n=16;

	input[n-1:0]	 in;
	output[n-1:0]     out; //declare outputs c_out and sum, one bit each

	genvar i;
	generate
	for (i=0; i<n;i=i+1) begin:notgate
		not notgates (out[i],in[i]);
	end
	endgenerate
endmodule