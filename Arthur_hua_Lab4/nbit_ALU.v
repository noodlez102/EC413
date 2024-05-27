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

module nbit_ALU(select, r2,r3, c_in, out);

	parameter n=4;

	input[n-1:0] r2,r3;
	input c_in;
	input[2:0] select;
	output[n:0] out; //declare outputs c_out and sum, one bit each
	
	wire [n:0] carry;
	assign carry[0] = c_in;
	
	//loops through each bit preforming the specific operation on it depending on the selection bit. stores and uses the c_out for each iteration into the nxt interation and at the end it puts it in the from of the answer.

	genvar i;
	generate
	for (i=0; i<n;i=i+1) begin:ALUblk
		ALU1bit Mathing(.select(select), .out(out[i]), .r2(r2[i]),.r3(r3[i]),.c_in(carry[i]), .c_out(carry[i+1]));
	end
endgenerate

assign out[n] = (select == 3'b011) ? {~carry[n]} : {carry[n]};	//this is where it adds it to the fromt of the answer
	
endmodule