`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    not_bit 
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

module ALU_mux(select, out, mov1, not1,add1,sub1,or1,and1);

	input mov1, not1,add1,sub1,or1,and1; 
	input [2:0] select;
	output reg out;    
	//based on the selection bit or instruction it choses which bit to return as the answer.
	
	always@(*)
	begin
	case(select)
	3'b000: out = mov1;
	3'b001: out = not1;
	3'b010: out = add1;
	3'b011: out = sub1;
	3'b100: out = or1;
	3'b101: out = and1;
	endcase
	end
	
endmodule
