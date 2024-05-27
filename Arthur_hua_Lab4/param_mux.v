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

module param_mux(select, a, b, out);

	parameter n=4;

	input[n-1:0]	 a,b;
	input select;
	output[n-1:0]     out; //declare outputs c_out and sum, one bit each
	
	assign out = select ? b:a;

endmodule