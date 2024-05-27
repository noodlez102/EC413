`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    ALU1bit 
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

module ALU1bit(select, out, r2,r3,c_in,c_out);

	input r2,r3,c_in; 
	input[2:0] select;
	output out, c_out;  
	
	wire mov1, not1,add1,sub1,or1,and1,cout_add,cout_sub,notr3, carryOut, c_in_for_sub;
	
	assign add_sub_sel = (select == 3'b011);
	//assign c_in_for_sub = (select == 3'b011) ? c_in : 1'b1;
	
	assign c_out = (select == 3'b011 || select == 3'b010) ? {carryOut} : {c_in};
	
	mov_bit moving(.in(r2),.out(mov1));		//mov bit operation
	not_bit notting(.in(r2),.out(not1));		//uses a not gate
	not nottingb(notr3, r3);			//nots r3 for use in the subtraction operation
	FA_str adding(.c_out(cout_add), .sum(add1), .a(r2), .b(r3), .c_in(c_in));	//adding using the Full adder that was provided
	FA_str subtracting(.c_out(cout_sub), .sum(sub1), .a(r2), .b(notr3), .c_in(c_in));	//subtracts using the full adder but uses notr3 instead so it's minus
	or_bit oring(.out(or1),.r2(r2),.r3(r3)); //or
	and_bit anding(.out(and1),.r2(r2),.r3(r3));	//and	
	mux1bit add_vs_sub(select, cout_add, cout_sub, carryOut);	//choses either the c_out from addition or subtraction based on selection bit
	ALU_mux choosing(.select(select), .out(out), .mov1(mov1), .not1(not1),.add1(add1),.sub1(sub1),.or1(or1),.and1(and1)); //choses which one to send out
	
	
endmodule
