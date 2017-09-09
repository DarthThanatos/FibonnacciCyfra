module start(
	input clock,
	input set,
	output reg sum,
	output reg carry
);

wire outQ1, outQ0;

regD Q1(.clk(clock), .set(set),.d(outQ0), .q(outQ1));
regD Q0(.clk(clock), .reset(set), .d(outQ0 ^ outQ1), .q(outQ0));

always@(posedge clock or posedge reset)
begin
	sum <= outQ1 ^ outQ0;
	carry <= outQ1 & outQ0;
	
end

endmodule