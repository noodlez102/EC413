module compare(hex, new_hex);
    input [15:0] hex;
    output reg [15:0] new_hex;

    always @(hex)
	begin
	  if (hex > 16'h000F)
		new_hex = new_hex - 16'h000F;
	  else
		new_hex = hex;
	end

endmodule