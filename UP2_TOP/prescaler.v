module prescaler(
	input clkin,
	output reg clkout
);
reg [31:0] cntr;
always@(posedge clkin)
begin
	if(cntr < 25175000)
		cntr <= cntr + 1;
	else
		cntr <= 0;
	clkout <= cntr[24];
end

endmodule