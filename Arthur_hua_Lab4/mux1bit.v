`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    FA_str 
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
//also the mux for the carry selec adder except it for the cout
module mux1bit(select, a, b, carry);

input		a, b;
input[2:0] select; //declare inputs a, b and c_in, 1 bit each
output reg	carry; //declare outputs c_out and sum, 1 bit each

	//here to thelp me chose which c_out to carry over
always@(*)
begin
case(select)
3'b010: carry = a;
3'b011: carry = b;
default carry =1'b0;
endcase
end

endmodule
